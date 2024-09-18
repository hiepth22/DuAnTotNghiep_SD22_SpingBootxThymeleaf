document.getElementById('confirmButton').addEventListener('click', function(event) {
    event.preventDefault(); // Ngăn chặn hành động mặc định của nút submit
    if (validateForm()) {
        Swal.fire({
            title: 'Cập nhật Khách Hàng?',
            text: "Bạn không thể hoàn tác hành động này!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Cập Nhật'
        }).then((result) => {
            if (result.isConfirmed) {
                addCustomer();
            }
        });
    }
});

function addCustomer() {
    const form = document.getElementById('myForm');
    const formData = new FormData(form);
    const id = form.querySelector('#id').value;
    // Thêm lớp 'disabled' và thay đổi văn bản của nút Lưu
    const confirmButton = document.getElementById('confirmButton');
    confirmButton.classList.add('disabled');
    confirmButton.textContent = 'Đang lưu...';

    axios.post('/admin/update/'+ id,formData)
        .then(response => {
            // Xóa lớp 'disabled' và thay đổi văn bản của nút Lưu khi hoàn thành
            confirmButton.classList.remove('disabled');
            confirmButton.textContent = 'Lưu';

            Swal.fire(
                'Thành công!',
                'Cập Nhật Khách Hàng thành công.',
                'success'
            ).then(() => {
                window.location.href = '/admin/khach-hang'; // Chuyển hướng về trang KhachHang.html
            });
        })
        .catch(error => {
            // Xóa lớp 'disabled' và thay đổi văn bản của nút Lưu khi có lỗi
            confirmButton.classList.remove('disabled');
            confirmButton.textContent = 'Lưu';

            Swal.fire(
                'Lỗi!',
                'Có Lỗi khi cập nhật khách hàng.',
                'error'
            );
        });
}

function showSuccessMessage() {
    const notification = document.getElementById('notification');
    notification.classList.add('show');
    const progressBar = document.getElementById('progress-bar');
    progressBar.style.width = '0%'; // Đặt lại thanh progress

    // Làm cho thanh progress chạy từ 0% đến 100%
    setTimeout(() => {
        progressBar.style.width = '100%';
    }, 100);

    // Ẩn thông báo sau 3 giây
    setTimeout(() => {
        notification.classList.remove('show');
    }, 3000);
}

function validateForm() {
    let valid = true;

    // Kiểm tra Tên
    const tenInput = document.getElementById('ten');
    const ten = tenInput.value.trim();
    const tenError = document.getElementById('tenError');
    if (ten === '') {
        if (tenError) {
            tenError.textContent = 'Tên không được để trống.';
        }
        valid = false;
    } else {
        if (tenError) {
            tenError.textContent = '';
        }
    }

    // Kiểm tra Số Điện Thoại
    const sdtInput = document.getElementById('sdt');
    const sdt = sdtInput.value.trim();
    const sdtError = document.getElementById('sdtError');
    const sdtPattern = /^(0[3|5|7|8|9])+([0-9]{8})$/;
    if (!sdtPattern.test(sdt)) {
        if (sdtError) {
            sdtError.textContent = 'Số điện thoại không hợp lệ.';
        }
        valid = false;
    } else {
        if (sdtError) {
            sdtError.textContent = '';
        }
    }

    // Kiểm tra CCCD
    const cccdInput = document.getElementById('cccd');
    const cccd = cccdInput.value.trim();
    const cccdError = document.getElementById('cccdError');
    const cccdPattern = /^[0-9]{12}$/;
    if (!cccdPattern.test(cccd)) {
        if (cccdError) {
            cccdError.textContent = 'CCCD không hợp lệ.';
        }
        valid = false;
    } else {
        if (cccdError) {
            cccdError.textContent = '';
        }
    }

    // Kiểm tra Ngày Sinh
    const ngaySinhInput = document.getElementById('ngaySinh');
    const ngaySinh = ngaySinhInput.value.trim();
    const ngaySinhError = document.getElementById('ngaySinhError');
    if (ngaySinh === '') {
        if (ngaySinhError) {
            ngaySinhError.textContent = 'Ngày sinh không được để trống.';
        }
        valid = false;
    } else {
        const dob = new Date(ngaySinh);
        const today = new Date();
        const age = today.getFullYear() - dob.getFullYear();
        if (age < 18 || age >= 100) {
            if (ngaySinhError) {
                ngaySinhError.textContent = 'Tuổi phải lớn hơn hoặc bằng 18 và nhỏ hơn 100.';
            }
            valid = false;
        } else {
            if (ngaySinhError) {
                ngaySinhError.textContent = '';
            }
        }
    }

    // Kiểm tra Email
    const emailInput = document.getElementById('email');
    const email = emailInput.value.trim();
    const emailError = document.getElementById('emailError');
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailPattern.test(email)) {
        if (emailError) {
            emailError.textContent = 'Email không hợp lệ.';
        }
        valid = false;
    } else {
        if (emailError) {
            emailError.textContent = '';
        }
    }

    return valid;
}
