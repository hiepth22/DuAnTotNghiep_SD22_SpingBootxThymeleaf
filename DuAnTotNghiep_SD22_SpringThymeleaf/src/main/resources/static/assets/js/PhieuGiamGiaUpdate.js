document.getElementById('confirmButton').addEventListener('click', function() {
    if (validateForm()) {
        Swal.fire({
            title: 'Bạn có chắc chắn cap nhat phieu giam gia mới?',
            text: "Bạn không thể hoàn tác hành động này!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'cap nhat'
        }).then((result) => {
            if (result.isConfirmed) {
                addPgg();
            }
        });
    }
});
function addPgg() {
    const form = document.getElementById('myForm');

    // Thêm lớp 'disabled' và thay đổi văn bản của nút Lưu
    const confirmButton = document.getElementById('confirmButton');
    confirmButton.classList.add('disabled');

    axios.post('/admin/savePhieuGiamGia', new FormData(form) )
        .then(response => {
            // Xóa lớp 'disabled' và thay đổi văn bản của nút Lưu khi hoàn thành
            confirmButton.classList.remove('disabled');
            confirmButton.textContent = 'Lưu';

            Swal.fire(
                'Thành công!',
                'Phieu Giam Gia đã được cap nhat.',
                'success'
            ).then(() => {
                window.location.href = '/admin/phieu-giam-gia';
            });
            console.log(formData)
        })
        .catch(error => {
            // Xóa lớp 'disabled' và thay đổi văn bản của nút Lưu khi có lỗi
            confirmButton.classList.remove('disabled');
            confirmButton.textContent = 'Lưu';

            Swal.fire(
                'Lỗi!',
                'Có lỗi xảy ra khi cap nhat phieu giam gia.',
                'error'
            );
        });
}
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
    return valid;
}