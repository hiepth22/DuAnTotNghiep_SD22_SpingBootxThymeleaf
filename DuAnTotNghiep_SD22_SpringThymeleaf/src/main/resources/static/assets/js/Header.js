$(document).ready(function () {
    $.ajax({
        url: '/api/session/user',
        method: 'GET',
        success: function (response) {
            const checklogin = $('#checklogin');
            const nguoidung = $('#nguoidung');

            let idKhachHang = response.id;


            let content = `<p class="card-title clickable" style="color: orange; margin: 10px;" data-url="http://localhost:3000/thong-tin-don-hang">Đơn Hàng</p>

                               <p class="card-title clickable" style="color: orange; margin: 10px;">Thông Tin (ID Người Dùng: ${idKhachHang})</p>`;
            checklogin.html(content);
            let nguoi = `<a  class="border-0">
                            <i class="bi bi-person" style="color: white; font-weight: bold;"></i>
                        </a>
                        <div class="dropdown-menu">
                           <a  class="dropdown-item">Thông Tin Cá Nhân</a>
                            <a  class="dropdown-item">Đăng Xuất</a>
                        </div>
                       `;
            nguoidung.html(nguoi);

            $('.clickable').on('click', function () {
                let url = $(this).data('url');
                window.location.href = url;
            });
        },
        error: function (xhr, status, error) {
            const nguoidung = $('#nguoidung');
            const checklogin = $('#checklogin');
            checklogin.html(`
                <a  class="card-title clickable" style="color: orange; margin: 10px;" data-url="http://localhost:3000/thong-tin-don-hang">Đơn Hàng</a>
                <a class="card-title clickable" style="color: orange; margin: 10px;" data-url="http://localhost:3000/login">Đăng nhập</a>
                 `);
            nguoidung.html(`
              
                        <a  class="border-0">
                            <i class="bi bi-person" style="color: white; font-weight: bold;"></i>
                        </a>
                        <div class="dropdown-menu">
                           
                            <a href="" class="dropdown-item">login</a>
                        </div>
                   
                 `);

            $('.clickable').on('click', function (event) {
                event.preventDefault();
                let url = $(this).data('url');
                window.location.href = url;
            });
        }
    });
});