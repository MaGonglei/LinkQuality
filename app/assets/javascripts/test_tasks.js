$(function() {
    $('#column_setting div > input').change(function(){
        var column_name = $(this).attr('class');
        $('#test_link_results .' + column_name).slideToggle("fast");
    });

    $('#column_setting legend').click(function(){
        $(this).next('div').slideToggle('slow');
    });
});