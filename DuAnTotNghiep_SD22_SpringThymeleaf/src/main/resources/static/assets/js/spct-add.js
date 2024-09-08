
document.querySelector('.custom-btn').addEventListener('click', function (event) {
    event.preventDefault();
});


$(document).ready(function () {
    var selectedColors = [];
    var selectedSizes = [];
    var colorImages = {};

    function clickCreateProductButton() {
        $(".create-product-btn").click();
    }

    function displaySelectedItems(items, containerId) {
        var selectedItemsContainer = $(containerId);
        selectedItemsContainer.empty();

        items.forEach(function (item) {
            var itemWrapper = $('<div class="selected-item" data-id="' + item.id + '"></div>');
            var itemLabel = $("<label>" + item.name + "</label>");

            itemWrapper.append(itemLabel);
            selectedItemsContainer.append(itemWrapper);
        });
    }

    $("#saveSizes").click(function () {
        selectedSizes = [];
        $("#sizeList input:checked").each(function () {
            var sizeCheckbox = $(this);
            var sizeId = sizeCheckbox.val();
            var sizeName = sizeCheckbox.next("label").text();
            selectedSizes.push({
                id: sizeId,
                name: sizeName,
            });
        });

        displaySelectedItems(selectedSizes, "#selectedSizes");
        $("#sizeModal").modal("hide");
    });

    $("#saveColors").click(function () {
        selectedColors = [];
        $("#colorList input:checked").each(function () {
            var colorCheckbox = $(this);
            var colorId = colorCheckbox.val();
            var colorHex = colorCheckbox.data("color");
            selectedColors.push({
                id: colorId,
                color: colorHex,
                name: colorHex
            });
        });

        var container = $("#selectedColors");
        container.empty();

        selectedColors.forEach(function (item) {
            var colorBox = $('<span></span>')
                .addClass('color-box')
                .css('background-color', item.color);

            container.append(colorBox);
        });

        $("#colorModal").modal("hide");
    });

    function sinhMaNgauNhien() {
        const prefix = "SPCT";
        const soNgauNhien = Math.floor(100000 + Math.random() * 900000);
        return prefix + soNgauNhien;
    }

    function uniqueMa(ma, usedMa) {
        return !usedMa.includes(ma);
    }

    function sinhMaDuyNhat(usedMa) {
        let ma = sinhMaNgauNhien();
        while (!uniqueMa(ma, usedMa)) {
            ma = sinhMaNgauNhien();
        }
        return ma;
    }

    function dinhDangGia(gia) {
        if (isNaN(gia)) {
            return "";
        }
        return Number(gia).toLocaleString('vi-VN') + ' VNĐ';
    }

    function uploadImage(file, colorId) {
        var formData = new FormData();
        formData.append('file', file);
        formData.append('upload_preset', 'hwsotqf9');

        return $.ajax({
            url: 'https://api.cloudinary.com/v1_1/deapopcoc/image/upload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false
        }).done(function (response) {
            if (response && response.secure_url) {
                colorImages[colorId] = response.secure_url;
            } else {
                console.error("Không có secure_url trong phản hồi:", response);
            }
        }).fail(function (jqXHR, textStatus, errorThrown) {
            console.error("Lỗi khi tải ảnh:", textStatus, errorThrown);
        });
    }

    function getChiTietSanPhams() {
        const sanPhamId = $("#sanPham").val();
        const coGiayId = $("#coGiay").val();
        const deGiayId = $("#deGiay").val();
        const chatLieuId = $("#chatLieu").val();
        const nhaSanXuatId = $("#nhaSanXuat").val();
        const moTa = $("#moTa").val();

        if (!sanPhamId || sanPhamId === "Chọn sản phẩm" ||
            !coGiayId || coGiayId === "Chọn cỡ giày" ||
            !deGiayId || deGiayId === "Chọn đế giày" ||
            !chatLieuId || chatLieuId === "Chọn chất liệu" ||
            !nhaSanXuatId || nhaSanXuatId === "Chọn nhà sản xuất" ||
            selectedColors.length === 0 || selectedSizes.length === 0) {
            $("#validationModal").modal("show");
            return;
        }

        const usedMa = [];
        const chiTietSanPhams = [];
        const nameProduct = $("#sanPham option:selected").text();

        selectedColors.forEach((mauSac) => {
            selectedSizes.forEach((kichCo) => {
                const ma = sinhMaDuyNhat(usedMa);
                usedMa.push(ma);
                const chiTietSanPham = {
                    ma: ma,
                    ten: nameProduct,
                    barcode: "",
                    sanPham: {id: sanPhamId, name: nameProduct},
                    coGiay: {id: coGiayId},
                    deGiay: {id: deGiayId},
                    chatLieu: {id: chatLieuId},
                    nhaSanXuat: {id: nhaSanXuatId},
                    moTa: moTa,
                    mauSac: {id: mauSac.id, name: mauSac.name},
                    kichCo: {id: kichCo.id, name: kichCo.name},
                    ngayTao: new Date().toISOString(),
                    ngayCapNhat: "",
                    nguoiTao: "admin",
                    nguoiCapNhat: "",
                    canNang: 500,
                    giaBan: 1000000,
                    soLuong: 10,
                    trangThai: 1,
                    ngaySanXuat: null,
                    anh: colorImages[mauSac.id] || ""
                };
                chiTietSanPhams.push(chiTietSanPham);
            });
        });

        return chiTietSanPhams;
    }

    function updateProductImages(products) {
        products.forEach((product) => {
            if (colorImages[product.mauSac.id]) {
                product.anh = colorImages[product.mauSac.id];
            } else {
                console.warn(`Không tìm thấy URL cho màu ${product.mauSac.id}`);
            }
        });
    }

    $(".create-product-btn").click(function () {
        var chiTietSanPhams = getChiTietSanPhams();
        var allUploads = [];

        selectedColors.forEach(function (color) {
            var input = $(`#file-upload-${color.id}`)[0];
            if (input && input.files && input.files.length > 0) {
                var file = input.files[0];
                allUploads.push(uploadImage(file, color.id));
            }
        });

        Promise.all(allUploads).then(() => {
            updateProductImages(chiTietSanPhams);

            displayProductDetails(chiTietSanPhams);
        }).catch((error) => {
            console.error("Lỗi khi tải ảnh:", error);
        });
    });

    function displayProductDetails(chiTietSanPhams) {
        const colorGroups = chiTietSanPhams.reduce((groups, product) => {
            const {mauSac} = product;
            if (!groups[mauSac.id]) {
                groups[mauSac.id] = [];
            }
            groups[mauSac.id].push(product);
            return groups;
        }, {});

        const productDetailsContainer = $("#productDetails");
        productDetailsContainer.empty();

        Object.entries(colorGroups).forEach(([mauSacId, products]) => {
            const tenMauBienThe = products[0].mauSac.name;
            const colorTitle = $('<h2 class="mt-2" style="font-weight: bold;"></h2>')
                .html(`Danh sách sản phẩm có màu <span style="display: inline-block; width: 40px; height: 40px; background-color: ${tenMauBienThe}; border-radius: 5px; border: 1px solid #ccc;"></span>`);
            const tableWrapper = $('<div class="table-wrapper"></div>');
            const table = $('<table class="table table-bordered"></table>');
            const thead = $("<thead></thead>").html(`
            <tr>
                <th scope="col" style="width: 15%">Tên sản phẩm</th>
                <th scope="col" style="width: 15%">Màu</th>
                <th scope="col" style="width: 15%">Kích cỡ</th>
                <th scope="col" style="width: 15%">Cân nặng</th>
                <th scope="col" style="width: 15%">Giá bán</th>
                <th scope="col" style="width: 10%">Số lượng</th>
                <th scope="col" style="width: 10%">Hành động</th>
            </tr>
        `);
            const tbody = $('<tbody></tbody>');

            products.forEach((product, index) => {
                const row = $('<tr></tr>').html(`
                <td>${product.ten}</td>
                <td><span style="display: inline-block; width: 40px; height: 40px; background-color: ${product.mauSac.name}; border-radius: 5px; border: 1px solid #ccc;"></span></td><td>${product.kichCo.name}</td>
                <td><input type="text" class="product-input" value="${product.canNang}" data-index="${index}" data-field="canNang" /></td>
                <td><input type="text" class="product-input" value="${dinhDangGia(product.giaBan)}" data-index="${index}" data-field="giaBan" /></td>
                <td><input type="text" class="product-input" value="${product.soLuong}" data-index="${index}" data-field="soLuong"/></td>
                <td><a class="delete-product"><i class="fa fa-trash"></i></a></td>
            `);
                row.find('.product-input').on('input', function () {
                    const index = $(this).data('index');
                    const field = $(this).data('field');
                    let value = $(this).val();

                    switch (field) {
                        case 'canNang':
                            chiTietSanPhams[index].canNang = value;
                            break;
                        case 'giaBan':
                            value = value.replace(/[^\d]/g, '');
                            chiTietSanPhams[index].giaBan = Number(value);
                            $(this).val(dinhDangGia(value));
                            break;
                        case 'soLuong':
                            chiTietSanPhams[index].soLuong = value;
                            break;
                        default:
                            console.warn('Unknown field:', field);
                            break;
                    }
                });

                row.find('.delete-product').on('click', function () {
                    chiTietSanPhams.splice(index, 1);

                    row.remove();

                    if (tbody.children().length === 0) {
                        tableWrapper.remove();
                    }
                });
                tbody.append(row);
            });

            const uploadRow = $('<tr class="image-upload-row"></tr>').html(`
            <td colspan="7">
                <div class="image-upload">
                    <label for="file-upload-${mauSacId}" class="custom-file-upload">
                        <i class="fa fa-cloud-upload"></i> Tải ảnh
                    </label>
                    <input id="file-upload-${mauSacId}" type="file" />
                    <div class="preview" id="preview-${mauSacId}"></div>
                </div>
            </td>
        `);
            tbody.append(uploadRow);

            table.append(thead);
            table.append(tbody);

            tableWrapper.append(colorTitle);
            tableWrapper.append(table);

            productDetailsContainer.append(tableWrapper);

            tableWrapper.find(`#file-upload-${mauSacId}`).on("change", function () {
                var files = $(this).get(0).files;
                var preview = $(this).closest('.table-wrapper').find(`#preview-${mauSacId}`);
                if (files.length > 0) {
                    var file = files[0];
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        clickCreateProductButton();
                        var image = $('<img>').attr('src', e.target.result).addClass('preview-img');
                        preview.empty().append(image);
                    };
                    reader.readAsDataURL(file);
                }
            });

            if (colorImages[mauSacId]) {
                var preview = $(`#preview-${mauSacId}`);
                var image = $('<img>').attr('src', colorImages[mauSacId]).addClass('preview-img');
                preview.empty().append(image);
            }
        });

        const saveButton = $('<button class="btn btn-success mt-3 mb-4">Lưu</button>');
        saveButton.click(function () {

            const jsonFormatted = JSON.stringify(chiTietSanPhams);
            console.log("Dữ liệu gửi đi:", jsonFormatted);

            fetch("/api/san-pham-chi-tiet/save", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: jsonFormatted,
            })
                .then((response) => {
                    if (!response.ok) {
                        return response.json().then((error) => {
                            throw new Error(error.message);
                        });
                    }
                    return response.json();
                })
                .then((data) => {
                    console.log("Thông tin được lưu:", data);
                    alert("Lưu thông tin sản phẩm chi tiết thành công!");
                    window.location.href = "/admin/san-pham";
                })
                .catch((error) => {
                    console.error("Lỗi khi lưu thông tin sản phẩm chi tiết:", error);
                    alert("Đã xảy ra lỗi khi lưu thông tin sản phẩm chi tiết. Vui lòng thử lại sau.");
                });
        });
        productDetailsContainer.append(saveButton);
    }
});
