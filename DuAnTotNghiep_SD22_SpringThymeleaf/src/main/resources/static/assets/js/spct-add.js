$(document).ready(function() {
    $('#saveSizes').click(function() {
        var selectedSizes = [];
        $('#sizeList input:checked').each(function() {
            var sizeCheckbox = $(this);
            var sizeId = sizeCheckbox.val();
            var sizeName = sizeCheckbox.next('label').text();
            selectedSizes.push({
                id: sizeId,
                name: sizeName
            });
        });

        displaySelectedItems(selectedSizes, '#selectedSizes');

        $('#sizeModal').modal('hide');
    });

    $('#saveColors').click(function() {
        var selectedColors = [];
        $('#colorList input:checked').each(function() {
            var colorCheckbox = $(this);
            var colorId = colorCheckbox.val();
            var colorName = colorCheckbox.next('label').text();
            selectedColors.push({
                id: colorId,
                name: colorName
            });
        });

        displaySelectedItems(selectedColors, '#selectedColors');

        $('#colorModal').modal('hide');
    });

    function displaySelectedItems(items, containerId) {
        var selectedItemsContainer = $(containerId);
        selectedItemsContainer.empty();

        items.forEach(function(item) {
            var itemWrapper = $('<div class="selected-item" data-id="' + item.id + '"></div>');
            var itemLabel = $('<label>' + item.name + '</label>');

            itemWrapper.append(itemLabel);
            selectedItemsContainer.append(itemWrapper);
        });
    }

    $('.create-product-btn').click(function () {
        const sanPhamId = $('#sanPham').val();
        const coGiayId = $('#coGiay').val();
        const deGiayId = $('#deGiay').val();
        const chatLieuId = $('#chatLieu').val();
        const nhaSanXuatId = $('#nhaSanXuat').val();
        const moTa = $('#moTa').val();

        const selectedColors = $('#selectedColors .selected-item').map(function() {
            return {
                id: $(this).data('id'),
                name: $(this).find('label').text()
            };
        }).get();

        const selectedSizes = $('#selectedSizes .selected-item').map(function() {
            return {
                id: $(this).data('id'),
                name: $(this).find('label').text()
            };
        }).get();

        const chiTietSanPhams = [];
        selectedColors.forEach(mauSac => {
            selectedSizes.forEach(kichCo => {
                const chiTietSanPham = {
                    ma: '',
                    ten: '',
                    barcode: '',
                    sanPham: { id: sanPhamId, name: $('#sanPham option:selected').text() },
                    coGiay: { id: coGiayId },
                    deGiay: { id: deGiayId },
                    chatLieu: { id: chatLieuId },
                    nhaSanXuat: { id: nhaSanXuatId },
                    moTa: moTa,
                    mauSac: { id: mauSac.id, name: mauSac.name },
                    kichCo: { id: kichCo.id, name: kichCo.name },
                    ngayTao: new Date().toISOString(),
                    ngayCapNhat: '',
                    nguoiTao: 'admin',
                    nguoiCapNhat: '',
                    canNang: 500,
                    giaBan: 1000000,
                    soLuong: 10
                };
                chiTietSanPhams.push(chiTietSanPham);
            });
        });

        const colorGroups = chiTietSanPhams.reduce((groups, product) => {
            const { mauSac } = product;
            if (!groups[mauSac.id]) {
                groups[mauSac.id] = [];
            }
            groups[mauSac.id].push(product);
            return groups;
        }, {});

        const productDetailsContainer = $('#productDetails');
        productDetailsContainer.empty();

        Object.entries(colorGroups).forEach(([mauSacId, products]) => {
            const tenMauBienThe = products[0].mauSac.name;
            const colorTitle = $('<h5 class="mt-3"></h5>').text(`Danh sách sản phẩm có màu ${tenMauBienThe}`);
            productDetailsContainer.append(colorTitle);

            const table = $('<table class="table table-bordered"></table>');
            const thead = $('<thead></thead>').html(`
                <tr>
                    <th scope="col" style="width: 20%">Tên sản phẩm</th>
                    <th scope="col" style="width: 15%">Màu</th>
                    <th scope="col" style="width: 15%">Kích cỡ</th>
                    <th scope="col" style="width: 15%">Cân nặng</th>
                    <th scope="col" style="width: 15%">Giá bán</th>
                    <th scope="col" style="width: 15%">Số lượng</th>
                    <th scope="col" style="width: 15%">Upload ảnh</th>
                </tr>
            `);
            const tbody = $('<tbody></tbody>');

            products.forEach(product => {
                const row = $('<tr></tr>').html(`
                    <td style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">${product.sanPham.name}</td>
                    <td>${product.mauSac.name}</td> // Hiển thị tên thay vì id
                    <td>${product.kichCo.name}</td> // Hiển thị tên thay vì id
                    <td><input type="text" value="${product.canNang}" class="form-control" style="width: 80px;"></td>
                    <td><input type="text" value="${product.giaBan}" class="form-control" style="width: 120px;"></td>
                    <td><input type="text" value="${product.soLuong}" class="form-control" style="width: 60px;"></td>
                    <th class="image"></th>
                `);

                tbody.append(row);
            });

            const uploadRow = $('<tr></tr>').html(`
                <td rowspan="${products.length}">
                    <form>
                        <input type="file" class="form-control-file">
                        <button type="submit" class="btn btn-primary btn-sm mt-1">Upload ảnh</button>
                    </form>
                </td>
            `);

            table.append(thead);
            table.append(tbody);
            table.find('.image').append(uploadRow);
            productDetailsContainer.append(table);
        });

        const saveButton = $('<button class="btn btn-success mt-3 mb-4">Lưu</button>');
        saveButton.click(function() {
            const jsonFormatted = JSON.stringify(chiTietSanPhams);
            console.log('Payload to be sent:', jsonFormatted);

            fetch('/api/san-pham-chi-tiet/save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: jsonFormatted
            })
                .then(response => {
                    if (!response.ok) {
                        return response.json().then(error => { throw new Error(error.message); });
                    }
                    return response.json();
                })
                .then(data => {
                    // Xử lý phản hồi từ server
                    console.log('Success:', data);
                    alert('Lưu thông tin sản phẩm chi tiết thành công!');
                })
                .catch((error) => {
                    console.error('Error:', error);
                    alert('Có lỗi xảy ra khi lưu thông tin sản phẩm chi tiết.');
                });
        });

        productDetailsContainer.append(saveButton);
    });
});
