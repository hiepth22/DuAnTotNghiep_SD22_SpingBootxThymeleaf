
    document.getElementById('confirmButton').addEventListener('click', function() {
        // Kiểm tra hợp lệ của form bằng hàm validateForm()
        if (validateForm()) {
            Swal.fire({
                title: 'Bạn có chắc chắn thêm phiếu giảm giá mới?',
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
                        'Bạn đã thêm 1 phiếu giảm giá  mới.',
                        'success'
                    ).then(() => {
                        add();
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
        axios.post('/admin/SavePhieuGiamGia', new FormData(form))
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
        }, 2000);

        setTimeout(function() {
            // Remove the show class after the notification disappears
            notification.classList.remove('show');

            window.location.href = '/admin/phieu-giam-gia';
        }, 3000);
    }
    function validateForm() {


    }



