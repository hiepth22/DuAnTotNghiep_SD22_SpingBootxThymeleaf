$(document).ready(function() {
    $('#saveSizes').click(function() {
        var selectedSizes = [];
        $('#sizeList input:checked').each(function() {
            var sizeCheckbox = $(this);
            var sizeName = sizeCheckbox.next('label').text();
            selectedSizes.push({
                name: sizeName,
                checkbox: sizeCheckbox
            });
        });

        displaySelectedItems(selectedSizes, '#selectedSizes');

        $('#sizeModal').modal('hide');
    });

    $('#saveColors').click(function() {
        var selectedColors = [];
        $('#colorList input:checked').each(function() {
            var colorCheckbox = $(this);
            var colorName = colorCheckbox.next('label').text();
            selectedColors.push({
                name: colorName,
                checkbox: colorCheckbox
            });
        });

        displaySelectedItems(selectedColors, '#selectedColors');

        $('#colorModal').modal('hide');
    });

    function displaySelectedItems(items, containerId) {
        var selectedItemsContainer = $(containerId);
        selectedItemsContainer.empty();

        items.forEach(function(item) {
            var itemWrapper = $('<div class="selected-item"></div>');
            var itemLabel = $('<label>' + item.name + '</label>');

            itemWrapper.append(itemLabel);
            selectedItemsContainer.append(itemWrapper);
        });
    }

});
