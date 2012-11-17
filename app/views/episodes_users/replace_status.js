$("#status_<%= dom_id(@episode) %>").replaceWith("<%= j render partial: 'shows/status_icon', locals: { ep: @episode } %>");
$("#status_<%= dom_id(@episode) %>").parent().toggleClass('success');

