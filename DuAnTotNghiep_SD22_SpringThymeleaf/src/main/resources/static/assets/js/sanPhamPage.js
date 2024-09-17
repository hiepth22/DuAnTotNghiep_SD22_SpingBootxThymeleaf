document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.trang-thai-toggle').forEach(function(toggle) {
        toggle.addEventListener('change', function() {
            const productId = this.getAttribute('data-id');
            const newStatus = this.checked ? 1 : 0;

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
                    fetch(`/admin/san-pham/trang-thai/${productId}`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify({ trangThai: newStatus })
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Cập nhật trạng thái thất bại');
                            }
                            return response.text();
                        })
                        .then(data => {
                            Swal.fire(
                                'Đã xác nhận!',
                                'Trạng thái sản phẩm đã được cập nhật.',
                                'success'
                            ).then(() => {
                                showSuccessMessage();
                                setTimeout(() => {
                                    window.location.reload();
                                }, 3010);
                            });
                        })
                        .catch(error => {
                            console.error('Lỗi:', error);
                            Swal.fire(
                                'Lỗi!',
                                'Cập nhật trạng thái thất bại.',
                                'error'
                            );
                        });
                } else {
                    toggle.checked = !newStatus;
                    Swal.fire(
                        'Đã hủy!',
                        'Hành động của bạn đã bị hủy.',
                        'error'
                    );
                }
            });
        });
    });
});

function showSuccessMessage() {
    var notification = document.getElementById("notification");
    var progressBar = document.getElementById("progress-bar");

    notification.style.display = "block";
    progressBar.style.width = "100%";

    setTimeout(function () {
        progressBar.style.width = "0";
    }, 10);

    setTimeout(function () {
        notification.style.display = "none";
        progressBar.style.width = "100%";
    }, 3010);
}
