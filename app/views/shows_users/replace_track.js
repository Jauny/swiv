$("#track_<%= dom_id(@show) %>").replaceWith("<%= j render partial: 'shows/track', locals: { show: @show } %>");
