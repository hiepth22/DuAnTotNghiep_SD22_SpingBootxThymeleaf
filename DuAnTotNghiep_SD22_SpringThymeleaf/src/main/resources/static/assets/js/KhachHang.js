// (function () {
//     searchKH("");
// })();
// function resetForm() {
//     document.getElementById("trangThai").value = "";
//     document.getElementById("searchInput").value = "";
//     document.getElementById("startDate").value = "";
//     document.getElementById("endDate").value = "";
// }
//
function searchKH(keyword, page_index = 1, page_size = 5) {
    console.log(keyword);
    var url = '/admin/search-khach-hang?keyword=' + encodeURIComponent(keyword);
    console.log(url);
    fetch(url)
        .then(response => response.text())
        .then(data => {
            var tableBody = document.getElementById('formkh');
            tableBody.innerHTML = data.trim();
        })
        .catch(error => console.error('Error:', error));
}

(function () {
    initPage();
})();

function getPageNumber(button) {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    var pageNumber = button.innerText.trim();

    searchKhachHang({
        keyword: keyword,
        trangThai: status !== "" ? status : null,
        page_index: pageNumber,
        page_size: 7,
        startDate: startDate !== "" ? startDate : null,
        endDate: endDate !== "" ? endDate : null

    });


}

function resetForm() {
    document.getElementById("trangThai").value = "";
    document.getElementById("searchInput").value = "";
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
}

function OnSearchKH() {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    var obj = {
        keyword: keyword,
        trangThai: status != "" ? status : null,
        vai_tro: vaiTro != "" ? vaiTro : null,
        page_index: 1,
        page_size: 5,
        startDate: startDate !== "" ? startDate : null,
        endDate: endDate !== "" ? endDate : null
    }

    console.log(obj);

    searchKhachHang(obj);
}

function initPage() {
    searchKhachHang({
        keyword: "",
        trangThai: null,
        page_index: 1,
        page_size: 7,
        startDate: null,
        endDate: null
    });
}

function searchKhachHang(obj) {

    Object.keys(obj).forEach((k) => obj[k] == null && delete obj[k]);

    var params = new URLSearchParams(obj);

    var url = '/admin/search-khach-hang?' + params.toString();

    fetch(url, obj)
        .then(response => response.text())
        .then(data => {
            var tableBody = document.getElementById('formkh');
            if (tableBody) {
                tableBody.innerHTML = data.trim();
            } else {
                console.error('Element with id "formkh" not found.');
                // Optionally handle the case where the element is not found
            }
        })
        .catch(error => console.error('Error:', error));

}

