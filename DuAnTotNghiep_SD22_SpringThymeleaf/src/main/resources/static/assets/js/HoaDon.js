let currentTab = '';
let searchTxt = '';
let loai = ''
let startDate = '';
let endDate = '';
let page = 0
let size = 10;
var tienShip = 0;
const switchTab = (tab) => {
    $('.tab-link').removeClass('border-b-2 border-blue-500 rounded-lg shadow-md bg-white');
    $(`a[data-tab="${tab}"]`).addClass('border-b-2 rounded-lg shadow-md bg-white');
    currentTab = tab;
    getData(page , size);
};


const getData = (page, size) => {
    $.ajax({
        url: `/api/hoa-don?tab=${currentTab}&keyword=${searchTxt}&loai=${loai}&startDate=${startDate}&endDate=${endDate}&page=${page}&size=${size}`,
        success: function (result) {
            let list = "";
            $("#listHoaDon").empty();

            result.content.forEach((hoaDon, i) => {
                const khachHang = hoaDon.khachHang || {};

                const tienShip = hoaDon.tienShip || 0;
                list += `<tr>
                            <td class="px-6 py-4 whitespace-nowrap">${i + 1 + page * size}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.ma}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.nguoiNhan || ''}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${khachHang.sdt || ''}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${trangThaiMua(hoaDon.loai)}</td>
                          
                            <td class="px-6 py-4 whitespace-nowrap">${hoaDon.ngayTao != null ? new Date(hoaDon.ngayTao).toLocaleDateString('vi-VN') : ''}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${formatVND(hoaDon.tongTienSauGiam + tienShip)}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${trangThai(hoaDon.trangThai)}</td>
                            <td class="px-6 py-4 whitespace-nowrap"><a href="/admin/hoa-don/detail/${hoaDon.id}">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                                <path d="M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
                                <path fill-rule="evenodd" d="M1.323 11.447C2.811 6.976 7.028 3.75 12.001 3.75c4.97 0 9.185 3.223 10.675 7.69.12.362.12.752 0 1.113-1.487 4.471-5.705 7.697-10.677 7.697-4.97 0-9.186-3.223-10.675-7.69a1.762 1.762 0 0 1 0-1.113ZM17.25 12a5.25 5.25 0 1 1-10.5 0 5.25 5.25 0 0 1 10.5 0Z" clip-rule="evenodd" />
                            </svg>
                            </a></td>
                          </tr>`;
            });
            // <td className="px-6 py-4 whitespace-nowrap">${hoaDon.nhanVien ? hoaDon.nhanVien.ma : ''}</td>

            $("#listHoaDon").html(list);

            let pagination = '';
            const currentPage = result.pageable.pageNumber;
            const totalPages = result.totalPages;
            const hasPrevious = currentPage > 0;
            const hasNext = currentPage < totalPages - 1;

            pagination += `<button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getData(${currentPage - 1}, ${size})" ${!hasPrevious ? 'disabled' : ''}>Previous</button>`;

            const maxVisiblePages = 3;
            const halfVisiblePages = Math.floor(maxVisiblePages / 2);
            let startPage = Math.max(0, currentPage - halfVisiblePages);
            let endPage = Math.min(startPage + maxVisiblePages - 1, totalPages - 1);

            if (endPage - startPage + 1 < maxVisiblePages) {
                startPage = Math.max(0, endPage - maxVisiblePages + 1);
            }

            if (startPage > 0) {
                pagination += `<button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getData(0, ${size})">1</button>`;
                if (startPage > 1) {
                    pagination += `<span class="px-4 py-2">...</span>`;
                }
            }

            for (let i = startPage; i <= endPage; i++) {
                pagination += `<button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1 ${i === currentPage ? 'bg-blue-600 text-white' : ''}" onclick="getData(${i}, ${size})">${i + 1}</button>`;
            }

            if (endPage < totalPages - 1) {
                if (endPage < totalPages - 2) {
                    pagination += `<span class="px-4 py-2">...</span>`;
                }
                pagination += `<button class="px-4 py-2 bg-blue-300 text-white rounded-md mx-1" onclick="getData(${totalPages - 1}, ${size})">${totalPages}</button>`;
            }

            pagination += `<button class="px-4 py-2 bg-gray-300 text-black rounded-md mx-1" onclick="getData(${currentPage + 1}, ${size})" ${!hasNext ? 'disabled' : ''}>Next</button>`;

            $("#pagination").html(pagination);
        }
    });
};


const trangThai = (tt) => {
    switch (tt) {
        case 1:
            return '<span class="status bg-gray-500 text-white rounded-lg px-2 py-1">Chờ xác nhận</span>';
        case 2:
            return '<span class="status bg-teal-700 text-white rounded-lg px-2 py-1">Đã xác nhận</span>';
        case 3:
            return '<span class="status bg-yellow-400 text-white rounded-lg px-2 py-1">Chờ vận chuyển</span>';
        case 4:
            return '<span class="status bg-orange-400 text-white rounded-lg px-2 py-1">Vận chuyển</span>';
        case 5:
            return '<span class="status bg-green-600 text-white rounded-lg px-2 py-1">Thanh toán</span>';
        case 6:
            return '<span class="status bg-blue-500  text-white rounded-lg px-2 py-1">Hoàn thành</span>';
        case 7:
            return '<span class="status bg-red-600 text-white rounded-lg px-2 py-1">Hủy</span>';
        case 8:
            return '<span class="status bg-black text-white rounded-lg px-2 py-1">Hóa đơn chờ</span>';
        default:
            return '<span class="status bg-black text-white rounded-lg px-2 py-1">Không xác định</span>';
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
    getData(page , size);
});
const onSearch = (event) => {
    event.preventDefault();
    searchTxt = $('#searchTxt').val();
    startDate = $('#startDate').val();
    endDate = $('#endDate').val();
    loai = $('#status').val();
    getData(page , size);
}

const resetSearch = () => {
    $('#searchTxt').val('');
    $('#startDate').val('');
    $('#endDate').val('');
    searchTxt = '';
    startDate = '';
    endDate = '';
    getData(page , size);
}

$(".tab-link").click(function () {
    const tab = $(this).data("tab");
    switchTab(tab);
});
