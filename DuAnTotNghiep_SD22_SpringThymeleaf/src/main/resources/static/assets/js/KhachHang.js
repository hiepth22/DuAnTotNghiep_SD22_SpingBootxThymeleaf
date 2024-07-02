(function () {
    searchKH("");
})();

function searchKH(keyword,page_index = 1, page_size = 5) {
    console.log(keyword);
    var url = '/admin/search-khach-hang?keyword='+ encodeURIComponent(keyword);
    console.log(url);
    fetch(url)
        .then(response => response.text())
        .then(data => {
            var tableBody = document.getElementById('formkh');
            tableBody.innerHTML = data.trim();
        })
        .catch(error => console.error('Error:', error));
}
const buildCloudinaryUrl = (publicId) => {
    const cloudName = "deapopcoc";
    return `https://res.cloudinary.com/${cloudName}/image/upload/${publicId}`;
};

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
function confirmToggle(element, id) {
    var isChecked = element.checked;
    var confirmed = confirm("THAY ĐỔI TRẠNG THÁI KHÁCH HÀNG?");

    if (confirmed) {
        toggleSwitch(element, id, isChecked);
    } else {
        element.checked = !isChecked;
    }
}
$(document).ready(function () {
    $('.open-modal').click(function() {
        var idKh = $(this).data('id');
        getLichSuHD(idKh);
    });
});

const getLichSuHD = (idKh) => {
    $.ajax({
        url: '/api/khach-hang/dia-chi/' + idKh,
        method: 'get',
        success: function (result) {
            let list = "";
            $("#modal-address-details").empty();
            for (let i = 0; i < result.length; i++) {
                list += `<li>${result[i].thanhPho}</li>`;
            }
            $("#modal-address-details").html(list);
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
        }
    });
}
function toggleSwitch(element, id, isChecked) {
    var url = `/admin/khach-hang/${id}/delete`; // Đảm bảo rằng id đã được thay thế đúng giá trị
    var data = { trangThai: isChecked ? 0 : 1 };

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
            alert(`THÀNH CÔNG!!!`);
        })
        .catch(error => {
            console.error('Error updating employee status:', error);
            // Xử lý lỗi nếu cần thiết
            alert('LỖI!!!!.');
            // Đặt lại trạng thái checkbox nếu có lỗi
            element.checked = !isChecked;
        });
}