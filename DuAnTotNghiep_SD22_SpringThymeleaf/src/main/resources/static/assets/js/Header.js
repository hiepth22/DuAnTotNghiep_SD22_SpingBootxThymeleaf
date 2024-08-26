$(document).ready(function () {
    $.ajax({
        url: '/api/session/user',
        method: 'GET',
        success: function (response) {

            const nguoidung = $('#nguoidung');

            let idKhachHang = response.id;



            let nguoi = `<a  class="border-0">
                            <i class="bi bi-person" style="color: white; font-weight: bold;"></i>
                        </a>
                         <div class="dropdown-menu">
                         <a class="dropdown-item" data-action="profile">Thông Tin Cá Nhân</a>
                         <a class="dropdown-item" data-action="donmua">Đơn Mua</a>
                         <a class="dropdown-item" data-action="logout">Đăng Xuất</a>
                      </div>
                       `;
            nguoidung.html(nguoi);

            $('.dropdown-item').on('click', function () {
                let action = $(this).data('action');
                if (action === 'profile') {
                    alert("làm j làm đi")

                }
                else if (action === 'donmua') {
                    alert("làm mình làm mẩy")
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
                            <i class="bi bi-person" style="color: white; font-weight: bold;"></i>
                        </a>
                        <div class="dropdown-menu">
                            <a href="/login" class="dropdown-item">login</a>
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