(function ($) {

    "use strict";

    // init jarallax parallax
    var initJarallax = function () {
        jarallax(document.querySelectorAll(".jarallax"));

        jarallax(document.querySelectorAll(".jarallax-img"), {
            keepImg: true,
        });
    }

    // input spinner
    var initProductQty = function(){

        $('.product-qty').each(function(){

            var $el_product = $(this);
            var quantity = 0;

            $el_product.find('.quantity-right-plus').click(function(e){
                e.preventDefault();
                var quantity = parseInt($el_product.find('.quantity').val());
                $el_product.find('.quantity').val(quantity + 1);
            });

            $el_product.find('.quantity-left-minus').click(function(e){
                e.preventDefault();
                var quantity = parseInt($el_product.find('.quantity').val());
                if(quantity>0){
                    $el_product.find('.quantity').val(quantity - 1);
                }
            });

        });

    }
     $(window).load(function(){
        $('.preloader').fadeOut();
    });

})(jQuery);