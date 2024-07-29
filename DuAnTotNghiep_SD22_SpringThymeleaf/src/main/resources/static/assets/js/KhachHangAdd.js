function validateForm() {
    let valid = true;

    // Kiểm tra Tên
    const ten = document.getElementById('ten').value;
    const tenError = document.getElementById('tenError');
    if (ten.trim() === '') {
        tenError.textContent = 'Tên không được để trống.';
        valid = false;
    } else {
        tenError.textContent = '';
    }

    // Kiểm tra Số Điện Thoại
    const sdt = document.getElementById('sdt').value;
    const sdtError = document.getElementById('sdtError');
    const sdtPattern = /^(0[3|5|7|8|9])+([0-9]{8})$/;
    if (!sdtPattern.test(sdt)) {
        sdtError.textContent = 'Số điện thoại không hợp lệ.';
        valid = false;
    } else {
        sdtError.textContent = '';
    }

    // Kiểm tra CCCD
    const cccd = document.getElementById('cccd').value;
    const cccdError = document.getElementById('cccdError');
    const cccdPattern = /^[0-9]{12}$/;
    if (!cccdPattern.test(cccd)) {
        cccdError.textContent = 'CCCD không hợp lệ.';
        valid = false;
    } else {
        cccdError.textContent = '';
    }

    // Kiểm tra Ngày Sinh
    const ngaySinh = document.getElementById('ngaySinh').value;
    const ngaySinhError = document.getElementById('ngaySinhError');
    if (ngaySinh.trim() === '') {
        ngaySinhError.textContent = 'Ngày sinh không được để trống.';
        valid = false;
    } else {
        // Kiểm tra tuổi
        const dob = new Date(ngaySinh);
        const today = new Date();
        const age = today.getFullYear() - dob.getFullYear();
        if (age < 18 || age >= 100) {
            ngaySinhError.textContent = 'Tuổi phải lớn hơn hoặc bằng 18 và nhỏ hơn 100.';
            valid = false;
        } else {
            ngaySinhError.textContent = '';
        }
    }

    // Kiểm tra Email
    const email = document.getElementById('email').value;
    const emailError = document.getElementById('emailError');
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailPattern.test(email)) {
        emailError.textContent = 'Email không hợp lệ.';
        valid = false;
    } else {
        emailError.textContent = '';
    }

    return valid;
}

function checkEmail() {
    const email = document.getElementById('email').value;
    const emailError = document.getElementById('emailError');
    return axios.get(`/admin/check-email?email=${email}`)
        .then(response => {
            if (response.data) {
                emailError.textContent = 'Email đã tồn tại.';
                return false;
            } else {
                emailError.textContent = '';
                return true;
            }
        })
        .catch(error => {
            emailError.textContent = 'Có lỗi xảy ra khi kiểm tra email.';
            return false;
        });
}

function checkSdt() {
    const sdt = document.getElementById('sdt').value;
    const sdtError = document.getElementById('sdtError');
    return axios.get(`/admin/check-sdt?sdt=${sdt}`)
        .then(response => {
            if (response.data) {
                sdtError.textContent = 'Số điện thoại đã tồn tại.';
                return false;
            } else {
                sdtError.textContent = '';
                return true;
            }
        })
        .catch(error => {
            sdtError.textContent = 'Số điện thoại đã tồn tại.';
            return false;
        });
}

document.getElementById('confirmButton').addEventListener('click', function (event) {
    event.preventDefault(); // Ngăn chặn hành động mặc định của nút submit
    if (validateForm()) {
        Promise.all([checkEmail(), checkSdt()]).then(results => {
            if (results.every(result => result)) {
                Swal.fire({
                    title: 'Bạn có chắc chắn thêm khách hàng mới?',
                    text: "Bạn không thể hoàn tác hành động này!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Thêm mới'
                }).then((result) => {
                    if (result.isConfirmed) {
                        addCustomer();
                    }
                });
            }
        });
    }
});

function addCustomer() {
    const form = document.getElementById('myForm');
    const formData = new FormData(form);

    // Thêm lớp 'disabled' và thay đổi văn bản của nút Lưu
    const confirmButton = document.getElementById('confirmButton');
    confirmButton.classList.add('disabled');
    confirmButton.textContent = 'Đang lưu...';

    axios.post('/admin/add', formData)
        .then(response => {
            // Xóa lớp 'disabled' và thay đổi văn bản của nút Lưu khi hoàn thành
            confirmButton.classList.remove('disabled');
            confirmButton.textContent = 'Lưu';

            Swal.fire(
                'Thành công!',
                'Khách hàng đã được thêm mới.',
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
                'Có lỗi xảy ra khi thêm khách hàng.',
                'error'
            );
        });
}
