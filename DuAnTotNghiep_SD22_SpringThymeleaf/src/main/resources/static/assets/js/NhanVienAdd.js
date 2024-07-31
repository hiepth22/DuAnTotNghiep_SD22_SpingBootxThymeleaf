function handleImageChange(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            const previewImage = document.querySelector('.image-placeholder img');
            previewImage.src = e.target.result;
            previewImage.style.display = 'block';

            const placeholder = document.querySelector('.image-placeholder span');
            placeholder.style.display = 'none';
        };
        reader.readAsDataURL(input.files[0]);
    }
}

document.getElementById('confirmButton').addEventListener('click', function() {
    // Kiểm tra hợp lệ của form bằng hàm validateForm()
    if (validateForm()) {
        Swal.fire({
            title: 'Bạn có chắc chắn thêm nhân viên mới?',
            text: "Bạn không thể hoàn tác hành động này!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Vâng, tiếp tục!',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    'Đã xác nhận!',
                    'Bạn đã thêm 1 nhân viên mới.',
                    'success'
                ).then(() => {
                    add(); // Gọi hàm để xử lý việc gửi form
                });
            } else {
                Swal.fire(
                    'Đã hủy!',
                    'Hành động của bạn đã bị hủy.',
                    'error'
                );
            }
        });
    }
});

function add() {
    const form = document.getElementById('myForm');
    const formData = new FormData(form);

    axios.post('/admin/SaveNhanVien', formData)
        .then(function(response) {
            showSuccessMessage();
        })
        .catch(function(error) {
            console.error('Error:', error);
        });
}

function showSuccessMessage() {
    const notification = document.getElementById('notification');
    notification.classList.add('show');
    const progressBar = document.getElementById('progress-bar');
    progressBar.style.width = '0';
    setTimeout(function() {
        progressBar.style.width = '100%';
    }, 100);

    setTimeout(function() {
        // Remove the show class after the notification disappears
        notification.classList.remove('show');

        window.location.href = '/admin/nhan-vien';
    }, 3000);
}
async function validateForm() {
    var ten = document.getElementById('ten').value.trim();
    var sdt = document.getElementById('sdt').value.trim();
    var email = document.getElementById('email').value.trim();
    var cccd = document.getElementById('cccd').value.trim();
    var ngaySinh = document.getElementById('ngaySinh').value.trim();
    const emailError = document.getElementById('emailError');
    const sdtError = document.getElementById('sdtError');

    // Biến kiểm tra tính hợp lệ
    var isValid = true;

    // Kiểm tra địa chỉ
    var city = document.getElementById('city').value.trim();
    var district = document.getElementById('district').value.trim();
    var ward = document.getElementById('ward').value.trim();
    var diachi = document.getElementById('diachi').value.trim();

    if (city === '' || district === '' || ward === '' || diachi === '') {
        document.getElementById('dcError').textContent = 'Vui lòng nhập đầy đủ địa chỉ';
        isValid = false;
    } else {
        document.getElementById('dcError').textContent = '';
    }

    // Validate Tên
    if (ten === '') {
        document.getElementById('tenError').textContent = 'Vui lòng nhập Tên';
        isValid = false;
    } else if (ten.length < 5 || ten.length > 50) {
        document.getElementById('tenError').textContent = 'Tên phải từ 5 đến 50 ký tự';
        isValid = false;
    } else if (!/^[a-zA-ZÀ-Ỹà-ỹ ]+$/.test(ten)) {
        document.getElementById('tenError').textContent = 'Tên phải là chữ';
        isValid = false;
    } else {
        var Ten = document.getElementById("ten");
        Ten.value = ten;
        document.getElementById('tenError').textContent = '';
    }

    // Validate SĐT
    if (sdt === '') {
        sdtError.textContent = 'Vui lòng nhập SĐT';
        isValid = false;
    } else if (!/^\d{10}$/.test(sdt)) {
        sdtError.textContent = 'SĐT không hợp lệ';
        isValid = false;
    } else {
        // Kiểm tra số điện thoại đã tồn tại
        const isSdtAvailable = await checkSdtnv();
        if (!isSdtAvailable) {
            sdtError.textContent = 'Số điện thoại đã tồn tại.';
            isValid = false;
        } else {
            sdtError.textContent = '';
        }
    }

    // Validate Email
    if (email === '') {
        emailError.textContent = 'Vui lòng nhập Email';
        isValid = false;
    } else if (!/\S+@\S+\.\S+/.test(email)) {
        emailError.textContent = 'Email không hợp lệ';
        isValid = false;
    } else {
        // Kiểm tra email đã tồn tại
        const isEmailAvailable = await checkEmailnv();
        if (!isEmailAvailable) {
            emailError.textContent = 'Email đã tồn tại.';
            isValid = false;
        } else {
            var Mail = document.getElementById("email");
            Mail.value = email;
            emailError.textContent = '';
        }
    }

    // Validate CCCD
    if (cccd === '') {
        document.getElementById('cccdError').textContent = 'Vui lòng nhập CCCD';
        isValid = false;
    } else if (!/^\d{9,12}$/.test(cccd)) {
        document.getElementById('cccdError').textContent = 'CCCD phải có từ 9 đến 12 chữ số';
        isValid = false;
    } else {
        document.getElementById('cccdError').textContent = '';
    }

    // Validate Ngày Sinh
    if (ngaySinh === '') {
        document.getElementById('ngaySinhError').textContent = 'Vui lòng chọn Ngày Sinh';
        isValid = false;
    } else {
        document.getElementById('ngaySinhError').textContent = '';
        var age = calculateAge(ngaySinh);
        if (age < 18) {
            document.getElementById('ngaySinhError').textContent = 'Bạn phải đủ 18 tuổi trở lên';
            isValid = false;
        } else if (age > 60) {
            document.getElementById('ngaySinhError').textContent = 'Tuổi phải nhỏ hơn 60';
            isValid = false;
        }
    }

    return isValid;
}

async function checkEmailnv() {
    const email = document.getElementById('email').value;
    try {
        const response = await axios.get(`/admin/check-emailnv?email=${email}`);
        return !response.data;
    } catch (error) {
        console.error('Error checking email:', error);
        return false;
    }
}

async function checkSdtnv() {
    const sdt = document.getElementById('sdt').value;
    try {
        const response = await axios.get(`/admin/check-sdtnv?sdt=${sdt}`);
        return !response.data;
    } catch (error) {
        console.error('Error checking phone number:', error);
        return false;
    }
}



function calculateAge(birthday) {

    var birthDate = new Date(birthday);


    if (isNaN(birthDate.getTime())) {
        return NaN;
    }

    var today = new Date();
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();


    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }

    return age;
}
// function checkEmailnv() {
//     const email = document.getElementById('email').value;
//
//     return axios.get(`/admin/check-emailnv?email=${email}`)
//         .then(response => {
//             if (response.data) {
//                 return false;
//             } else {
//                 return true;
//             }
//         })
//         .catch(error => {
//
//             return false;
//         });
// }
//
// function checkSdtnv() {
//     const sdt = document.getElementById('sdt').value;
//     const sdtError = document.getElementById('sdtError');
//     return axios.get(`/admin/check-sdtnv?sdt=${sdt}`)
//         .then(response => {
//             if (response.data) {
//                 return false;
//             } else {
//                 return true;
//             }
//         })
//         .catch(error => {
//             sdtError.textContent = 'Số điện thoại đã tồn tại.';
//             return false;
//         });
// }