function validateForm() {
    let isValid = true;

    // Validate required fields
    document.querySelectorAll('input[required], textarea[required]').forEach(input => {
        if (!input.value.trim()) {
            isValid = false;
            input.classList.add('is-invalid');
            input.nextElementSibling.style.display = 'block';
        } else {
            input.classList.remove('is-invalid');
            input.nextElementSibling.style.display = 'none';
        }
    });

    // Validate phone number
    const sdt = document.getElementById('sdt');
    const sdtEmptyFeedback = document.getElementById('sdt-empty');
    const sdtInvalidFeedback = document.getElementById('sdt-invalid');
    const phoneRegex = /^[0-9]{10,}$/;

    if (!sdt.value.trim()) {
        isValid = false;
        sdt.classList.add('is-invalid');
        sdtEmptyFeedback.style.display = 'block';
        sdtInvalidFeedback.style.display = 'none';
    } else if (!phoneRegex.test(sdt.value.trim())) {
        isValid = false;
        sdt.classList.add('is-invalid');
        sdtInvalidFeedback.style.display = 'block';
        sdtEmptyFeedback.style.display = 'none';
    } else {
        sdt.classList.remove('is-invalid');
        sdtEmptyFeedback.style.display = 'none';
        sdtInvalidFeedback.style.display = 'none';
    }

    // Validate password
    const matKhau = document.getElementById('matKhau');
    const matKhauEmptyFeedback = document.getElementById('matKhau-empty');
    const matKhauInvalidFeedback = document.getElementById('matKhau-invalid');
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

    if (!matKhau.value.trim()) {
        isValid = false;
        matKhau.classList.add('is-invalid');
        matKhauEmptyFeedback.style.display = 'block';
        matKhauInvalidFeedback.style.display = 'none';
    } else if (!passwordRegex.test(matKhau.value.trim())) {
        isValid = false;
        matKhau.classList.add('is-invalid');
        matKhauInvalidFeedback.style.display = 'block';
        matKhauEmptyFeedback.style.display = 'none';
    } else {
        matKhau.classList.remove('is-invalid');
        matKhauEmptyFeedback.style.display = 'none';
        matKhauInvalidFeedback.style.display = 'none';
    }

    // Validate ten (Tên Khách Hàng)
    const ten = document.getElementsByName('ten')[0];
    if (!ten.value.trim()) {
        isValid = false;
        ten.classList.add('is-invalid');
        ten.nextElementSibling.style.display = 'block';
    } else {
        ten.classList.remove('is-invalid');
        ten.nextElementSibling.style.display = 'none';
    }

    // Validate ma (Mã Khách Hàng)
    const ma = document.getElementsByName('ma')[0];
    if (!ma.value.trim()) {
        isValid = false;
        ma.classList.add('is-invalid');
        ma.nextElementSibling.style.display = 'block';
    } else {
        ma.classList.remove('is-invalid');
        ma.nextElementSibling.style.display = 'none';
    }

    // Validate email
    const email = document.getElementsByName('email')[0];
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email.value.trim()) {
        isValid = false;
        email.classList.add('is-invalid');
        email.nextElementSibling.style.display = 'block';
    } else if (!emailRegex.test(email.value.trim())) {
        isValid = false;
        email.classList.add('is-invalid');
        email.nextElementSibling.style.display = 'block';
    } else {
        email.classList.remove('is-invalid');
        email.nextElementSibling.style.display = 'none';
    }

    // Validate cccd
    const cccd = document.getElementsByName('cccd')[0];
    if (!cccd.value.trim()) {
        isValid = false;
        cccd.classList.add('is-invalid');
        cccd.nextElementSibling.style.display = 'block';
    } else {
        cccd.classList.remove('is-invalid');
        cccd.nextElementSibling.style.display = 'none';
    }

    return isValid;
}

function checkTrangThai(element, id) {
    var trangThai = $(element).data('trang-thai');
    var isChecked = element.checked;

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
            toggleSwitch(id, isChecked);
        } else {
            // Đảo ngược lại trạng thái của checkbox nếu người dùng hủy bỏ
            element.checked = !isChecked;
            Swal.fire(
                'Đã hủy!',
                'Hành động của bạn đã bị hủy.',
                'error'
            );
        }
    });
}

// function checkTrangThai(checkbox, id) {
//     Swal.fire({
//         title: 'Bạn có chắc chắn?',
//         text: "Bạn không thể hoàn tác hành động này!",
//         icon: 'warning',
//         showCancelButton: true,
//         confirmButtonColor: '#3085d6',
//         cancelButtonColor: '#d33',
//         confirmButtonText: 'Vâng, tiếp tục!',
//         cancelButtonText: 'Hủy'
//     }).then((result) => {
//         if (result.isConfirmed) {
//             // Call your function to change the status here
//             changeStatus(id, checkbox.checked);
//             Swal.fire(
//                 'Đã xác nhận!',
//                 'Trạng thái của phiếu giảm giá đã được thay đổi.',
//                 'success'
//             );
//         } else {
//             // Revert the checkbox status
//             checkbox.checked = !checkbox.checked;
//             Swal.fire(
//                 'Đã hủy!',
//                 'Hành động của bạn đã bị hủy.',
//                 'error'
//             );
//         }
//     });
// }
function toggleSwitch(id, isChecked) {
    var url = `/admin/khach-hang/${id}/delete`;
    var trangThai = isChecked ? 1 : 0;

    var data = {
        trangThai: trangThai
    };

    // Hiển thị spinner loading
    $('#spinner').addClass('show');

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.text(); // Lấy nội dung phản hồi dưới dạng văn bản
        })
        .then(responseText => {
            // Ẩn spinner loading
            $('#spinner').removeClass('show');

            // Hiển thị thông báo thành công
            $('#notification2').addClass('show1');

            // Tự động ẩn thông báo sau 3 giây
            setTimeout(function () {
                $('#notification2').removeClass('show1');
            }, 3000);
        })
        .catch(error => {
            // Xử lý lỗi
            console.error('Lỗi khi cập nhật trạng thái:', error);

            // Đảo ngược lại trạng thái checkbox nếu có lỗi
            var checkbox = document.getElementById(`switchButton_${id}`);
            if (checkbox) {
                checkbox.checked = !isChecked;
            } else {
                console.error(`Không tìm thấy checkbox với id ${id} trong DOM.`);
            }

            // Ẩn spinner loading
            $('#spinner').removeClass('show');

            // Hiển thị thông báo lỗi
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Có lỗi xảy ra khi cập nhật trạng thái!',
            });
        });
}

