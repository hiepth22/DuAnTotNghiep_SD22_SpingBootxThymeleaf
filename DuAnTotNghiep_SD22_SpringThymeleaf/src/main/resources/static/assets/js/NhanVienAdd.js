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
            Swal.fire(
                'Đã xác nhận!',
                'Hành động của bạn đã được thực hiện.',
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
});

function add() {
    const form = document.getElementById('myForm');
    axios.post('/admin/SaveNhanVien', new FormData(form))
        .then(function(response) {
            // Thêm thành công
            showSuccessMessage();
        })
        .catch(function(error) {
            console.error('Error:', error);
            // Xử lý lỗi nếu cần
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
function validateForm() {
    var ten = document.getElementById('ten').value;
    var sdt = document.getElementById('sdt').value;
    var email = document.getElementById('email').value;
    var cccd = document.getElementById('cccd').value;

    // Validate Tên
    if (ten.trim() == '') {
        alert('Vui lòng nhập Tên');
        return false;
    }

    // Validate SĐT
    if (sdt.trim() == '') {
        alert('Vui lòng nhập SĐT');
        return false;
    }

    // Validate Email
    if (email.trim() == '') {
        alert('Vui lòng nhập Email');
        return false;
    }

    // Validate CCCD
    if (cccd.trim() == '') {
        alert('Vui lòng nhập CCCD');
        return false;
    }

    // Validate Ngày Sinh (Optional)
    var ngaySinh = document.getElementById('ngaySinh').value;
    if (ngaySinh.trim() == '') {
        alert('Vui lòng chọn Ngày Sinh');
        return false;
    }

    // Validate Vai Trò (Optional)
    var vaiTro = document.querySelector('input[name="vaiTro"]:checked');
    if (!vaiTro) {
        alert('Vui lòng chọn Vai Trò');
        return false;
    }

    // All validations passed, allow form submission
    return true;
}
