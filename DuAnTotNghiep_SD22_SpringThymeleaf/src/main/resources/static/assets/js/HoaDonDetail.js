$(document).ready(function () {

    const pathArray = window.location.pathname.split('/');
    const idHoaDon = pathArray[pathArray.length - 1];

    var $editDiaChi = $('#edit-diachi');
    var $editTinhThanh = $('#edit-tinhthanh');
    var $editQuanHuyen = $('#edit-quanhuyen');
    var $editPhuongXa = $('#edit-phuongxa');
    var citiesData = [];


    const formatVND = (tongtien) => {
        return tongtien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + ' VNĐ';
    }

    function hienThiThongTinHoaDon(hd) {
        $('#maHoaDon').html(`
            <h1 class="text-xl mt-3 ml-3 mb-4 font-bold">Thông tin đơn hàng: <span class="font-normal">${hd.ma}</span></h1>
        `);

        $('#thongTinHoaDon').html(`
            <span class="flex items-center w-[99%] m-auto">
                <span class="h-px flex-1 bg-gray-500"></span>
                <span class="h-px flex-1 bg-gray-500"></span>
            </span>
            <div class="grid gap-4 grid-cols-2">
                <div>
                    <h1 class="ml-4 mt-3 font-bold">Trạng thái: <span class="bg-blue-400 hover:bg-blue-700 text-white py-2 px-4 rounded-full font-normal ml-10">${trangThai(hd.trangThai)}</span></h1>
                </div>
                <div>
                    <h1 class="mt-3 font-bold">Tên khách hàng: <span class="font-normal ml-10">${hd.nguoiNhan}</span></h1>
                </div>
                <div>
                    <h1 class="ml-4 mt-3 font-bold">Loại: <span class="font-normal ml-10">${trangThaiMua(hd.loai)}</span></h1>
                </div>
                <div>
                    <h1 class="font-bold">Số điện thoại: <span class="font-normal ml-10">${hd.sdtNguoiNhan}</span></h1>
                </div>
                <div>
                    <h1 class="ml-4 mt-3 font-bold">Địa chỉ: <span class="font-normal ml-10">${hd.diaChiNguoiNhan}</span></h1>
                </div>
                <div>
                    <h1 class="font-bold">Thời gian dự kiến nhận: <span class="font-normal ml-10">${hd.ngayNhan ? formatDate(hd.ngayNhan) : ''}</span></h1>
                </div>
                <div>
                    <h1 class="ml-4 font-bold">Ghi chú: <span class="font-normal ml-10">${hd.ghiChu}</span></h1>
                </div>
            </div>
        `);

        // $('#formThayDoiThongTin').html(`
        //
        // `);
    }

    function hienThiDanhSachSP(hdctList) {
        let danhSachSP = '';
        let tongTien = 0;

        hdctList.forEach((item, index) => {
            const tongTienSP = item.sanPhamChiTiet.giaBan * item.soLuong;
            tongTien += tongTienSP;
            danhSachSP += `
            <tr>
                <td class="px-6 py-4 whitespace-nowrap">${index + 1}</td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <img src="https://res.cloudinary.com/deapopcoc/image/upload/${item.sanPhamChiTiet.anh.ten}" alt="Image" class="w-16 h-auto">
                </td>
                <td class="px-6 py-4 whitespace-nowrap font-bold">
                    <h1>${item.sanPhamChiTiet.ten}</h1>
                    <h2 class="text-red-600">${formatVND(item.sanPhamChiTiet.giaBan)}</h2>
                    <h3> kích cỡ: ${item.sanPhamChiTiet.kichCo.ten}</h3>
                </td>
                <td>
                    <div class="color-container rounded-lg ml-5 border-3" style="background-color: ${item.sanPhamChiTiet.mauSac.ten}; width: 50px; height: 20px;"></div>
                </td>
                <td>
                    <div class="flex items-center">
                        <input type="number" class="soLuong-input bg-gray-100 w-[30%] border border-gray-300 rounded-md px-2 py-1" value="${item.soLuong}" min="1" data-id="${item.id}" id="soLuong-${item.id}" name="soLuong-${item.id}">
                    </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">${formatVND(tongTienSP)}</td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <span class="bg-green-500 rounded-lg text-white">${trangThaiSanPham(item.trangThai)}</span>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <button class="deleteSP" data-id="${item.id}" id="xoaSP-${item.id}">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="size-7" style="color: #B94A00">
                            <path fill-rule="evenodd" d="M7.22 3.22A.75.75 0 0 1 7.75 3h9A2.25 2.25 0 0 1 19 5.25v9.5A2.25 2.25 0 0 1 16.75 17h-9a.75.75 0 0 1-.53-.22L.97 10.53a.75.75 0 0 1 0-1.06l6.25-6.25Zm3.06 4a.75.75 0 1 0-1.06 1.06L10.94 10l-1.72 1.72a.75.75 0 1 0 1.06 1.06L12 11.06l1.72 1.72a.75.75 0 1 0 1.06-1.06L13.06 10l1.72-1.72a.75.75 0 0 0-1.06-1.06L12 8.94l-1.72-1.72Z" clip-rule="evenodd" />
                        </svg>
                    </button>
                </td>
            </tr>`;
        });

        $('#tbodyHoaDonChiTiet').html(danhSachSP);
        return tongTien;

    }


    function hienThiTongTienChiTiet(tongTien, hd) {
        const tongTienThanhToan = tongTien + hd.tienShip;

        $('#tongTienChiTiet').html(`
            <div>
                <span class="text-lg ">Tổng tiền hàng: <span class="text-lg ml-[11%] text-blue-700">${formatVND(tongTien)}</span></span>
            </div>

            <div>
                <span  class="text-lg">Phí vận chuyển: <span class="text-lg ml-20 font-normal">${formatVND(hd.tienShip)}</span></span>
            </div>
            <span class="flex items-center w-[99%] m-auto">
                <span class="h-px flex-1 bg-gray-500"></span>
                <span class="h-px flex-1 bg-gray-500"></span>
            </span>
            <div>
                <span  class="text-lg">Tổng tiền thanh toán: <span class="text-lg ml-8 text-blue-700 text-no">${formatVND(tongTienThanhToan)}</span></span>
            </div>
        `);
    }

    $('#tbodyHoaDonChiTiet').on('change', '.soLuong-input', function () {
        const id = $(this).data('id');
        const SoLuongMoi = $(this).val();

        $.ajax({
            url: `/api/hoa-don/update-so-luong/${id}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({id: id, soLuong: SoLuongMoi}),
            success: function (response) {
                fetchHoaDonDetail(idHoaDon);
            },
            error: function (xhr, status, error) {
                console.error('Lỗi khi cập nhật số lượng sản phẩm:', error);
            }
        });
    });


    function xoaSanPham(idHoaDon) {
        $('.deleteSP').on('click', function () {
            const itemId = $(this).data('id');
            $.ajax({
                url: `/api/hoa-don/delete-hd/${idHoaDon}`,
                method: 'POST',
                data: {idHoaDonCT: itemId},
                success: function () {
                    location.reload();
                }
            });
        });
    }


    function updateTongTien(tongTien, idHoaDon) {
        $.ajax({
            url: `/api/hoa-don/update-tong-tien/${idHoaDon}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({tongTien: tongTien}),
            success: function (response) {
            },
        });
    }

    function updateThongTinNguoiNhan(nguoiNhan, sdtNguoiNhan, diaChiNguoiNhan, ghichu, idHoaDon) {
        $.ajax({
            url: `/api/hoa-don/update-thong-tin-nguoi-nhan/${idHoaDon}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                nguoiNhan: nguoiNhan, sdtNguoiNhan: sdtNguoiNhan, diaChiNguoiNhan: diaChiNguoiNhan, ghichu: ghichu
            }),
            success: function (response) {
            },
        });
    }


    function splitAndPopulateAddress(address) {
        const addressParts = address.split(',').map(part => part.trim());
        const len = addressParts.length;

        if (len >= 4) {
            const city = addressParts[len - 1];
            const district = addressParts[len - 2];
            const ward = addressParts[len - 3];
            const specificAddress = addressParts.slice(0, len - 3).join(', ');

            $('#edit-diachi').val(specificAddress);

            $editTinhThanh.val($editTinhThanh.find("option:contains('" + city + "')").val()).change();

            setTimeout(function() {

                $editQuanHuyen.val($editQuanHuyen.find("option:contains('" + district + "')").val()).change();
            }, 500);

            setTimeout(function() {
                $editPhuongXa.val($editPhuongXa.find("option:contains('" + ward + "')").val());
            }, 1000);
        } else {
            console.error('Invalid address format:', address);
        }
    }

    function fetchHoaDonDetail(idHoaDon) {
        $.ajax({
            url: `/api/hoa-don/detail/${idHoaDon}`, method: 'GET', success: function (response) {
                const hd = response.hd;
                const hdctList = response.hdctList;

                $('#edit-ten').val(hd.nguoiNhan);
                $('#edit-sdtNguoiNhan').val(hd.sdtNguoiNhan);
                $('#noteThongTin').val(hd.ghiChu);

                splitAndPopulateAddress(hd.diaChiNguoiNhan);

                hienThiThongTinHoaDon(hd);

                const tongTien = hienThiDanhSachSP(hdctList);

                updateTongTien(tongTien, idHoaDon)

                hienThiTongTienChiTiet(tongTien, hd);

                getDanhSachSanPham(0, 3);

                getPhuongThucThanhToan(tongTien);

                inHoaDon(hd, hdctList, tongTien);

                checkCurrentStep();

                xoaSanPham(idHoaDon);

                getThongTinKhachHang()

            }, error: function (xhr, status, error) {
                console.error('Lỗi fetchHoaDonDetail:', error);
            }
        });
    }


    function getThongTinKhachHang() {
        $.ajax({
            url: 'https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json',
            dataType: 'json',
            success: function(data) {
                citiesData = data;
                $editTinhThanh.empty().append('<option value="" selected>Chọn tỉnh thành</option>');
                $.each(data, function(index, city) {
                    $editTinhThanh.append('<option value="' + city.Id + '">' + city.Name + '</option>');
                });
            },
            error: function(xhr, status, error) {
                console.error('Lỗi khi tải dữ liệu:', error);
            }
        });

        $editTinhThanh.on('change', function() {
            var cityId = $(this).val();
            if (cityId) {
                $editQuanHuyen.empty().append('<option value="" selected>Chọn quận huyện</option>');
                var selectedCity = citiesData.find(city => city.Id === cityId);
                if (selectedCity) {
                    $.each(selectedCity.Districts, function(index, district) {
                        $editQuanHuyen.append('<option value="' + district.Id + '">' + district.Name + '</option>');
                    });
                }
            } else {
                $editQuanHuyen.empty().append('<option value="" selected>Chọn quận huyện</option>');
                $editPhuongXa.empty().append('<option value="" selected>Chọn phường xã</option>');
            }
        });

        $editQuanHuyen.on('change', function() {
            var districtId = $(this).val();
            if (districtId) {
                // Clear and populate phường/xã dropdown
                $editPhuongXa.empty().append('<option value="" selected>Chọn phường xã</option>');
                var selectedDistrict = citiesData.flatMap(city => city.Districts).find(district => district.Id === districtId);
                if (selectedDistrict) {
                    $.each(selectedDistrict.Wards, function(index, ward) {
                        $editPhuongXa.append('<option value="' + ward.Id + '">' + ward.Name + '</option>');
                    });
                }
            } else {
                $editPhuongXa.empty().append('<option value="" selected>Chọn phường xã</option>');
            }
        });
    }

    const getPhuongThucThanhToan = (tongTien) => {
        $.ajax({
            url: `/api/hoa-don/phuong-thuc-thanh-toan/${idHoaDon}`,
            method: 'GET',
            success: function (result) {

                if (result && typeof result === 'object') {
                    let list = "";
                    $("#lichSuThanhToan").empty();

                    list += `
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap">1</td>
                    <td class="px-6 py-4 whitespace-nowrap">${formatVND(tongTien)}</td>
                    <td class="px-6 py-4 whitespace-nowrap">${result.trangThai}</td>
                    <td class="px-6 py-4 whitespace-nowrap">${formatDate(result.ngayTao)}</td>
                    <td class="px-6 py-4 whitespace-nowrap"><span class="status bg-red-500 text-white rounded-lg ">${loaiThanhToan(result.loaiThanhToan)}</span></td>
                    <td class="px-6 py-4 whitespace-nowrap"><span class="status bg-green-500 text-white rounded-lg mt-5 ">${result.tenThanhToan}</span></td>
                    <td class="px-6 py-4 whitespace-nowrap">${result.ghiChu}</td>
                    <td class="px-6 py-4 whitespace-nowrap">${result.nguoiCapNhat}</td>
                </tr>`;

                    $("#lichSuThanhToan").html(list);
                } else {
                    console.error('Unexpected API response format:', result);
                }
            },
            error: function (error) {
                console.error('Lỗi Lịch sử thanh toán:', error);
            }
        });
    };


    function inHoaDon(hd, hdctList, tongTien) {
        let danhSachSP = '';

        hdctList.forEach((item, index) => {
            danhSachSP += `
        <tr>
            <td class="px-6 py-4 whitespace-nowrap">${index + 1}</td>
            <td class="px-6 py-4 whitespace-nowrap font-bold">
                <h1>${item.sanPhamChiTiet.sanPham.ten}</h1>
            </td>
            <td class="px-6 py-4 whitespace-nowrap font-bold">
                <h1>${item.soLuong}</h1>
            </td>
            <td class="px-6 py-4 whitespace-nowrap font-bold">
                <h1>${item.sanPhamChiTiet.giaBan}</h1>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">${formatVND(item.soLuong * item.sanPhamChiTiet.giaBan)}</td>
        </tr>`;
        });

        $('#inHoaDon').html(`
        <div class="invoice-header flex justify-between items-center border-b pb-2">
            <div class="text-xl font-bold">SHOE SEE</div>
            <div>
                <p class="text-sm">Mã hóa đơn: <span class="font-normal">${hd.ma}</span></p>
                <p class="text-sm">${hd.ngayTao != null ? new Date(hd.ngayTao).toLocaleString('vi-VN', {
            day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit'
        }) : ''}</p>
            </div>
            <img src="https://via.placeholder.com/150" alt="Logo" class="max-w-full h-auto">
        </div>
        <div class="invoice-details mt-4 border-b pb-2">
            <div>
                <p class="font-semibold">Từ:</p>
                <p>Shoe See</p>
                <p>Cao đẳng FPT Polytechnic, Phường Canh, Từ Liêm, Hà Nội, Việt Nam</p>
                <p>0961057585</p>
            </div>
            <div>
                <p class="font-semibold">Đến:</p>
                <p>${hd.nguoiNhan}</p>
                <p>${hd.diaChiNguoiNhan}</p>
                <p>${hd.sdtNguoiNhan}</p>
            </div>
        </div>
        <div class="invoice-body mt-4">
            <table id="tableHoaDonIn" class="min-w-full divide-y divide-gray-200">
                <thead class="bg-blue-500">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">STT</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Ảnh sản phẩm</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Số lượng</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Đơn giá</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Thành tiền</th>
                    </tr>
                </thead>
                <tbody id="danhSachSPIn" class="bg-white divide-y divide-gray-200">
                    ${danhSachSP} 
                </tbody>
            </table>
        </div>
        <div class="invoice-footer mt-4 flex justify-between">
            <div>
                <p class="font-semibold">Tiền thu người nhận:</p>
                <p>${formatVND(tongTien)}</p>
            </div>
            <div class="signature text-center">
                <p class="font-semibold">Chữ ký người nhận</p>
                <div class="signature-box border border-gray-300 w-72 h-48 flex items-center justify-center">
                    <p class="text-sm">Xác nhận hàng nguyên vẹn, không móp/méo</p>
                </div>
            </div>
        </div>
    `);
    }



    const generatePaginationButtons = (currentPage, totalPages) => {
        let buttons = "";
        for (let i = 1; i <= totalPages; i++) {
            buttons += `<button class="px-3 py-1 bg-gray-200 text-gray-700 rounded hover:bg-gray-300 pageBtn">${i}</button>`;
        }
        $("#paginationButtons").html(buttons);

        $(`.pageBtn:eq(${currentPage})`).addClass("bg-gray-400");
    };

    const getDanhSachSanPham = (page, size) => {
        $.ajax({
            url: `/api/hoa-don/danh-sach-san-pham?page=${page}&size=${size}`,
            method: 'GET',
            success: function (result) {
                let list = "";
                $("#danhSachSanPham").empty();
                for (let i = 0; i < result.content.length; i++) {
                    list += `
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">${i + 1}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <img src="https://res.cloudinary.com/deapopcoc/image/upload/${result.content[i].anh.ten}" alt="Ảnh" class="w-16 h-auto">
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap font-bold">
                            <h1>${result.content[i].sanPham.ten}</h1>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">${formatVND(result.content[i].giaBan)}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${result.content[i].soLuong}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${result.content[i].kichCo.ten}</td>
                        <td>
                            <div class="color-container rounded-lg ml-5" style="background-color: ${result.content[i].mauSac.ten}; width: 50px; height: 20px;"></div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="bg-green-500 rounded-lg text-white">${trangThaiSanPham(result.content[i].trangThai)}</span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                           <button class="themSanPham bg-blue-500 text-white px-4 py-2 rounded h-[50%] mt-4 hover:bg-blue-600 hover:text-gray-100" data-id="${result.content[i].id}" data-gia-ban="${result.content[i].giaBan}">Thêm
                            </button>
                        </td>
                    </tr>`;
                }

                $("#danhSachSanPham").html(list);

                $(".pagination-info").text(`Trang ${result.number + 1} của ${result.totalPages}`);

                generatePaginationButtons(result.number, result.totalPages);

                $("#danhSachSanPham").off('click', '.themSanPham').on('click', '.themSanPham', function () {
                    const itemId = $(this).data('id');
                    const giaBan = $(this).data('gia-ban');

                    $(this).off('click');
                    $.ajax({
                        url: `/api/hoa-don/danh-sach-san-pham/add`,
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            gia: giaBan, trangThai: 1, hoaDon: {id: idHoaDon}, sanPhamChiTiet: {id: itemId}
                        }),
                        success: function () {
                            fetchHoaDonDetail(idHoaDon);
                            location.reload();
                            hideModalDanhSachSanPham();
                        },
                        error: function (xhr, status, error) {
                            console.error('Lỗi thêm sản phẩm: ', error);
                        }
                    });
                });
            },
            error: function (error) {
                console.error('Lỗi khi lấy dữ liệu:', error);
            }
        });
    };

    getDanhSachSanPham(0, 3);

    function checkCurrentStep() {
        const button = document.getElementById("hienThiDanhSachSanPham");
        const buttonsDeleteSP = document.querySelectorAll(".deleteSP");
        const buttonPre  = document.getElementById("prevBtn");
        if(currentStep == 1){
            buttonPre.style.display = 'none';
        } else if(currentStep > 1) {
            button.style.display = "none";
            buttonsDeleteSP.forEach(button => button.style.display = "none");

        } else {
            button.style.display = "block";
            buttonsDeleteSP.forEach(button => button.style.display = "block");
        }
    }



    $(document).on("click", ".pageBtn", function () {
        let page = $(this).text() - 1;
        getDanhSachSanPham(page, 3);
    });

    $("#prevPageBtn").on("click", function () {
        let currentPage = $(".pageBtn.bg-gray-400").text();
        if (currentPage > 1) {
            let page = parseInt(currentPage) - 2;
            getDanhSachSanPham(page, 3);
        }
    });


    $("#nextPageBtn").on("click", function () {
        let currentPage = $(".pageBtn.bg-gray-400").text();
        let totalPages = $(".pageBtn").length;
        if (currentPage < totalPages) {
            let page = parseInt(currentPage);
            getDanhSachSanPham(page, 3);
        }
    });


    const getLichSu = () => {
        $.ajax({
            url: `/api/hoa-don/lich-su-hoa-don/${idHoaDon}`, data: {}, success: function (result) {
                let list = "";
                $("#listLichSu").empty();
                for (let i = 0; i < result.length; i++) {
                    list += `<tr>
                                    <td class="px-6 py-4 whitespace-nowrap">${i + 1}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">${trangThai(result[i].hanhDong)}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        ${result[i].ngayTao != null ? new Date(result[i].ngayTao).toLocaleString('vi-VN', {
                        day: '2-digit',
                        month: '2-digit',
                        year: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit'
                    }) : ''}
                                       </td>
                                    <td class="px-6 py-4 whitespace-nowrap">${result[i].nguoiTao}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">${result[i].ghiChu}</td>
                                  </tr>`;
                }

                $("#listLichSu").html(list);
            }
        });
    }

    const trangThaiMua = (tt) => {
        switch (tt) {
            case 1:
                return 'Online';
            case 2:
                return 'Tại quầy';
            default:
                return 'Không xác định'
        }
    }

    const loaiThanhToan = (tt) => {
        switch (tt) {
            case true:
                return 'Trả sau';
            case 2:
                return 'Trả trước';
            default:
                return 'Không xác định'
        }
    }


    const trangThai = (tt) => {
        switch (tt) {
            case 1:
                return 'Chờ xác nhận';
            case 2:
                return 'Đã xác nhận';
            case 3:
                return 'Chờ vận chuyển';
            case 4:
                return 'Vận chuyển';
            case 5:
                return 'Thanh toán';
            case 6:
                return 'Hoàn thành';
            case 7:
                return 'Hủy';
            default:
                return 'Không xác định';
        }
    }

    const trangThaiSteps = (tt) => {
        switch (tt) {
            case 1:
                return 'Chờ xác nhận';
            case 2:
                return 'Đã xác nhận';
            case 3:
                return 'Chờ vận chuyển';
            case 4:
                return 'Vận chuyển';
            case 5:
                return 'Thanh toán';
            case 6:
                return 'Hoàn thành';
            case 7:
                return 'Hủy';
            default:
                return 'Không xác định';
        }
    }

    const trangThaiSanPham = (tt) => {
        switch (tt) {
            case 1:
                return 'Thành công';
            case 2:
                return 'Thất bại';
            default:
                return 'Không xác định';
        }
    }

    function formatDate(date) {
        const d = new Date(date);
        return `${d.getDate()}-${d.getMonth() + 1}-${d.getFullYear()}`;
    }

    function showNoteModal() {
        $('#noteModal').removeClass('hidden');
    }

    function hideNoteModal() {
        $('#noteModal').addClass('hidden');
        $('#noteText').val('');
        $('#noteError').addClass('hidden');
    }


    function showModalDanhSachSanPham() {
        $('#modalDachSachSanPham').removeClass('hidden');
        fetchHoaDonDetail();

    }

    function hideModalDanhSachSanPham() {
        $('#modalDachSachSanPham').addClass('hidden');
        $('#modalDachSachSanPham').val('');
        $('#modalDachSachSanPham').addClass('hidden');
    }

    function showModalLichSu() {
        $('#modalLichSu').removeClass('hidden');
        getLichSu();
    }

    function hideModalLichSu() {
        $('#modalLichSu').addClass('hidden');
        $('#modalLichSu').val('');
        $('#modalLichSu').addClass('hidden');
    }

    function showModalThongTinHoaDon() {
        $('#modalThongTinHoaDon').removeClass('hidden');
    }

    function hideModalThongTinHoaDon() {
        $('#modalThongTinHoaDon').addClass('hidden');
        $('#modalThongTinHoaDon').val('');
        $('#modalThongTinHoaDon').addClass('hidden');
    }


    $('#hienThiGhiChu').click(function () {
        nextStep = currentStep + 1;
        if (nextStep <= totalSteps) {
            showNoteModal();
        } else {
            currentStep = totalSteps;
        }
    });

    $('#cancelButton').click(function () {
        hideNoteModal();
    });

    $('#hienThiLichSu').click(function () {
        showModalLichSu();
    });

    $('#dongLichSu').click(function () {
        hideModalLichSu();
    })

    $('#hienThiDanhSachSanPham').click(function () {
        showModalDanhSachSanPham();
    });

    $('#dongDanhSachSanPham').click(function () {
        hideModalDanhSachSanPham();
    })

    $('#thayDoiThongTinHoaDon').click(function () {
        showModalThongTinHoaDon();
        fetchHoaDonDetail(idHoaDon);
    });

    $('#dongThayDoiThongTinHoaDon').click(function () {
        hideModalThongTinHoaDon();
    });



    const totalSteps = 6;

    const icons = ['<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6"><path fill-rule="evenodd" d="M19.916 4.626a.75.75 0 0 1 .208 1.04l-9 13.5a.75.75 0 0 1-1.154.114l-6-6a.75.75 0 0 1 1.06-1.06l5.353 5.353 8.493-12.74a.75.75 0 0 1 1.04-.207Z" clip-rule="evenodd" /></svg>', '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6"><path fill-rule="evenodd" d="M11.003 3.003A8.001 8.001 0 1 0 19 11a.75.75 0 1 0-1.5 0 6.501 6.501 0 1 1-6.497-6.497.75.75 0 1 0 0-1.5Zm2.053 2.353a.75.75 0 0 0-.212 1.04l3.502 5.253a.75.75 0 0 0 1.308-.63l-3.502-5.253a.75.75 0 0 0-1.096-.41Z" clip-rule="evenodd" /></svg>', '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6"><path fill-rule="evenodd" d="M11.998 21.75a9.751 9.751 0 1 0 0-19.5 9.751 9.751 0 0 0 0 19.5Zm-.75-13.248a.75.75 0 1 1 1.5 0V12a.75.75 0 1 1-1.5 0v-3.498Zm.75 5.748a.75.75 0 1 1 0-1.5h.007a.75.75 0 1 1 0 1.5H12Z" clip-rule="evenodd" /></svg>'];

    let stepsHistory = [];
    let currentStep = stepsHistory.length > 0 ? stepsHistory.length : 1;



    function createStep(hanhDong, ngayTao, stepNum) {
        const stepDiv = $(`
        <div class="flex items-center ml-8 step" data-step="${stepNum}">
            <div class="h-8 w-8 bg-green-600 text-white rounded-full flex items-center justify-center">
                ${icons[(stepNum - 1) % icons.length]}
            </div>
            <div class="ml-4">
                <h2 class="text-lg font-semibold">${trangThaiSteps(hanhDong)}</h2>
                <p class="text-gray-600"> ${ngayTao != null ? new Date(ngayTao).toLocaleString('vi-VN', {
            day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit'
        }) : ''}</p>
            </div>
        </div>
    `);
        return stepDiv;
    }

    function updateButtonsState() {
        $('#steppers').empty();
        stepsHistory.forEach((step, index) => {
            $('#steppers').append(createStep(step.hanhDong, step.ngayTao, index + 1));
        });
        $('#prevBtn').prop('disabled', currentStep === 1);
        const noteText = $('#noteText').val();
        if (noteText.length < 10) {
            $('#xacNhanGhiChu').prop('disabled', currentStep >= totalSteps);
            return;
        } else {
            $('#xacNhanGhiChu').prop('disabled', currentStep >= totalSteps);
        }

    }


    $('#prevBtn').click(function () {
        if (currentStep > 1) {
            currentStep--;
            stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
            updateTrangThai(currentStep);
            updateButtonsState();
        }


    });

    $('#xacNhanGhiChu').click(function () {
        currentStep++;

        const noteText = $('#noteText').val();
        getLichSu();

        if (noteText.length < 10) {
            $('#noteError').removeClass('hidden');
            return;
        } else {
            $('#noteError').addClass('hidden');
        }

        if (currentStep == 2 && confirm("Bạn có muốn in hóa đơn không?")) {
            window.print();
            stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
            updateTrangThai(currentStep)
            updateButtonsState();
            hideNoteModal();
            getLichSu();
        } else {
            if (currentStep <= totalSteps) {
                stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
                updateTrangThai(currentStep)
                updateButtonsState();
                hideNoteModal();
                getLichSu();
            } else {
                currentStep = totalSteps;
            }
        }


    });


    function fetchStepsData(idHoaDon) {
        $.ajax({
            url: `/api/hoa-don/lich-su-hoa-don/${idHoaDon}`, method: 'GET', success: function (data) {
                stepsHistory = data.map(item => ({
                    hanhDong: item.hanhDong, ngayTao: item.ngayTao
                }));
                currentStep = stepsHistory.length > 0 ? stepsHistory.length : 1;
                updateButtonsState();
                fetchHoaDonDetail(idHoaDon);

            }, error: function (error) {
                console.error("Error fetching steps data:", error);
            }
        });
    }

    fetchStepsData(idHoaDon);


    function updateTrangThai(trangThai) {
        const ghiChu = $('#noteText').val().trim();
        const hanhDong = trangThai;
        $.ajax({
            url: `/api/hoa-don/update-trang-thai/${idHoaDon}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({trangThai: trangThai}),
            success: function (response) {
                addHistoryLog(ghiChu, hanhDong);
                fetchHoaDonDetail(idHoaDon);
            },
            error: function (xhr, status, error) {
                console.error('Lỗi khi cập nhật trạng thái hóa đơn: ', error);
                alert('Đã xảy ra lỗi khi cập nhật trạng thái hóa đơn. Vui lòng thử lại sau.');
            }
        });
    }

    function addHistoryLog(ghiChu, hanhDong) {

        $.ajax({
            url: `/api/hoa-don/lich-su-hoa-don/add/${idHoaDon}`,
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ghiChu: ghiChu, hanhDong: hanhDong}),
            success: function (response) {
            },
            error: function (xhr, status, error) {
                console.error('Lỗi khi thêm lịch sử:', error);
            }
        });
    }

    fetchHoaDonDetail(idHoaDon);

});


