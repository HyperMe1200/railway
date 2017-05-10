$(document).ready(function() {
    $('.find').click(function() {
        var first_station = $(document).find('#first_station_id').val();
        var last_station = $(document).find('#last_station_id').val();

        if (first_station === last_station) {
            alert('Начальная и конечная станции не могут быть одинаковыми');
            return false;
        }
    });
});