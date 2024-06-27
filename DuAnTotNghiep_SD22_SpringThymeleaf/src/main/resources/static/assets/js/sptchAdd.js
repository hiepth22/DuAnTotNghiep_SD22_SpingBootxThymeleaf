function selectColors() {
    var selectedColors = $('#selectMauSac').val();
    $('#mauSac').empty(); // Xóa các option hiện tại
    selectedColors.forEach(function(color) {
        $('#mauSac').append($('<option>', {
            value: color,
            text: color.charAt(0).toUpperCase() + color.slice(1)
        }));
    });
    $('#colorModal').modal('hide'); // Đóng modal sau khi chọn
}
$(document).ready(function(){
    var multipleCancelButton = new Choices('#choices-multiple-remove-button', {
        removeItemButton: true,
        maxItemCount:5,
        searchResultLimit:5,
        renderChoiceLimit:5
    });
});
