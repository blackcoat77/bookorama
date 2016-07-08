// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

    //  mixItUp
    $('#Container').mixItUp({
        animation: {
            easing: 'cubic-bezier(0.175, 0.885, 0.32, 1.275)',
            effects: 'fade rotateY(-10deg)'
        }
    });

    //  Toggle menu-toggle
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });



    //  headrom.js
    $(".navbar-fixed-top").headroom({
        "offset": 205,
        "tolerance": 5,
        "classes": {
            "initial": "animated",
            "pinned": "slideDown",
            "unpinned": "slideUp"
        }
    });


    // animated flash alerts
    $(".alert").delay(2600).slideUp(400, function() {
        $(this).alert('close');
    });





});
