$(document).ready(function () {
    $.ajax({
        url: '/api/session/user',
        method: 'GET',
        success: function (response) {
            const checklogin = $('#checklogin');
            let idKhachHang = response.id;


            let content = `<p class="card-title clickable" style="color: orange; margin: 10px;" data-url="http://localhost:3000/thong-tin-don-hang">Đơn Hàng</p>

                               <p class="card-title clickable" style="color: orange; margin: 10px;">Thông Tin (ID Người Dùng: ${idKhachHang})</p>`;
            checklogin.html(content);

            $('.clickable').on('click', function () {
                let url = $(this).data('url');
                window.location.href = url;
            });
        },
        error: function (xhr, status, error) {
            const checklogin = $('#checklogin');
            checklogin.html(`
                <a class="card-title clickable" style="color: orange; margin: 10px;" data-url="http://localhost:3000/thong-tin-don-hang">Đơn Hàng</a>
                <a class="card-title clickable" style="color: orange; margin: 10px;" data-url="http://localhost:3000/login">Đăng nhập</a>
                 `);

            $('.clickable').on('click', function (event) {
                event.preventDefault();
                let url = $(this).data('url');
                window.location.href = url;
            });
        }
    });
});