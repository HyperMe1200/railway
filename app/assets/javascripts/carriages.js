$(document).ready(function() {
    var hide_all = function() {
        $('.sit').hide();
        $('.sleep').hide();
        $('.coupe').hide();
        $('.economy').hide();
    }

    var show_by_type = function() {
        hide_all()
        var carriage_type = $(document).find('#carriage_type').val();

        switch (carriage_type) {
            case 'EconomyCarriage':
                $('.economy').show();
                break;
            case 'CoupeCarriage':
                $('.coupe').show();
                break;
            case 'SitCarriage':
                $('.sit').show();
                break;
            case 'SleepCarriage':
                $('.sleep').show();
                break;
        }
    }

    show_by_type();

    $('#carriage_type').change(function() {
        show_by_type();
    })
})