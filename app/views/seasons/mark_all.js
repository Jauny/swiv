$("table.active #all_seen").replaceWith("<%= j(render partial: 'shows/all_seen', locals: { :season => @season }) %>");
$("table.active tr").addClass('success');
$("table.active td.status").html("<i class='icon-ok'></i>");