new WOW().init();

$('#home-slider').owlCarousel({
    loop: true,
    margin: 0,
    nav: false,
    dots: true,
    items: 1,
    autoplay: true,
    smartSpeed: 300,
    autoplaySpeed: 30000,
    animateIn: 'fadeIn',
    animateOut: 'fadeOut',
})

$('#food-slider').owlCarousel({
    loop: true,
    margin: 0,
    nav: true,
    dots: false,
    items: 1,
    autoplay: false,
    smartSpeed: 300,
    autoplaySpeed: 30000,
    autoHeight: true,
})

$('#logbook-slider').owlCarousel({
    loop: true,
    margin: 0,
    nav: true,
    dots: false,
    items: 1,
    autoplay: false,
    smartSpeed: 300,
    autoplaySpeed: 30000,
    autoHeight: true,

})

$('#testimonial-slider').owlCarousel({
    loop: true,
    margin: 0,
    nav: false,
    dots: true,
    items: 1,
    autoplay: true,
    smartSpeed: 300,
    autoplaySpeed: 30000,
    animateIn: 'slideInRight',
    animateOut: 'slideOutLeft',
})


$(function() {
    $('#home-slider').css({ 'height': ($(window).height()) });
    $(window).bind('resize', function() {
        $('#home-slider').css({ 'height': ($(window).height()) });
    });
});
$(window).scroll(function() {
    var scroll = $(window).scrollTop();
    if (scroll >= 125) {
        $(".site-header").addClass("sticky-1");
    } else {
        $(".site-header").removeClass("sticky-1");
    }
    if (scroll >= 200) {
        $(".site-header").addClass("sticky");
    } else {
        $(".site-header").removeClass("sticky");
    }
});

$(function() {
    $([document.documentElement, document.body]).animate({
        scrollTop: $("div.padd-sec").offset().top
    }, 3000);
});

$(function() {
    $([document.documentElement, document.body]).animate({
        scrollTop: $("section.account-sec").offset().top
    }, 3000);
});