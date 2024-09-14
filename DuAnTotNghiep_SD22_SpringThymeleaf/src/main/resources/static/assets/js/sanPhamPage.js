document.addEventListener('DOMContentLoaded', function() {
    const switches = document.querySelectorAll('.toggle-status');

    switches.forEach(switchElement => {
        switchElement.addEventListener('change', function() {
            const isChecked = this.checked;
            const productId = this.getAttribute('data-id');
            const newStatus = isChecked ? 1 : 0;

            console.log(`Updating product ID: ${productId} to status: ${newStatus}`);

            fetch(`/admin/san-pham/update-status`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: JSON.stringify({ id: productId, trangThai: newStatus })
            }).then(response => {
                if (response.ok) {
                    alert('Trạng thái đã được cập nhật thành công.');
                    location.reload();
                } else {
                    alert('Có lỗi xảy ra khi cập nhật trạng thái. Vui lòng thử lại.');
                }
            }).catch(error => {
                alert('Có lỗi xảy ra khi cập nhật trạng thái. Vui lòng thử lại.');
                console.error('Error:', error);
            });
        });
    });
});
