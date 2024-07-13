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
                // Optionally handle the case where the element is not found
            }
        })
        .catch(error => console.error('Error:', error));

}



function confirmToggle1(element, id) {
    var trangThai = $(element).data('data-trang-thai');

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
        var isChecked = element.checked;

        if (result.isConfirmed) {
            toggleSwitch(id, trangThai);
        } else {
            // Đảo ngược lại trạng thái của checkbox
            element.checked = !isChecked;
            Swal.fire(
                'Đã hủy!',
                'Hành động của bạn đã bị hủy.',
                'error'
            );
        }
    });
}


function toggleSwitch(id, trangThai) {
    var url = `/admin/nhan-vien/${id}/update`;
    var isChecked = trangThai == 1 ? true : false;

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
            return response.text(); // Lấy nội dung phản hồi dưới dạng văn bản
        })
        .then(responseText => {
            alert(responseText); // Hiển thị chuỗi thông báo từ server
            // Cập nhật trang thái checkbox nếu cần thiết
        })
        .catch(error => {
            console.error('Lỗi khi cập nhật trạng thái nhân viên:', error);
            alert('Có lỗi xảy ra khi cập nhật trạng thái.');
            // Đảo ngược lại trạng thái checkbox nếu có lỗi
            element.checked = !isChecked;
        });
}











