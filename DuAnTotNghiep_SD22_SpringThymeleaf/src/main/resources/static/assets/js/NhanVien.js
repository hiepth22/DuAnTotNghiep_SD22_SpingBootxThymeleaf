(function () {
    initPage();
})();
let pageNumber = 1;

function getPageNumber(button) {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var vaiTro = document.getElementById("vai_tro").value;
    var pageNumber = button.innerText.trim(); // Lấy số trang từ nội dung của button

    searchNhanVien({
        keyword: keyword,
        trangThai: status !== "" ? status : null,
        vai_tro: vaiTro !== "" ? vaiTro : null,
        page_index: pageNumber,
        page_size: 5
    });


}


function OnSearchEmployee() {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var vaiTro = document.getElementById("vai_tro").value;

    var obj = {
        keyword: keyword,
        trangThai: status != "" ? status : null,
        vai_tro: vaiTro != "" ? vaiTro : null,
        page_index: 1,
        page_size: 5
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
        page_size: 5
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
            tableBody.innerHTML = data.trim();
        })
        .catch(error => console.error('Error:', error));
}

function confirmToggle(element, id) {
    var isChecked = element.checked;
    var confirmed = confirm("Bạn có chắc chắn muốn thay đổi trạng thái này?");

    if (confirmed) {
        toggleSwitch(element, id, isChecked);
    } else {
        element.checked = !isChecked;
    }
}

function toggleSwitch(element, id, isChecked) {
    var url = `/admin/nhan-vien/${id}/update`; // Đảm bảo rằng id đã được thay thế đúng giá trị
    var data = { trangThai: isChecked ? 0 : 1 };

    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            alert(`Đã thực hiện Thay Đổi Trạng thái cho nhân viên có ID: ${id}`);
        })
        .catch(error => {
            console.error('Error updating employee status:', error);
            // Xử lý lỗi nếu cần thiết
            alert('Có lỗi xảy ra khi cập nhật trạng thái nhân viên.');
            // Đặt lại trạng thái checkbox nếu có lỗi
            element.checked = !isChecked;
        });
}






