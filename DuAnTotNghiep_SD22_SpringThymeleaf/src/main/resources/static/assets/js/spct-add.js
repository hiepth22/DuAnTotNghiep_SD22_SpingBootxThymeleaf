$(document).ready(function () {
    var selectedColors = [];
    var selectedSizes = [];

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

    $(".create-product-btn").click(function () {
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
                    sanPham: {
                        id: sanPhamId,
                        name: nameProduct,
                    },
                    coGiay: { id: coGiayId },
                    deGiay: { id: deGiayId },
                    chatLieu: { id: chatLieuId },
                    nhaSanXuat: { id: nhaSanXuatId },
                    moTa: moTa,
                    mauSac: { id: mauSac.id, name: mauSac.name },
                    kichCo: { id: kichCo.id, name: kichCo.name },
                    ngayTao: new Date().toISOString(),
                    ngayCapNhat: "",
                    nguoiTao: "admin",
                    nguoiCapNhat: "",
                    canNang: 500,
                    giaBan: 1000000,
                    soLuong: 10,
                    trangThai: 1,
                    ngaySanXuat : null,
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

        const productDetailsContainer = $("#productDetails");
        productDetailsContainer.empty();

        Object.entries(colorGroups).forEach(([mauSacId, products]) => {
            const tenMauBienThe = products[0].mauSac.name;
            console.log("màu :", tenMauBienThe);
            const colorTitle = $('<h5 class="mt-3"></h5>').text(`Danh sách sản phẩm có màu ${tenMauBienThe}`)
                .attr('style', 'font-weight: bold; font-size: 1.25rem; margin-top: 1rem;');
            const tableWrapper = $('<div class="table-wrapper"></div>');
            const table = $('<table class="table table-bordered"></table>');
            const thead = $("<thead></thead>").html(`
                <tr>
                    <th scope="col" style="width: 20%">Tên sản phẩm</th>
                    <th scope="col" style="width: 15%">Màu</th>
                    <th scope="col" style="width: 15%">Kích cỡ</th>
                    <th scope="col" style="width: 15%">Cân nặng</th>
                    <th scope="col" style="width: 15%">Giá bán</th>
                    <th scope="col" style="width: 15%">Số lượng</th>
                    <th scope="col" style="width: 10%">Action</th>
                </tr>
            `);
            const tbody = $("<tbody></tbody>");

            products.forEach((product) => {
                const row = $("<tr></tr>").html(`
                    <td>${product.sanPham.name}</td>
                    <td><span class="color-box" style="background-color: ${product.mauSac.name};"></span></td>
                    <td>${product.kichCo.name}</td>
                    <td>
                        <input type="text" value="${product.canNang}" class="form-control" style="width: 90px;">
                        <span class="error-message" style="color: red; display: none;"></span>
                    </td>
                    <td>
                        <input type="text" value="${dinhDangGia(product.giaBan)}" class="form-control" style="width: 170px;">
                        <span class="error-message" style="color: #ff0000; display: none;"></span>
                    </td>
                    <td>
                        <input type="text" value="${product.soLuong}" class="form-control" style="width: 50px;">
                        <span class="error-message" style="color: red; display: none;"></span>
                    </td>
                    <td><a class="delete-product"><i class="fa fa-trash"></i></a></td>
                `);
                tbody.append(row);
            });

            const uploadRow = $('<tr class="image-upload-row"></tr>').html(`
                <td colspan="7">
                    <div class="image-upload">
                        <label for="file-upload-${mauSacId}" class="custom-file-upload">
                            <i class="fa fa-cloud-upload"></i> Tải ảnh
                        </label>
                        <input id="file-upload-${mauSacId}" type="file" multiple />
                        <div class="preview" id="preview-${mauSacId}"></div>
                    </div>
                </td>
            `);
            tbody.append(uploadRow);

            table.append(thead);
            table.prepend(tbody);

            tableWrapper.append(colorTitle);
            tableWrapper.append(table);

            productDetailsContainer.append(tableWrapper);

            tableWrapper.find('input[type="text"]').off("change").on("change", function () {
                const input = $(this);
                const value = input.val();
                const row = input.closest("tr");
                const index = row.index();
                const property = input.closest("td").index();

                switch (property) {
                    case 3:
                        products[index].canNang = value;
                        break;
                    case 4:
                        products[index].giaBan = value.replace(/\D/g, '');
                        input.val(dinhDangGia(products[index].giaBan));
                        break;
                    case 5:
                        products[index].soLuong = value;
                        break;
                    default:
                        break;
                }
            });

            tableWrapper.find(`#file-upload-${mauSacId}`).on("change", function () {
                var files = $(this).get(0).files;
                var preview = $(this).closest('.table-wrapper').find(`#preview-${mauSacId}`);
                var fileArray = Array.from(files);

                fileArray.forEach((file, index) => {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        var image = $('<img>').attr('src', e.target.result).addClass('preview-img');
                        preview.append(image);
                    };
                    reader.readAsDataURL(file);
                });
            });
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
                    alert(
                        "Đã xảy ra lỗi khi lưu thông tin sản phẩm chi tiết. Vui lòng thử lại sau."
                    );
                });
        });

        productDetailsContainer.append(saveButton);


    });
});
