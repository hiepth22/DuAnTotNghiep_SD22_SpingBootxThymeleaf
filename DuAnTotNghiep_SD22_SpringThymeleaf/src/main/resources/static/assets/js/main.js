(function ($) {
    "use strict";

    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();

    $('.sidebar-toggler').click(function () {
        $('.sidebar, .content').toggleClass("open");
        return false;
    });

    function selectColors() {
        var selectedColors = $('#selectMauSac').val();
        $('#mauSac').empty();
        selectedColors.forEach(function(color) {
            $('#mauSac').append($('<option>', {
                value: color,
                text: color.charAt(0).toUpperCase() + color.slice(1)
            }));
        });
        $('#colorModal').modal('hide');
    }

})(jQuery);

