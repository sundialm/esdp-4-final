
    $(document).ready(function() {
    $(".js-example-tokenizer").select2({
        tags: true,
        tokenSeparators: [',', ' ']
    })
    $('#mySelect').select2({
        dropdownParent: $('#myModal')
    });
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd',
    }).datepicker('option', 'dateFormat', 'yy-mm-dd');
    $("input:checkbox").on('click', function() {
    var $box = $(this);
    if ($box.is(":checked")) {
        var group = "input:checkbox[name='" + $box.attr("name") + "']";
        $(group).prop("checked", false);
        $box.prop("checked", true);
    } else {
        $box.prop("checked", false);
    }});});