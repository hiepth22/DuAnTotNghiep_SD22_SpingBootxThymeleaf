(function () {
    initPage();
})();
function getPageNumber(button) {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var vaiTro = document.getElementById("vaiTro").value;
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    var pageNumber = button.innerText.trim();

    searchNhanVien({
        keyword: keyword,
        trangThai: status !== "" ? status : null,
        vai_tro: vaiTro !== "" ? vaiTro : null,
        page_index: pageNumber,
        page_size: 5,
        startDate:startDate !== "" ? startDate : null,
        endDate :endDate !== "" ? endDate : null

    });


}

function resetForm() {
    document.getElementById("trangThai").value = "";
    document.getElementById("searchInput").value = "";
    document.getElementById("vaiTro").value = "";
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
}

function OnSearchEmployee() {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var vaiTro = document.getElementById("vaiTro").value;
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    var obj = {
        keyword: keyword,
        trangThai: status != "" ? status : null,
        vai_tro: vaiTro != "" ? vaiTro : null,
        page_index: 1,
        page_size: 5,
        startDate: startDate !== "" ? startDate : null,
        endDate : endDate !== "" ? endDate : null
    }

    console.log(obj);

    searchNhanVien(obj);
}

function initPage() {
    searchNhanVien({
        keyword: "",
        trangThai: null,
        vai_tro: null,
        page_index: 1,
        page_size: 5,
        startDate : null,
        endDate : null
    });
}

function searchNhanVien(obj) {

    Object.keys(obj).forEach((k) => obj[k] == null && delete obj[k]);

    var params = new URLSearchParams(obj);

    var url = '/admin/search?' + params.toString();

    fetch(url, obj)
        .then(response => response.text())
        .then(data => {
            var tableBody = document.getElementById('fromnv');
            if (tableBody) {
                tableBody.innerHTML = data.trim();
            } else {
                console.error('Element with id "fromnv" not found.');
            }
        })
        .catch(error => console.error('Error:', error));

}



function confirmToggle1(element, id) {
    var trangThai = $(element).data('trang-thai');
    var isChecked = element.checked;

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
            toggleSwitch(id, isChecked);
        } else {
            // Đảo ngược lại trạng thái của checkbox nếu người dùng hủy bỏ
            element.checked = !isChecked;
            Swal.fire(
                'Đã hủy!',
                'Hành động của bạn đã bị hủy.',
                'error'
            );
        }
    });
}
function toggleSwitch(id, isChecked) {
    var url = `/admin/nhan-vien/${id}/update`;
    var trangThai = isChecked ? 1 : 0;

    var data = `trangThai=${trangThai}`;

    // Hiển thị spinner loading
    $('#spinner').addClass('show');

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: data,
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.text(); // Lấy nội dung phản hồi dưới dạng văn bản
        })
        .then(responseText => {
            // Ẩn spinner loading
            $('#spinner').removeClass('show');

            // Hiển thị thông báo thành công
            $('#notification2').addClass('show1');

            // // Cập nhật trạng thái checkbox nếu cần thiết
            // var checkbox = document.getElementById(`switchButton_${id}`);
            // if (checkbox) {
            //     checkbox.checked = isChecked;
            // } else {
            //     console.error(`Không tìm thấy checkbox với id ${id} trong DOM.`);
            // }

            // Tự động ẩn thông báo sau 3 giây
            setTimeout(function() {
                $('#notification2').removeClass('show1');
            }, 3000);
        })
        .catch(error => {
            // Xử lý lỗi
            console.error('Lỗi khi cập nhật trạng thái nhân viên:', error);

            // Đảo ngược lại trạng thái checkbox nếu có lỗi
            var checkbox = document.getElementById(`switchButton_${id}`);
            if (checkbox) {
                checkbox.checked = !isChecked;
            } else {
                console.error(`Không tìm thấy checkbox với id ${id} trong DOM.`);
            }

            // Ẩn spinner loading
            $('#spinner').removeClass('show');

            // Hiển thị thông báo lỗi
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Có lỗi xảy ra khi cập nhật trạng thái!',
            });
        });
}






// function showSuccessMessageUpdate1() {
//     const notification = document.getElementById('notification2');
//     notification.classList.add('show2');
//     const progressBar = document.getElementById('progress-bar2');
//     progressBar.style.width = '0';
//     setTimeout(function () {
//         progressBar.style.width = '100%';
//     }, 100);
//
//     setTimeout(function () {
//         notification.classList.remove('show1');
//         window.location.href = '/admin/nhan-vien';
//     }, 3000);
// }