$(document).ready(function () {
    console.log("JavaScript is working"); // Kiểm tra JavaScript đã hoạt động

    $('#exampleModal').on('show.bs.modal', function (event) {
        console.log("Modal is being shown"); // Kiểm tra sự kiện show.bs.modal
        var button = $(event.relatedTarget); // Button that triggered the modal
        var khId = button.data('kh-id'); // Extract info from data-* attributes
        console.log('Customer ID:', khId); // Kiểm tra giá trị khId

        if (khId) {
            $.ajax({
                url: '/api/khach-hang/dia-chi/' + khId,
                method: 'GET',
                success: function (data) {
                    console.log('Received data:', data); // Kiểm tra dữ liệu nhận được
                    var modal = $('#exampleModal');
                    var modalBody = modal.find('.modal-body #modal-address-details');
                    modalBody.empty(); // Clear previous data
                    console.log(data);
                    if (data.length > 0) {
                        data.forEach(function (diaChi) {
                            console.log('Thành công');
                            modalBody.append(`
                                <div class="address-block mb-3 d-flex justify-content-between align-items-center" style="border: 1px solid #ddd; padding: 10px; border-radius: 5px;">
                                    <div>
                                        <strong style="display: block; margin-bottom: 5px;">${diaChi.ten}</strong>
                                        <p style="margin: 0;">${diaChi.moTaChiTiet}, ${diaChi.soNha}, ${diaChi.phuongXa}, ${diaChi.quanHuyen}, ${diaChi.thanhPho}</p>
                                    </div>
                                    <button type="button" class="btn btn-outline-orange btn-sm btn-update-address" data-dia-chi-id="${diaChi.id}" style="border: 1px solid orange; background-color: white; color: black;"><i class="bi bi-pencil-square"></i></button>
                                </div>
                            `);
                        });
                    } else {
                        console.log('Không thành công');
                        modalBody.append('<li>Không có địa chỉ</li>');
                    }
                },
                error: function () {
                    var modal = $('#exampleModal');
                    var modalBody = modal.find('.modal-body #modal-address-details');
                    modalBody.empty();
                    modalBody.append('<li>Không thể tải địa chỉ</li>');
                }
            });
        } else {
            console.log("Customer ID is undefined or null");
        }
    });
});


// function toggleSwitch(id, isChecked) {
//     var url = `/admin//khach-hang/${id}/delete`;
//     var trangThai = isChecked ? 0 : 1;
//
//     var data = `trangThai=${trangThai}`;
//
//     // Hiển thị spinner loading
//     $('#spinner').addClass('show');
//
//     fetch(url, {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/x-www-form-urlencoded',
//         },
//         body: data,
//     })
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error(`HTTP error! Status: ${response.status}`);
//             }
//             return response.text(); // Lấy nội dung phản hồi dưới dạng văn bản
//         })
//         .then(responseText => {
//             // Ẩn spinner loading
//             $('#spinner').removeClass('show');
//
//             // Hiển thị thông báo thành công
//             $('#notification2').addClass('show1');
//
//             // // Cập nhật trạng thái checkbox nếu cần thiết
//             // var checkbox = document.getElementById(`switchButton_${id}`);
//             // if (checkbox) {
//             //     checkbox.checked = isChecked;
//             // } else {
//             //     console.error(`Không tìm thấy checkbox với id ${id} trong DOM.`);
//             // }
//
//             // Tự động ẩn thông báo sau 3 giây
//             setTimeout(function() {
//                 $('#notification2').removeClass('show1');
//             }, 3000);
//         })
//         .catch(error => {
//             // Xử lý lỗi
//             console.error('Lỗi khi cập nhật trạng thái:', error);
//
//             // Đảo ngược lại trạng thái checkbox nếu có lỗi
//             var checkbox = document.getElementById(`switchButton_${id}`);
//             if (checkbox) {
//                 checkbox.checked = !isChecked;
//             } else {
//                 console.error(`Không tìm thấy checkbox với id ${id} trong DOM.`);
//             }
//
//             // Ẩn spinner loading
//             $('#spinner').removeClass('show');
//
//             // Hiển thị thông báo lỗi
//             Swal.fire({
//                 icon: 'error',
//                 title: 'Oops...',
//                 text: 'Có lỗi xảy ra khi cập nhật trạng thái!',
//             });
//         });
// }


