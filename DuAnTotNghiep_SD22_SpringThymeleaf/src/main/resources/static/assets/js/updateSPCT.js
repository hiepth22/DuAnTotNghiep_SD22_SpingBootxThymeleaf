document.getElementById('imageUpload').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();

        reader.onload = function(e) {
            document.getElementById('imagePreview').src = e.target.result; // Gán đường dẫn ảnh đã tải lên
        };

        reader.readAsDataURL(file); // Đọc file và hiển thị ảnh
    }
});
