let currentTab = '';
let searchTxt = '';
let startDate = '';
let endDate = '';
const switchTab = (tab) => {
    $('.tab-link').removeClass('border-b-2 border-blue-500 rounded-lg shadow-md bg-white');
    $(`a[data-tab="${tab}"]`).addClass('border-b-2 rounded-lg shadow-md bg-white');
    currentTab = tab;
    getData();
};
const getData = (page = 0, size = 10) => {
    $.ajax({
        url: `/api/hoa-don?tab=${currentTab}&keyword=${searchTxt}&startDate=${startDate}&endDate=${endDate}&page=${page}&size=${size}`,
        data: {},
        success: function (result) {
            let list = "";
            $("#listHoaDon").empty();
            result.content.forEach((hoaDon, i) => {
                list += `<tr>
                            <td class="px-6 py-4 whitespace-nowrap">${i + 1 + page * size}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.ma}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.khachHang.ten}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.khachHang.sdt}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${trangThaiMua(hoaDon.loai)}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.nhanVien.ma}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.ngayTao != null ? new Date(hoaDon.ngayTao).toLocaleDateString('vi-VN') : ''}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${formatVND(hoaDon.tongTien)}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${trangThai(hoaDon.trangThai)}</td>
                            <td class="px-6 py-4 whitespace-nowrap"><a href="/hoa-don/detail/${hoaDon.id}">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                                <path d="M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
                                <path fill-rule="evenodd" d="M1.323 11.447C2.811 6.976 7.028 3.75 12.001 3.75c4.97 0 9.185 3.223 10.675 7.69.12.362.12.752 0 1.113-1.487 4.471-5.705 7.697-10.677 7.697-4.97 0-9.186-3.223-10.675-7.69a1.762 1.762 0 0 1 0-1.113ZM17.25 12a5.25 5.25 0 1 1-10.5 0 5.25 5.25 0 0 1 10.5 0Z" clip-rule="evenodd" />
                            </svg>
                            </a></td>
                          </tr>`;
            });
            $("#listHoaDon").html(list);

            let pagination = '';

            pagination += `<button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getData(${result.pageable.pageNumber - 1}, ${size})" ${result.pageable.pageNumber === 0 ? 'disabled' : ''}>Previous</button>`;

            const maxVisiblePages = 3;
            const halfVisiblePages = Math.floor(maxVisiblePages / 2);
            let startPage = Math.max(1, result.pageable.pageNumber + 1 - halfVisiblePages);
            let endPage = Math.min(startPage + maxVisiblePages - 1, result.totalPages);

            if (startPage > 1) {
                pagination += `<button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getData(0, ${size})">1</button>`;
                if (startPage > 2) {
                    pagination += `<span class="px-4 py-2">...</span>`;
                }
            }

            for (let i = startPage; i <= endPage; i++) {
                pagination += `<button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1 ${i === result.pageable.pageNumber + 1 ? 'bg-blue-600 text-white' : ''}" onclick="getData(${i - 1}, ${size})">${i}</button>`;
            }

            if (endPage < result.totalPages) {
                if (endPage < result.totalPages - 1) {
                    pagination += `<span class="px-4 py-2">...</span>`;
                }
                pagination += `<button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getData(${result.totalPages - 1}, ${size})">${result.totalPages}</button>`;
            }

            pagination += `<button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getData(${result.pageable.pageNumber + 1}, ${size})" ${result.pageable.pageNumber + 1 === result.totalPages ? 'disabled' : ''}>Next</button>`;

            $("#pagination").html(pagination);
        }
    });
}


const trangThai = (tt) => {
    switch (tt) {
        case 1:
            return '<span class="status bg-blue-500 text-white rounded-lg ">Chờ xác nhận</span>';
        case 2:
            return '<span class="status bg-green-500 text-white rounded-lg">Đã xác nhận</span>';
        case 3:
            return '<span class="status bg-yellow-500 text-white rounded-lg">Chờ vận chuyển</span>';
        case 4:
            return '<span class="status bg-orange-500 text-white rounded-lg">Vận chuyển</span>';
        case 5:
            return '<span class="status bg-purple-500 text-white rounded-lg">Thanh toán</span>';
        case 6:
            return '<span class="status bg-gray-500 text-white rounded-lg">Hoàn thành</span>';
        case 7:
            return '<span class="status bg-red-500 text-white rounded-lg">Hủy</span>';
        default:
            return '<span class="status bg-black text-white rounded-lg">Không xác định</span>';
    }
}

const trangThaiMua = (tt) => {
    switch (tt) {
        case 1:
            return 'Online';
        case 2:
            return 'Tại quầy';
        default:
            return 'Không xác định'
    }
}

const formatVND = (tongtien) => {
    return tongtien.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + ' VNĐ';
}


$(document).ready(function () {
    $(`a[data-tab="0"]`).addClass('border-blue-500 rounded-lg shadow-md bg-white');
    getData();
});
const onSearch = (event) => {
    event.preventDefault();
    searchTxt = $('#searchTxt').val();
    startDate = $('#startDate').val();
    endDate = $('#endDate').val();
    getData();
}

const resetSearch = () => {
    $('#searchTxt').val('');
    $('#startDate').val('');
    $('#endDate').val('');
    searchTxt = '';
    startDate = '';
    endDate = '';
    getData();
}

$(".tab-link").click(function () {
    const tab = $(this).data("tab");
    switchTab(tab);
});