// $(document).ready(function () {
//     // Xử lý khi nhấn vào nút "Địa Chỉ" trong modal
//     $('#exampleModal').on('show.bs.modal', function (event) {
//         var button = $(event.relatedTarget);
//         var khId = button.data('kh-id');
//
//         $.ajax({
//             url: '/admin/khach-hang/dia-chi/' + khId,
//             method: 'GET',
//             success: function (data) {
//                 var modalBody = $('#exampleModal').find('.modal-body #modal-address-details');
//                 modalBody.empty(); // Xóa dữ liệu trước đó
//
//                 if (data.length > 0) {
//                     data.forEach(function (diaChi) {
//                         modalBody.append('<li>' + diaChi.thanhPho + '</li>');
//                     });
//                 } else {
//                     modalBody.append('<li>Không có địa chỉ</li>');
//                 }
//             },
//             error: function () {
//                 var modalBody = $('#exampleModal').find('.modal-body #modal-address-details');
//                 modalBody.empty();
//                 modalBody.append('<li>Không thể tải địa chỉ</li>');
//             }
//         });
//     });

// Xác nhận và xử lý toggle trạng thái
// $('.toggle-checkbox').on('click', function () {
//     var checkbox = $(this);
//     var isChecked = checkbox.is(':checked');
//     var khId = checkbox.data('id');
//     var trangThai = isChecked ? 1 : 0;
//
//     confirmToggle(checkbox, khId, trangThai);
// });

// function confirmToggle(element, id, trangThai) {
//     var confirmed = confirm("THAY ĐỔI TRẠNG THÁI KHÁCH HÀNG?");
//
//     if (confirmed) {
//         toggleSwitch(element, id, trangThai);
//     } else {
//         element.prop('checked', !trangThai);
//     }
// }

// function toggleSwitch(element, id, trangThai) {
//     var url = `/admin/khach-hang/${id}/delete`;
//     var data = {trangThai: trangThai};
//
//     fetch(url, {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json',
//         },
//         body: JSON.stringify(data),
//     })
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error(`HTTP error! Status: ${response.status}`);
//             }
//             alert(`THÀNH CÔNG!!!`);
//         })
//         .catch(error => {
//             console.error('Error updating customer status:', error);
//             alert('LỖI!!!!');
//             element.prop('checked', !trangThai); // Đặt lại trạng thái checkbox nếu có lỗi
//         });
// }


// function toggleSwitch(element, id, isChecked) {
//     var url = `/admin/khach-hang/${id}/delete`; // Đảm bảo rằng id đã được thay thế đúng giá trị
//     var data = { trangThai: isChecked ? 0 : 1 };
//
//     fetch(url, {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json',
//         },
//         body: JSON.stringify(data),
//     })
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error(`HTTP error! Status: ${response.status}`);
//             }
//             alert(`THÀNH CÔNG!!!`);
//         })
//         .catch(error => {
//             console.error('Error updating employee status:', error);
//             // Xử lý lỗi nếu cần thiết
//             alert('LỖI!!!!.');
//             // Đặt lại trạng thái checkbox nếu có lỗi
//             element.checked = !isChecked;
//         });
// }
