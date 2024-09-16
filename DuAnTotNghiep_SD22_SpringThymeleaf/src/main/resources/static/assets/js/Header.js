$(document).ready(function () {
    $.ajax({
        url: '/api/session/user',
        method: 'GET',
        success: function (response) {

            const nguoidung = $('#nguoidung');

            let idKhachHang = response.id;



            let nguoi = `<a class="border-0">
                       <a class="dropdown-item" data-action="profile" style="padding: 8px 15px; font-size: 14px; color: white">${response.ten}</a>

                        </a>
                        <div class="dropdown-menu" style="min-width: 150px; padding: 5px; border-radius: 6px; font-size: 13px;">
                            <a class="dropdown-item" data-action="profile" style="padding: 8px 15px; font-size: 14px;">Thông Tin Cá Nhân</a>
                            <a class="dropdown-item" data-action="donmua" style="padding: 8px 15px; font-size: 14px;">Đơn Mua</a>
                            <a class="dropdown-item" data-action="logout" style="padding: 8px 15px; font-size: 14px;">Đăng Xuất</a>
                        </div>

                      </div>
                       `;
            nguoidung.html(nguoi);

            $('.dropdown-item').on('click', function () {
                let action = $(this).data('action');
                if (action === 'profile') {
                    window.location.href = '/thong-tin-tai-khoan';

                }
                else if (action === 'donmua') {
                    window.location.href = '/thong-tin-don-hang';
                }
                else if (action === 'logout') {

                    $.post('/api/session/logout', function(response) {
                        window.location.href = '/login';
                    }).fail(function() {
                        alert('Đăng xuất không thành công. Vui lòng thử lại.');
                    });
                }
            });
        },
        error: function (xhr, status, error) {
            const nguoidung = $('#nguoidung');

            nguoidung.html(`
              
                        <a  class="border-0">
                            <i class="bi bi-person" style="color: black;font-size: 22px; font-weight: bold;"></i>
                        </a>
                        <div class="dropdown-menu" style="min-width: 150px; padding: 5px; border-radius: 6px; font-size: 13px;">
                            <a href="/login" class="dropdown-item" style="padding: 8px 15px; font-size: 14px;">login</a>
                        </div>
                   
                 `);

            $('.clickable').on('click', function (event) {
                event.preventDefault();
                let url = $(this).data('url');
                window.location.href = '/login';
            });
        }
    });
});