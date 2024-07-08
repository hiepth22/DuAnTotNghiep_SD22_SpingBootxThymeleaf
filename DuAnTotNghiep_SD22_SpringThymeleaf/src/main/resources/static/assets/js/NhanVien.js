(function () {
    initPage();
})();
function getPageNumber(button) {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var vaiTro = document.getElementById("vai_tro").value;
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
    document.getElementById("vai_tro").value = "";
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
}

function OnSearchEmployee() {
    var status = document.getElementById("trangThai").value;
    var keyword = document.getElementById("searchInput").value;
    var vaiTro = document.getElementById("vai_tro").value;
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
                // Optionally handle the case where the element is not found
            }
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
    var url = `/admin/nhan-vien/${id}/update`;
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

            element.checked = !isChecked;
        });
}






