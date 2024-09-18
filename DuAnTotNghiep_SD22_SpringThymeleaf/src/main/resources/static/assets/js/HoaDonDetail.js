$(document).ready(function () {

    let idSP = [];
    let loaiThanhToan2 = null;

    let itemId = null;
    let giaBan = 0;

    let idPGG = null;

    let idKH = null

    let hd = {};
    let hdctList = [];

    const pathArray = window.location.pathname.split('/');
    const idHoaDon = pathArray[pathArray.length - 1];

    const hdctCheck = [];

    // var $phiVanChuyen = $('#phiVanChuyen');
    // var  $nguoiNhan = $('#edit-ten');
    // var $sdtNguoiNhan = $('#edit-sdtNguoiNhan');
    // var $noteThongTin = $('#noteThongTin')

    // var $editDiaChi = $('#edit-diachi');
    var $editTinhThanh = $('#edit-tinhthanh');
    var $editQuanHuyen = $('#edit-quanhuyen');
    var $editPhuongXa = $('#edit-phuongxa');
    var citiesData = [];


    const formatVND = (tongtien) => {
        // Làm tròn xuống nếu là số thập phân để không thêm dấu chấm vào phần thập phân
        const integerPart = Math.floor(tongtien);

        // Sử dụng replace để thêm dấu chấm vào từng nhóm 3 chữ số
        return integerPart.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + ' VNĐ';
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
                    <h1 class="ml-4 mt-3 font-bold">Trạng thái: <span class="bg-blue-400 hover:bg-blue-700 text-white py-2 px-4 rounded-full font-normal ml-10">${trangThai(hd.trangThai || '')}</span></h1>
                </div>
                <div>
                    <h1 class="mt-3 font-bold">Tên khách hàng: <span class="font-normal ml-10">${hd.nguoiNhan || ''}</span></h1>
                </div>
                <div>
                    <h1 class="ml-4 mt-3 font-bold">Loại: <span class="font-normal ml-10">${trangThaiMua(hd.loai || '')}</span></h1>
                </div>
                <div>
                    <h1 class="font-bold">Số điện thoại: <span class="font-normal ml-10">${hd.sdtNguoiNhan || ''}</span></h1>
                </div>
                <div>
                    <h1 class="ml-4 mt-3 font-bold">Địa chỉ: <span class="font-normal ml-10">${hd.diaChiNguoiNhan || ''}</span></h1>
                </div>
                <div>
                    <h1 class="font-bold">Thời gian dự kiến nhận: <span class="font-normal ml-10">${hd.ngayNhan ? formatDate(hd.ngayNhan) : ''}</span></h1>
                </div>
                <div>
                    <h1 class="ml-4 font-bold">Ghi chú: <span class="font-normal ml-10">${hd.ghiChu || ''}</span></h1>
                </div>
            </div>
        `);

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
                    <img src="${item.sanPhamChiTiet.anh}" alt="Image" class="w-16 h-auto">
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
                        <input type="number" class="soLuong-input bg-gray-100 w-[30%] border border-gray-300 rounded-md px-2 py-1" value="${item.soLuong}" min="1" data-id="${item.id}" id="soLuong-${item.id}" name="soLuong-${item.id}" >
                    </div>
                </td>
                <td class="px-6 py-4 whitespace-nowrap">${formatVND(tongTienSP)}</td>
                <td class="px-6 py-4 whitespace-nowrap">
                    <span class="bg-green-500 rounded-lg text-white px-4 py-2">${trangThaiSanPham(item.trangThai)}</span>
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
        console.log(hd);
     if(hd.phieuGiamGia === null){
         let voucher = 0;
         PhieuGiamGiaPhuHop(hd);
         const tongTienSauKhiGiam = tongTien - voucher;

         // const voucher = hd.phieuGiamGia ? hd.phieuGiamGia.giamToiDa : 0
         // const tongTienSauGiam = tongTien - hd.phieuGiamGia.giamToiDa;

         const tongTienThanhToan = hd.tongTienSauGiam + hd.tienShip;

         $('#tongTienChiTiet').html(`

            <div class="grid gap-0 grid-cols-2">
            <div>
                <div>
                     <span class="text-lg ">Tổng tiền hàng: </span></span>
                </div>

                <div>
                    <span  class="text-lg">Phí vận chuyển:</span>
                </div>
                <div>
                    <span  class="text-lg">Voucher:</span>
                </div>
                <span class="flex items-center w-full my-2">
                    <span class="h-px flex-1 bg-gray-500"></span>
                </span>
                <div>
                    <span  class="text-lg">Tổng tiền thanh toán: </span>
                </div>
                </div>  
                
                <div >
                    <div> <span class="text-lg ml-[11%] text-blue-700">${formatVND(tongTien)}</div>
                    <div ><span class="text-lg ml-20 font-normal">${formatVND(hd.tienShip)}</span></div>
                    <div ><span class="text-lg ml-20 font-normal">${formatVND(voucher)}</span></div>
                    <span class="flex items-center w-full my-2">
                        <span class="h-px flex-1 bg-gray-500"></span>
                    </span>
                    <div><span class="text-xl ml-8 text-orange-700 text-no">${formatVND(tongTienSauKhiGiam+hd.tienShip)}</span></div>   
                </div>
            </div>
           
        `);
     }else{
         let voucher = 0;
         if(hd.phieuGiamGia.hinhThucGiam === true ){
             let phanTram = tongTien / hd.phieuGiamGia.giaTriGiam ;
             if(hd.phieuGiamGia.giamToiDa < phanTram){
                 voucher = hd.phieuGiamGia.giamToiDa || 0;
             }else{
                 voucher = phanTram;
             }
         }else{
             voucher = hd.phieuGiamGia.giamToiDa || 0;
         }
         PhieuGiamGiaPhuHop(hd);
         const tongTienSauKhiGiam = tongTien - voucher;

         // const voucher = hd.phieuGiamGia ? hd.phieuGiamGia.giamToiDa : 0
         // const tongTienSauGiam = tongTien - hd.phieuGiamGia.giamToiDa;

         const tongTienThanhToan = hd.tongTienSauGiam + hd.tienShip;

         $('#tongTienChiTiet').html(`

            <div class="grid gap-0 grid-cols-2">
            <div>
                <div>
                     <span class="text-lg ">Tổng tiền hàng: </span></span>
                </div>

                <div>
                    <span  class="text-lg">Phí vận chuyển:</span>
                </div>
                <div>
                    <span  class="text-lg">Voucher:</span>
                </div>
                <span class="flex items-center w-full my-2">
                    <span class="h-px flex-1 bg-gray-500"></span>
                </span>
                <div>
                    <span  class="text-lg">Tổng tiền thanh toán: </span>
                </div>
                </div>  
                
                <div >
                    <div> <span class="text-lg ml-[11%] text-blue-700">${formatVND(tongTien)}</div>
                    <div ><span class="text-lg ml-20 font-normal">${formatVND(hd.tienShip)}</span></div>
                    <div ><span class="text-lg ml-20 font-normal">${formatVND(voucher)}</span></div>
                    <span class="flex items-center w-full my-2">
                        <span class="h-px flex-1 bg-gray-500"></span>
                    </span>
                    <div><span class="text-xl ml-8 text-orange-700 text-no">${formatVND(tongTienSauKhiGiam+hd.tienShip)}</span></div>   
                </div>
            </div>
           
        `);
     }
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
                // console.log(response)
                PhieuGiamGiaPhuHop(hd.tongTien);

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
            showConfirm(function() {
                if(idSP.length <= 1) {
                    showNotification("Xóa sản phẩm thật bại", 'thatBai');
                }else{
                    $.ajax({
                        url: `/api/hoa-don/delete-hd/${idHoaDon}`,
                        method: 'POST',
                        data: {idHoaDonCT: itemId},
                        success: function () {
                            showNotification("Xóa sản pẩm thành công", "thanhCong")

                            fetchHoaDonDetail(idHoaDon)
                        },
                        error: function() {
                            Swal.fire(
                                'Lỗi!',
                                'Đã xảy ra lỗi khi xóa sản phẩm.',
                                'error'
                            );
                        }
                    });
                }
            });
            PhieuGiamGiaPhuHop(hd.tongTien);

        });
    }

    function updateSoLuongSanPhamKhiDaMua() {
        $.ajax({
            url: `/api/hoa-don/update-tong-tien/${idHoaDon}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({tongTien: tongTien}),
            success: function (response) {
            },
        });
    }


    function updateTongTien(tongTien, hd,idHoaDon) {
        const tongTienSauKhiGiam = tongTien - (hd.phieuGiamGia ? hd.phieuGiamGia.giamToiDa : 0);
        $.ajax({
            url: `/api/hoa-don/update-tong-tien/${idHoaDon}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({tongTien: tongTien, tongTienSauGiam: tongTienSauKhiGiam}),
            success: function (response) {
                // PhieuGiamGiaPhuHop(tongTien);
            },
        });
    }

    function updateThongTinNguoiNhan(nguoiNhan, sdtNguoiNhan, diaChiNguoiNhan, tienShip, ghichu) {
        $.ajax({
            url: `/api/hoa-don/update-thong-tin-nguoi-nhan/${idHoaDon}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                nguoiNhan: nguoiNhan, sdtNguoiNhan: sdtNguoiNhan, diaChiNguoiNhan: diaChiNguoiNhan, ghichu: ghichu, tienShip: tienShip
            }),
            success: function (response) {
                fetchHoaDonDetail(idHoaDon);
            },
        });
    }


    function splitAndPopulateAddress(address) {
        if (!address) {
            console.error('Address is null or undefined');
            return;
        }

        const addressParts = address.split(',').map(part => part.trim());
        const len = addressParts.length;

        if (len >= 4) {
            const city = addressParts[len - 1];
            const district = addressParts[len - 2];
            const ward = addressParts[len - 3];
            const specificAddress = addressParts.slice(0, len - 3).join(', ');

            $('#edit-diachi').val(specificAddress);

            setTimeout(function() {
                $editTinhThanh.val($editTinhThanh.find("option:contains('" + city + "')").val()).change();
            }, 100);

            setTimeout(function() {
                $editQuanHuyen.val($editQuanHuyen.find("option:contains('" + district + "')").val()).change();
            }, 100);

            setTimeout(function() {
                $editPhuongXa.val($editPhuongXa.find("option:contains('" + ward + "')").val());
            }, 100);
        } else {
            console.error('Invalid address format:', address);
        }
    }


    function fetchHoaDonDetail(idHoaDon) {

        $.ajax({
            url: `/api/hoa-don/detail/${idHoaDon}`,
            method: 'GET',
            success: function (response) {
                hd = response.hd;
                hdctList = response.hdctList;

                loaiThanhToan2 = hd.loai;

                // idKH = hd.khachHang.id || '';

                idSP = [];

                for (let i = 0; i < hdctList.length; i++) {
                    let item = hdctList[i];
                    idSP.push({
                        id: item.sanPhamChiTiet.id,
                        soLuong: item.soLuong
                    });
                }

                $('#phiVanChuyen').val(hd.tienShip);
                $('#edit-ten').val(hd.nguoiNhan);
                $('#edit-sdtNguoiNhan').val(hd.sdtNguoiNhan);
                $('#noteThongTin').val(hd.ghiChu);

                splitAndPopulateAddress(hd.diaChiNguoiNhan);

                hienThiThongTinHoaDon(hd);

                const tongTien = hienThiDanhSachSP(hdctList);

                updateTongTien(tongTien, hd, idHoaDon);

                hienThiTongTienChiTiet(tongTien, hd);

                getPhuongThucThanhToan(tongTien, hd);

                inHoaDon(hd, hdctList);

                getDanhSachSanPhamCoSearch(page, size);

                checkCurrentStep();

                xoaSanPham(idHoaDon);

                getThongTinKhachHang();


                cbbChatLieu();
                cbbDeGiay();
                cbbThuongHieu();
                cbbCoGiay();
                cbbKichCo();
                cbbMauSac();

                currentStep = hd.trangThai;

            },
            error: function (xhr, status, error) {
                console.error('Lỗi fetchHoaDonDetail:', error);
            }
        });
    }



    $("#danhSachSanPham").on('click', '.themSanPham', function () {
        $(this).off('click');
        $("#soLuongInput").val(1)
        showModalSoLuong();

        itemId = $(this).data('id');
        giaBan = $(this).data('gia-ban');

    });

    $('#soLuongThayDoi').click(function () {

        const soLuongMoi = parseInt($("#soLuongInput").val(), 10);


        let checkTrung = false;

        let soLuongHienTai = 0;

        if (Array.isArray(idSP)) {
            for (let i = 0; i < idSP.length; i++) {
                if (idSP[i].id === itemId) {
                    checkTrung = true;
                    soLuongHienTai = idSP[i].soLuong;
                    break;
                }
            }
        }

        const soLuongCuoiCung = checkTrung ? soLuongHienTai + soLuongMoi : soLuongMoi;
        console.log(giaBan)

        const capNhatSoLuongNeuTrung = {
            gia: giaBan,
            soLuong: soLuongCuoiCung,
            trangThai: 1,
            hoaDon: { id: idHoaDon },
            sanPhamChiTiet: { id: itemId, giaBan: giaBan }
        };

        if (!checkTrung) {
            $.ajax({
                url: `/api/hoa-don/danh-sach-san-pham/add`,
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    gia: giaBan, soLuong: soLuongMoi,trangThai: 1, hoaDon: { id: idHoaDon }, sanPhamChiTiet: { id: itemId, giaBan: giaBan }
                }),
                success: function () {
                    showNotification("Thêm sản pẩm thành công", "thanhCong")
                    hideModalSoLuong();
                    hideModalDanhSachSanPham();
                    PhieuGiamGiaPhuHop(hd.tongTien);

                    fetchHoaDonDetail(idHoaDon);

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error('Lỗi khi gọi API', textStatus, errorThrown);
                }
            });
        } else {
            $.ajax({
                url: `/api/hoa-don/update-so-luong-sp`,
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(capNhatSoLuongNeuTrung),
                success: function () {
                    showNotification("Thêm sản pẩm thành công", "thanhCong")
                    hideModalSoLuong();
                    hideModalDanhSachSanPham();
                    PhieuGiamGiaPhuHop(hd.tongTien);

                    fetchHoaDonDetail(idHoaDon);

                },
            });
        }
        hideModalSoLuong();
        hideModalDanhSachSanPham();

    });


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

    const getPhuongThucThanhToan = (tongTien, hd) => {

        let voucher = 0;
        if(hd.phieuGiamGia != null){
            if (hd.phieuGiamGia.hinhThucGiam === true) {
                let phanTram = hd.tongTien / hd.phieuGiamGia.giaTriGiam;
                if (hd.phieuGiamGia.giamToiDa < phanTram) {
                    voucher = hd.phieuGiamGia.giamToiDa || 0;
                } else {
                    voucher = phanTram;
                }
            } else {
                voucher = hd.phieuGiamGia.giamToiDa || 0;
            }
        }else {

            voucher = 0;

        }
        const tongTienSauKhiGiam = tongTien - voucher;
        if(hd.loai === 2){
            $.ajax({
                url: `/api/hoa-don/phuong-thuc-thanh-toan/${idHoaDon}`,
                method: 'GET',
                success: function (result) {
                    console.log(result);
                    if (Array.isArray(result)) { // Kiểm tra nếu result là một mảng
                        let list = "";
                        $("#lichSuThanhToan").empty();

                        // Chạy vòng for qua các phương thức thanh toán
                        result.forEach((item, index) => {
                            list += `
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">${index + 1}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${formatVND(tongTienSauKhiGiam+hd.tienShip)}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${formatDate(item.ngayTao || '')}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                        ${loaiThanhToan(item.loaiThanhToan)}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="status bg-green-500 text-white rounded-lg px-4 py-2">${item.tenThanhToan || ''}</span>
                        </td>
                           <td className="px-6 py-4 whitespace-nowrap">${item.ghiChu || ''}</td>
                            <td className="px-6 py-4 whitespace-nowrap">${item.nguoiTao || ''}</td>
                    </tr>`;
                        });

                        $("#lichSuThanhToan").html(list);
                    } else {
                        console.error('Unexpected API response format:', result);
                    }
                },
                error: function (error) {
                    console.error('Lỗi Lịch sử thanh toán:', error);
                }
            });
        }else{
            $.ajax({
                url: `/api/hoa-don/phuong-thuc-thanh-toan/${idHoaDon}`,
                method: 'GET',
                success: function (result) {
                    console.log(result);
                    if (Array.isArray(result)) { // Kiểm tra nếu result là một mảng
                        let list = "";
                        $("#lichSuThanhToan").empty();

                        // Chạy vòng for qua các phương thức thanh toán
                        result.forEach((item, index) => {
                            list += `
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">${index + 1}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${formatVND(item.tienDaThanhToan || '')}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${formatDate(item.ngayTao || '')}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                        ${loaiThanhToan(item.loaiThanhToan)}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="status bg-green-500 text-white rounded-lg px-4 py-2">${item.tenThanhToan || ''}</span>
                        </td>
                           <td className="px-6 py-4 whitespace-nowrap">${item.ghiChu || ''}</td>
                            <td className="px-6 py-4 whitespace-nowrap">${item.nguoiTao || ''}</td>
                    </tr>`;
                        });

                        $("#lichSuThanhToan").html(list);
                    } else {
                        console.error('Unexpected API response format:', result);
                    }
                },
                error: function (error) {
                    console.error('Lỗi Lịch sử thanh toán:', error);
                }
            });
        }



    };


    function inHoaDon(hd, hdctList) {
        let voucher = 0;
       if(hd.phieuGiamGia != null){


           if (hd.phieuGiamGia.hinhThucGiam === true) {
               let phanTram = hd.tongTien / hd.phieuGiamGia.giaTriGiam;
               if (hd.phieuGiamGia.giamToiDa < phanTram) {
                   voucher = hd.phieuGiamGia.giamToiDa || 0;
               } else {
                   voucher = phanTram;
               }
           } else {
               voucher = hd.phieuGiamGia.giamToiDa || 0;
           }
       }else {

           voucher = 0;

       }

           let danhSachSP = '';


           const tongTienSauKhiGiam = hd.tongTien - voucher;

           // <td class="px-6 py-4 whitespace-nowrap font-bold">
           //     <img src="${item.sanPhamChiTiet.anh}" alt="Image" class="w-16 h-auto">
           // </td>

           // <th className="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Ảnh sản phẩm</th>

           hdctList.forEach((item, index) => {
               danhSachSP += `
        <tr>
            <td class="px-6 py-4 whitespace-nowrap">${index + 1}</td>
          
            <td class="px-6 py-4 whitespace-nowrap font-bold">
                <h1>${item.sanPhamChiTiet.ten}</h1>
            </td>
            <td class="px-6 py-4 whitespace-nowrap font-bold">
                <h1>${item.soLuong}</h1>
            </td>
            <td class="px-6 py-4 whitespace-nowrap font-bold">
                <h1>${formatVND(item.sanPhamChiTiet.giaBan)}</h1>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">${formatVND(item.soLuong * item.sanPhamChiTiet.giaBan)}</td>
        </tr>`;
           });

           $('#inHoaDon').html(`
        <div class="invoice-header flex justify-between items-center border-b pb-2">
            <div class="text-xl font-bold">
            <img src="https://bizweb.dktcdn.net/100/048/601/themes/734017/assets/index-cate-icon-4.png?1610907247309" alt="Logo" class="w-[10%]">
            <div class="text-orange-600">SHOE SEE</div>
            </div>
            <div>
                <p class="text-sm">Mã hóa đơn: <span class="font-normal">${hd.ma}</span></p>
                <p class="text-sm">${hd.ngayTao != null ? new Date(hd.ngayTao).toLocaleString('vi-VN', {
               day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit'
           }) : ''}</p>
            </div>
        </div>
        <div class="invoice-details mt-4 border-b pb-2">
            <div>
                <p class="font-semibold">Từ:</p>
                <p>Shoe See</p>
                <p>Cao đẳng FPT Polytechnic, Trịnh Văn Bô, Nam Từ Liêm, Hà Nội</p>
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
                        <th class="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">Tên sản phẩm</th>
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
                <p>${formatVND(tongTienSauKhiGiam + hd.tienShip)}</p>
            </div>
            <div class="signature text-center">
                <p class="font-semibold">Chữ ký người nhận</p>
                <div class="signature-box border border-gray-300 w-72 h-48 flex items-center justify-center">
                    <p class="text-sm">Xác nhận hàng nguyên vẹn, không móp/méo</p>
                </div>
            </div>
        </div>
    `);

        // console.log($('#inHoaDon').html());
    }


    function checkCurrentStep() {
        const button = document.getElementById("hienThiDanhSachSanPham");
        const buttonsDeleteSP = document.querySelectorAll(".deleteSP");
        const buttonPre = document.getElementById("prevBtn");
        const buttonNext = document.getElementById("hienThiGhiChu");
        const buttonHuy = document.getElementById("huyHoaDon");
        const buttonThayDoiThongTin = document.getElementById("thayDoiThongTinHoaDon");
        const soLuongInputs = document.querySelectorAll(".soLuong-input");

        console.log(idSP.length);

        console.log("Loai thanh toan"+loaiThanhToan2);

        if(loaiThanhToan2 === 1){
            if (currentStep === 1) {
                buttonPre.style.display = 'none';
                button.style.display = "none";
                buttonsDeleteSP.forEach(button => button.style.display = "none");
                buttonThayDoiThongTin.style.display = "block";
                soLuongInputs.forEach(input => {
                    input.disabled = true;
                });
            } else if (currentStep > 1) {
                button.style.display = "none";
                buttonsDeleteSP.forEach(button => button.style.display = "none");
                buttonThayDoiThongTin.style.display = "none";

                soLuongInputs.forEach(input => {
                    input.disabled = true;
                });

                if (currentStep >= 6) {
                    buttonNext.style.display = "none";
                    buttonPre.style.display = "none";
                    buttonHuy.style.display = "none";
                } else if(currentStep === 2) {
                    buttonNext.style.display = "block";
                    buttonPre.style.display = "none";
                    buttonHuy.style.display = "block";
                } else{
                    buttonNext.style.display = "block";
                    buttonPre.style.display = "none";
                    buttonHuy.style.display = "none";
                }
            }
        }else{
            if (currentStep === 1) {
                buttonPre.style.display = 'none';
                button.style.display = "block";
                buttonsDeleteSP.forEach(button => button.style.display = "block");
                buttonThayDoiThongTin.style.display = "block";
                soLuongInputs.forEach(input => {
                    input.disabled = false;
                });
            } else if (currentStep > 1) {
                button.style.display = "none";
                buttonsDeleteSP.forEach(button => button.style.display = "none");
                buttonThayDoiThongTin.style.display = "none";

                soLuongInputs.forEach(input => {
                    input.disabled = true;
                });

                if (currentStep >= 6) {
                    buttonNext.style.display = "none";
                    buttonPre.style.display = "none";
                    buttonHuy.style.display = "none";
                } else {
                    buttonNext.style.display = "block";
                    buttonPre.style.display = "none";
                    buttonHuy.style.display = "none";
                }
            }
        }

    }

    function addPhieuGiamGia(idHD, idPGG) {

        $.ajax({
            url: `/api/hoa-don/update-phieu-giam-gia/${idHD}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                "phieuGiamGia": {
                    id: idPGG
                }
            }),
            success: function(response) {
                idPGG = null;
                fetchHoaDonDetail(idHoaDon);
            },
            error: function(error) {
                console.error("Error updating PhieuGiamGia", error);
            }
        });
    }


    function PhieuGiamGiaPhuHop(max) {

        $.ajax({
            url: `/api/hoa-don/phieu-giam-gia-phu-hop/${max}`,
            method: 'GET',
            contentType: 'application/json',
            success: function(response) {
                idPGG = response.id;
                if(idKH === null){
                    idPGG = null;
                }else{
                    if (response && response.length <= 0) {

                        idPGG = null;

                    } else if (max < response[0].donToiThieu ) {

                        idPGG = null;

                    } else {

                        idPGG = response[0].id;
                    }
                }
                addPhieuGiamGia(idHoaDon, idPGG);


            },
        });
    }


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

    function cbbKichCo(){
        $.ajax({
            url: `/api/kich-co/all`,
            method: 'GET',
            success: function(data) {
                $('#combo-box-kich-co').empty();

                $('#combo-box-kich-co').append('<option value="">Tất cả</option>');

                $.each(data, function(index, item) {
                    $('#combo-box-kich-co').append(`<option value="${item.id}">${item.ten}</option>`);
                });
            },

        });
    }


    function cbbMauSac(){
        $.ajax({
            url: `/api/mau-sac/all`,
            method: 'GET',
            success: function(data) {
                $('#combo-box-mau-sac').empty();

                $('#combo-box-mau-sac').append('<option value="">Tất cả</option>');

                $.each(data, function(index, item) {
                    $('#combo-box-mau-sac').append(`<option value="${item.id}">${item.moTa}</option>`);
                });
            },

        });
    }


    function cbbChatLieu(){
        $.ajax({
            url: `/api/chat-lieu/all`,
            method: 'GET',
            success: function(data) {
                $('#combo-box-chat-lieu').empty();

                $('#combo-box-chat-lieu').append('<option value="">Tất cả</option>');

                $.each(data, function(index, item) {
                    $('#combo-box-chat-lieu').append(`<option value="${item.id}">${item.ten}</option>`);
                });
            },

        });
    }

    function cbbDeGiay(){
        $.ajax({
            url: `/api/de-giay/all`,
            method: 'GET',
            success: function(data) {
                $('#combo-box-de-giay').empty();

                $('#combo-box-de-giay').append('<option value="">Tất cả</option>');

                $.each(data, function(index, item) {
                    $('#combo-box-de-giay').append(`<option value="${item.id}">${item.ten}</option>`);
                });
            },

        });
    }

    function cbbCoGiay(){
        $.ajax({
            url: `/api/co-giay/all`,
            method: 'GET',
            success: function(data) {
                $('#combo-box-co-giay').empty();

                $('#combo-box-co-giay').append('<option value="">Tất cả</option>');

                $.each(data, function(index, item) {
                    $('#combo-box-co-giay').append(`<option value="${item.id}">${item.ten}</option>`);
                });
            },

        });
    }

    function cbbThuongHieu(){
        $.ajax({
            url: `/api/thuong-hieu/all`,
            method: 'GET',
            success: function(data) {
                $('#combo-box-thuong-hieu').empty();

                $('#combo-box-thuong-hieu').append('<option value="">Tất cả</option>');

                $.each(data, function(index, item) {
                    $('#combo-box-thuong-hieu').append(`<option value="${item.id}">${item.ten}</option>`);
                });
            },

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

    const trangThaiNguoiTao = (tt) => {
        switch (tt) {
            case 1:
                return 'Nguyễn Bá Đăng';
            case 2:
                return 'Admin';
            default:
                return 'Không xác định'
        }
    }

    const loaiThanhToan = (tt) => {
        switch (tt) {
            case false:
                return '<span class="status bg-red-500 text-white rounded-lg px-4 py-2">Trả sau</span>';
            case true:
                return '<span class="status bg-blue-500 text-white rounded-lg px-4 py-2">Đã thanh toán</span>';
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
            case 10:
                return 'Thay đổi thông tin';
            default:
                return 'Không xác định';
        }
    }

    const trangThaiThanhToan = (tt) => {
        switch (tt) {
            case 1:
                return 'Tiền mặt';
            case 2:
                return 'Chuyển khoản';
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

    function showModalSoLuong() {
        $('#modalSoLuong').removeClass('hidden');
    }

    function hideModalSoLuong() {
        $('#modalSoLuong').addClass('hidden');
        $('#modalSoLuong').val('');
        $('#modalSoLuong').addClass('hidden');
    }

    function showNoteModal() {
        $('#noteModal').removeClass('hidden');
    }

    function hideNoteModal() {
        $('#noteModal').addClass('hidden');
        $('#noteText').val('');
        $('#noteError').addClass('hidden');
    }

    function showNoteModalHuy() {
        $('#noteModalHuy').removeClass('hidden');
    }

    function hideNoteModalHuy() {
        $('#noteModalHuy').addClass('hidden');
        $('#noteModalHuy').val('');
        $('#noteModalHuy').addClass('hidden');
    }


    function showNoteModalLui() {
        $('#noteModalLui').removeClass('hidden');
    }

    function hideNoteModalLui() {
        $('#noteModalLui').addClass('hidden');
        $('#noteModalLui').val('');
        $('#noteModalLui').addClass('hidden');
    }


    function showModalDanhSachSanPham() {
        $('#modalDachSachSanPham').removeClass('hidden');
        fetchHoaDonDetail(idHoaDon);

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

    $('#huyHoaDon').click(function () {
        showNoteModalHuy();
    });

    $('#huy').click(function () {
        hideNoteModalHuy();
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
        fetchHoaDonDetail(idHoaDon);
    });


    $('#dongModalSoLuong').click(function () {
        hideModalSoLuong();
    });


    $('#luuThongTinHoaDon').click(function () {
        var nguoiNhan = $('#edit-ten').val();
        var sdtNguoiNhan = $('#edit-sdtNguoiNhan').val();
        var phiVanChuyen = $('#phiVanChuyen').val();
        var ghiChu = $('#noteThongTin').val();

        var selectedCity = $('#edit-tinhthanh').find('option:selected').text();
        var selectedDistrict = $('#edit-quanhuyen').find('option:selected').text();
        var selectedWard = $('#edit-phuongxa').find('option:selected').text();
        var specificAddress = $('#edit-diachi').val();
        var diaChiDayDu = specificAddress + ', ' + selectedWard + ', ' + selectedDistrict + ', ' + selectedCity;

        updateThongTinNguoiNhan(nguoiNhan, sdtNguoiNhan, diaChiDayDu, phiVanChuyen, ghiChu);
        var ghichuThayDoiThongTin = "Thay đổi thông tin"
        addHistoryLog(ghichuThayDoiThongTin, 10);
        fetchHoaDonDetail(idHoaDon);
        hideModalThongTinHoaDon();
    });

    function showConfirm(callback) {
        Swal.fire({
            title: 'Bạn có chắc chắn?',
            text: "Bạn không thể hoàn tác hành động này!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Vâng, tiếp tục!',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                callback();
            } else {
                Swal.fire(
                    'Đã hủy!',
                    'Hành động của bạn đã bị hủy.',
                    'error'
                );
            }
        });
    }

    const totalSteps = 6;

    const icons = ['<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
    '  <path fill-rule="evenodd" d="M5.625 1.5c-1.036 0-1.875.84-1.875 1.875v17.25c0 1.035.84 1.875 1.875 1.875h12.75c1.035 0 1.875-.84 1.875-1.875V12.75A3.75 3.75 0 0 0 16.5 9h-1.875a1.875 1.875 0 0 1-1.875-1.875V5.25A3.75 3.75 0 0 0 9 1.5H5.625ZM7.5 15a.75.75 0 0 1 .75-.75h7.5a.75.75 0 0 1 0 1.5h-7.5A.75.75 0 0 1 7.5 15Zm.75 2.25a.75.75 0 0 0 0 1.5H12a.75.75 0 0 0 0-1.5H8.25Z" clip-rule="evenodd" />\n' +
    '  <path d="M12.971 1.816A5.23 5.23 0 0 1 14.25 5.25v1.875c0 .207.168.375.375.375H16.5a5.23 5.23 0 0 1 3.434 1.279 9.768 9.768 0 0 0-6.963-6.963Z" />\n' +
     '</svg>\n',
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
        '  <path fill-rule="evenodd" d="M5.625 1.5c-1.036 0-1.875.84-1.875 1.875v17.25c0 1.035.84 1.875 1.875 1.875h12.75c1.035 0 1.875-.84 1.875-1.875V12.75A3.75 3.75 0 0 0 16.5 9h-1.875a1.875 1.875 0 0 1-1.875-1.875V5.25A3.75 3.75 0 0 0 9 1.5H5.625ZM7.5 15a.75.75 0 0 1 .75-.75h7.5a.75.75 0 0 1 0 1.5h-7.5A.75.75 0 0 1 7.5 15Zm.75 2.25a.75.75 0 0 0 0 1.5H12a.75.75 0 0 0 0-1.5H8.25Z" clip-rule="evenodd" />\n' +
        '  <path d="M12.971 1.816A5.23 5.23 0 0 1 14.25 5.25v1.875c0 .207.168.375.375.375H16.5a5.23 5.23 0 0 1 3.434 1.279 9.768 9.768 0 0 0-6.963-6.963Z" />\n' +
        '</svg>\n',
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
        '  <path fill-rule="evenodd" d="M9 1.5H5.625c-1.036 0-1.875.84-1.875 1.875v17.25c0 1.035.84 1.875 1.875 1.875h12.75c1.035 0 1.875-.84 1.875-1.875V12.75A3.75 3.75 0 0 0 16.5 9h-1.875a1.875 1.875 0 0 1-1.875-1.875V5.25A3.75 3.75 0 0 0 9 1.5Zm6.61 10.936a.75.75 0 1 0-1.22-.872l-3.236 4.53L9.53 14.47a.75.75 0 0 0-1.06 1.06l2.25 2.25a.75.75 0 0 0 1.14-.094l3.75-5.25Z" clip-rule="evenodd" />\n' +
        '  <path d="M12.971 1.816A5.23 5.23 0 0 1 14.25 5.25v1.875c0 .207.168.375.375.375H16.5a5.23 5.23 0 0 1 3.434 1.279 9.768 9.768 0 0 0-6.963-6.963Z" />\n' +
        '</svg>\n',
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
        '  <path d="M3.375 3C2.339 3 1.5 3.84 1.5 4.875v.75c0 1.036.84 1.875 1.875 1.875h17.25c1.035 0 1.875-.84 1.875-1.875v-.75C22.5 3.839 21.66 3 20.625 3H3.375Z" />\n' +
        '  <path fill-rule="evenodd" d="m3.087 9 .54 9.176A3 3 0 0 0 6.62 21h10.757a3 3 0 0 0 2.995-2.824L20.913 9H3.087Zm6.163 3.75A.75.75 0 0 1 10 12h4a.75.75 0 0 1 0 1.5h-4a.75.75 0 0 1-.75-.75Z" clip-rule="evenodd" />\n' +
        '</svg>\n',
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
        '  <path fill-rule="evenodd" d="M9.315 7.584C12.195 3.883 16.695 1.5 21.75 1.5a.75.75 0 0 1 .75.75c0 5.056-2.383 9.555-6.084 12.436A6.75 6.75 0 0 1 9.75 22.5a.75.75 0 0 1-.75-.75v-4.131A15.838 15.838 0 0 1 6.382 15H2.25a.75.75 0 0 1-.75-.75 6.75 6.75 0 0 1 7.815-6.666ZM15 6.75a2.25 2.25 0 1 0 0 4.5 2.25 2.25 0 0 0 0-4.5Z" clip-rule="evenodd" />\n' +
        '  <path d="M5.26 17.242a.75.75 0 1 0-.897-1.203 5.243 5.243 0 0 0-2.05 5.022.75.75 0 0 0 .625.627 5.243 5.243 0 0 0 5.022-2.051.75.75 0 1 0-1.202-.897 3.744 3.744 0 0 1-3.008 1.51c0-1.23.592-2.323 1.51-3.008Z" />\n' +
        '</svg>\n',
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
        '  <path d="M10.464 8.746c.227-.18.497-.311.786-.394v2.795a2.252 2.252 0 0 1-.786-.393c-.394-.313-.546-.681-.546-1.004 0-.323.152-.691.546-1.004ZM12.75 15.662v-2.824c.347.085.664.228.921.421.427.32.579.686.579.991 0 .305-.152.671-.579.991a2.534 2.534 0 0 1-.921.42Z" />\n' +
        '  <path fill-rule="evenodd" d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25ZM12.75 6a.75.75 0 0 0-1.5 0v.816a3.836 3.836 0 0 0-1.72.756c-.712.566-1.112 1.35-1.112 2.178 0 .829.4 1.612 1.113 2.178.502.4 1.102.647 1.719.756v2.978a2.536 2.536 0 0 1-.921-.421l-.879-.66a.75.75 0 0 0-.9 1.2l.879.66c.533.4 1.169.645 1.821.75V18a.75.75 0 0 0 1.5 0v-.81a4.124 4.124 0 0 0 1.821-.749c.745-.559 1.179-1.344 1.179-2.191 0-.847-.434-1.632-1.179-2.191a4.122 4.122 0 0 0-1.821-.75V8.354c.29.082.559.213.786.393l.415.33a.75.75 0 0 0 .933-1.175l-.415-.33a3.836 3.836 0 0 0-1.719-.755V6Z" clip-rule="evenodd" />\n' +
        '</svg>\n',
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
        '  <path fill-rule="evenodd" d="M7.502 6h7.128A3.375 3.375 0 0 1 18 9.375v9.375a3 3 0 0 0 3-3V6.108c0-1.505-1.125-2.811-2.664-2.94a48.972 48.972 0 0 0-.673-.05A3 3 0 0 0 15 1.5h-1.5a3 3 0 0 0-2.663 1.618c-.225.015-.45.032-.673.05C8.662 3.295 7.554 4.542 7.502 6ZM13.5 3A1.5 1.5 0 0 0 12 4.5h4.5A1.5 1.5 0 0 0 15 3h-1.5Z" clip-rule="evenodd" />\n' +
        '  <path fill-rule="evenodd" d="M3 9.375C3 8.339 3.84 7.5 4.875 7.5h9.75c1.036 0 1.875.84 1.875 1.875v11.25c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625V9.375Zm9.586 4.594a.75.75 0 0 0-1.172-.938l-2.476 3.096-.908-.907a.75.75 0 0 0-1.06 1.06l1.5 1.5a.75.75 0 0 0 1.116-.062l3-3.75Z" clip-rule="evenodd" />\n' +
        '</svg>\n',
        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">\n' +
        '  <path fill-rule="evenodd" d="M5.47 5.47a.75.75 0 0 1 1.06 0L12 10.94l5.47-5.47a.75.75 0 1 1 1.06 1.06L13.06 12l5.47 5.47a.75.75 0 1 1-1.06 1.06L12 13.06l-5.47 5.47a.75.75 0 0 1-1.06-1.06L10.94 12 5.47 6.53a.75.75 0 0 1 0-1.06Z" clip-rule="evenodd" />\n' +
        '</svg>\n'
    ];

    let stepsHistory = [];



    function createStep(hanhDong, ngayTao, stepNum) {
        const iconBgColor = stepNum === 7 ? 'bg-red-600' : 'bg-green-600';

        const stepDiv = $(`
        <div class="flex items-center ml-8 step" data-step="${stepNum}">
            <div class="h-8 w-8 ${iconBgColor} text-white rounded-full flex items-center justify-center">
                ${icons[stepNum]}
            </div>
            <div class="ml-4">
                <h2 class="text-lg font-semibold">${trangThaiSteps(hanhDong)}</h2>
                <p class="text-gray-600">
                    ${ngayTao != null ? new Date(ngayTao).toLocaleString('vi-VN', {
            day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit'
        }) : ''}
                </p>
            </div>
        </div>
    `);

        return stepDiv;
    }


    function updateButtonsState() {
        $('#steppers').empty();
        stepsHistory.forEach((step, index) => {
            $('#steppers').append(createStep(step.hanhDong, step.ngayTao, step.hanhDong));
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
        showNoteModalLui();
    });

    $('#huyLui').click(function () {
        hideNoteModalLui();
    });

    $('#xacNhanLui').click(function () {
        currentStep--;

        const noteModalLui = $('#noteLui').val();
        getLichSu();

        if (noteModalLui.length < 10) {
            $('#noteErrorLui').removeClass('hidden');
            return;
        } else {
            $('#noteErrorLui').addClass('hidden');
        }

        stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
        luiTrangThai(currentStep)
        updateButtonsState();
        hideNoteModalLui();
        getLichSu();


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

        if (currentStep === 2 && confirm("Bạn có muốn in hóa đơn không?")) {

            setTimeout(() => {
                console.log('Bắt đầu in');
                window.print();
            }, 100);
            for (let i = 0; i < idSP.length; i++) {
                let sanPham = idSP[i];
                console.log(sanPham);
                updateSoLuongSP(sanPham.id, sanPham.soLuong);
            }
            stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
            updateTrangThai(currentStep);
            showNotification("Xác nhận thành công", "thanhCong");
            updateButtonsState();
            hideNoteModal();
            getLichSu();
        }else if(currentStep === 3){
            updateTrangThaiPhuongThucThanhToan(idHoaDon);
            stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
            updateTrangThai2(currentStep);
            showNotification("Thanh toán thành công", "thanhCong");
            updateButtonsState();
            hideNoteModal();
            getLichSu();
        }else if(currentStep === 6){
            updateTrangThaiPhuongThucThanhToan(idHoaDon);
            stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
            updateTrangThai(currentStep);
            showNotification("Thanh toán thành công", "thanhCong");
            updateButtonsState();
            hideNoteModal();
            getLichSu();
        } else {
            stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
            updateTrangThai(currentStep)
            showNotification("Xác nhận thành công", "thanhCong");
            updateButtonsState();
            hideNoteModal();
            getLichSu();
        }


    });


    function updateSoLuongSP(idSPCT, soLuong){
        $.ajax({
            url: `/api/gio-hang/update-so-luong-sp-sau-khi-thanh-toan/${idSPCT}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                soLuong: soLuong
            }),
            success: function () {

            },

        });
    }

    $('#xacNhanHuy').click(function () {
        currentStep = 7;

        const noteHuy = $('#noteHuy').val();

        if (noteHuy.length < 10) {
            $('#noteHuyError').removeClass('hidden');
            return;
        } else {
            $('#noteHuyError').addClass('hidden');
        }

        stepsHistory.push({hanhDong: currentStep, ngayTao: new Date().toISOString()});
        huyHoaDon(currentStep);
        updateButtonsState();
        hideNoteModalHuy();
        getLichSu();

    });

    function fetchStepsData(idHoaDon) {
        $.ajax({
            url: `/api/hoa-don/lich-su-hoa-don-co-thong-tin/${idHoaDon}`, method: 'GET', success: function (data) {
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

    function updateTrangThaiPhuongThucThanhToan(idHoaDon) {
        $.ajax({
            url: `/api/hoa-don/update-trang-thai-thanh-toan/${idHoaDon}`,
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({loaiThanhToan: true}),
            success: function (response) {
            },
        });
    }


    function luiTrangThai(trangThai) {
        const ghiChu = $('#noteModalLui').val().trim();
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

    function huyHoaDon(trangThai) {
        const ghiChu = $('#noteHuy').val().trim();
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

    function updateTrangThai2(trangThai) {
        const ghiChu = $('#noteText').val().trim();
        const hanhDong = trangThai;
        $.ajax({
            url: `/api/hoa-don/update-ngay-nhan/${idHoaDon}`,
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

    function showNotification(message, status) {
        var notification = document.getElementById('notification');
        var notificationMessage = document.getElementById('notification-message');
        var progressBar = document.getElementById('progress-bar');

        notification.className = 'notification'; // Reset class
        if (status === 'thanhCong') {
            notification.classList.add('thanhCong');
        } else if (status === 'thatBai') {
            notification.classList.add('thatBai');
        }

        if (message) {
            notificationMessage.textContent = message;
            notification.style.display = 'block';
            progressBar.style.width = '100%';

            setTimeout(function() {
                progressBar.style.width = '0';
            }, 10); // Bắt đầu giảm thanh tiến trình ngay lập tức

            setTimeout(function() {
                notification.style.display = 'none';
                progressBar.style.width = '100%'; // Đặt lại thanh tiến trình sau khi thông báo ẩn
            }, 3010); // Thời gian hiển thị thông báo (3010 ms = 3 giây + 10 ms để bắt đầu giảm)
        }
    }


    fetchHoaDonDetail(idHoaDon);

});


const formatVND2 = (tongtien) => {
    return tongtien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + ' VNĐ';
}


let idChatLieu = '';
let idCoGiay = '';
let idDeGiay = ''
let idKichCo = '';
let idMauSac = '';
let idThuongHieu = '';
let keyword = '';
let giaBanMin = '';
let giaBanMax = '';
let page = 0
let size = 5;

$('#timKiemBlaBla').click(function() {
    // Cập nhật các giá trị tìm kiếm từ các input
    idChatLieu = $('#combo-box-chat-lieu').val();
    idMauSac = $('#combo-box-mau-sac').val();
    idKichCo = $('#combo-box-kich-co').val();
    idCoGiay = $('#combo-box-co-giay').val();
    idDeGiay = $('#combo-box-de-giay').val();
    idThuongHieu = $('#combo-box-thuong-hieu').val();
    keyword = $('#input-TimKiem').val();
    page = 0;
    getDanhSachSanPhamCoSearch(page, size);
});

$('#tuBoTatCa').click(function() {
    $('#combo-box-chat-lieu').prop('selectedIndex', 0);
    $('#combo-box-mau-sac').prop('selectedIndex', 0);
    $('#combo-box-kich-co').prop('selectedIndex', 0);
    $('#combo-box-co-giay').prop('selectedIndex', 0);
    $('#combo-box-de-giay').prop('selectedIndex', 0);
    $('#combo-box-thuong-hieu').prop('selectedIndex', 0);
    $('#input-TimKiem').val('');

    idChatLieu = '';
    idMauSac = '';
    idKichCo = '';
    idCoGiay = '';
    idDeGiay = '';
    idThuongHieu = '';
    keyword = '';
    page = 0;

    getDanhSachSanPhamCoSearch(page, size);
});

const getDanhSachSanPhamCoSearch = (page, size) => {
    $.ajax({
        url: `/api/hoa-don/searchBlaBla?idChatLieu=${idChatLieu}&idCoGiay=${idCoGiay}&idDeGiay=${idDeGiay}&idKichCo=${idKichCo}&idMauSac=${idMauSac}&idThuongHieu=${idThuongHieu}&keyword=${keyword}&giaBanMin=${giaBanMin}&giaBanMax=${giaBanMax}&page=${page}&size=${size}`,
        method: 'GET',
        success: function (result) {
            let list = "";
            $("#danhSachSanPham").empty();
            for (let i = 0; i < result.content.length; i++) {
                list += `
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">${i + 1}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <img src="${result.content[i].anh}" alt="Ảnh" class="w-16 h-auto">
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap font-bold">
                            <h1>${result.content[i].ten}</h1>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">${formatVND2(result.content[i].giaBan)}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${result.content[i].soLuong}</td>
                        <td class="px-6 py-4 whitespace-nowrap">${result.content[i].kichCo.ten}</td>
                        <td>
                            <div class="color-container rounded-lg ml-5 border-3" style="background-color: ${result.content[i].mauSac.ten}; width: 50px; height: 20px;"></div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <span class="bg-green-500 rounded-lg text-white px-2 py-1">${result.content[i].trangThai}</span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <button id="hienThiDanhSachSanPham" class="themSanPham bg-blue-500 text-white px-4 py-2 rounded h-[50%] mt-1 hover:bg-blue-600 hover:text-gray-100" data-id="${result.content[i].id}" data-gia-ban="${result.content[i].giaBan}">Thêm</button>
                        </td>
                    </tr>`;
            }

            $("#danhSachSanPham").html(list);

            // Phân trang
            let pagination = '';
            pagination += `
                <button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getDanhSachSanPhamCoSearch(${result.pageable.pageNumber - 1}, ${size})" ${result.pageable.pageNumber === 0 ? 'disabled' : ''}>Previous</button>
            `;

            const maxVisiblePages = 3;
            const halfVisiblePages = Math.floor(maxVisiblePages / 2);
            let startPage = Math.max(1, result.pageable.pageNumber + 1 - halfVisiblePages);
            let endPage = Math.min(startPage + maxVisiblePages - 1, result.totalPages);

            if (startPage > 1) {
                pagination += `
                    <button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getDanhSachSanPhamCoSearch(0, ${size})">1</button>
                `;
                if (startPage > 2) {
                    pagination += `<span class="px-4 py-2">...</span>`;
                }
            }

            for (let i = startPage; i <= endPage; i++) {
                pagination += `
                    <button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1 ${i === result.pageable.pageNumber + 1 ? 'bg-blue-600 text-white' : ''}" onclick="getDanhSachSanPhamCoSearch(${i - 1}, ${size})">${i}</button>
                `;
            }

            if (endPage < result.totalPages) {
                if (endPage < result.totalPages - 1) {
                    pagination += `<span class="px-4 py-2">...</span>`;
                }

                pagination += `
                    <button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getDanhSachSanPhamCoSearch(${result.totalPages - 1}, ${size})">${result.totalPages}</button>
                `;
            }

            pagination += `
                <button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getDanhSachSanPhamCoSearch(${result.pageable.pageNumber + 1}, ${size})" ${result.pageable.pageNumber + 1 === result.totalPages ? 'disabled' : ''}>Next</button>
            `;

            $("#paginationSP").html(pagination);
        }
    });
};


// const getDanhSachSanPham = (page = 0, size = 5) => {
//     $.ajax({
//         url: `/api/hoa-don/danh-sach-san-pham?page=${page}&size=${size}`,
//         method: 'GET',
//         success: function (result) {
//             let list = "";
//             $("#danhSachSanPham").empty();
//             for (let i = 0; i < result.content.length; i++) {
//                 list += `
//                     <tr>
//                         <td class="px-6 py-4 whitespace-nowrap">${i + 1}</td>
//                         <td class="px-6 py-4 whitespace-nowrap">
//                             <img src="${result.content[i].anh}" alt="Image" class="w-16 h-auto">
//
//                         </td>
//                         <td class="px-6 py-4 whitespace-nowrap font-bold">
//                             <h1>${result.content[i].ten}</h1>
//                         </td>
//                         <td class="px-6 py-4 whitespace-nowrap">${formatVND2(result.content[i].giaBan)}</td>
//                         <td class="px-6 py-4 whitespace-nowrap">${result.content[i].soLuong}</td>
//                         <td class="px-6 py-4 whitespace-nowrap">${result.content[i].kichCo.ten}</td>
//                         <td>
//                             <div class="color-container rounded-lg ml-5 border-3" style="background-color: ${result.content[i].mauSac.ten}; width: 50px; height: 20px;"></div>
//                         </td>
//                         <td class="px-6 py-4 whitespace-nowrap">
//                             <span class="bg-green-500 rounded-lg text-white px-2 py-1">${result.content[i].trangThai}</span>
//                         </td>
//                         <td class="px-6 py-4 whitespace-nowrap">
//                            <button id="hienThiDanhSachSanPham" class="themSanPham bg-blue-500 text-white px-4 py-2 rounded h-[50%] mt-1 hover:bg-blue-600 hover:text-gray-100" data-id="${result.content[i].id}" data-gia-ban="${result.content[i].giaBan}">Thêm
//                             </button>
//                         </td>
//                     </tr>`;
//             }
//
//             $("#danhSachSanPham").html(list);
//
//             let pagination = '';
//             pagination += `
//                 <button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getDanhSachSanPham(${result.pageable.pageNumber - 1}, ${size})" ${result.pageable.pageNumber === 0 ? 'disabled' : ''}>Previous</button>
//             `;
//
//             const maxVisiblePages = 3;
//             const halfVisiblePages = Math.floor(maxVisiblePages / 2);
//             let startPage = Math.max(1, result.pageable.pageNumber + 1 - halfVisiblePages);
//             let endPage = Math.min(startPage + maxVisiblePages - 1, result.totalPages);
//
//             if (startPage > 1) {
//                 pagination += `
//                     <button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getDanhSachSanPham(0, ${size})">1</button>
//                 `;
//                 if (startPage > 2) {
//                     pagination += `<span class="px-4 py-2">...</span>`;
//                 }
//             }
//
//             for (let i = startPage; i <= endPage; i++) {
//                 pagination += `
//                     <button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1 ${i === result.pageable.pageNumber + 1 ? 'bg-blue-600 text-white' : ''}" onclick="getDanhSachSanPham(${i - 1}, ${size})">${i}</button>
//                 `;
//             }
//
//             if (endPage < result.totalPages) {
//                 if (endPage < result.totalPages - 1) {
//                     pagination += `<span class="px-4 py-2">...</span>`;
//                 }
//                 pagination += `
//                     <button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getDanhSachSanPham(${result.totalPages - 1}, ${size})">${result.totalPages}</button>
//                 `;
//             }
//
//             pagination += `
//                 <button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getDanhSachSanPham(${result.pageable.pageNumber + 1}, ${size})" ${result.pageable.pageNumber + 1 === result.totalPages ? 'disabled' : ''}>Next</button>
//             `;
//
//             $("#paginationSP").html(pagination);
//         }
//
//     });
// };





