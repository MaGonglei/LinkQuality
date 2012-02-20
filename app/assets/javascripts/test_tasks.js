$(function() {
    $('#column_setting > input').change(function(){
        var column_name = $(this).attr('class');
        $('#test_link_results .' + column_name).slideToggle("slow");
    });
});