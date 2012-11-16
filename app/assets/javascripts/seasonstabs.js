jQuery(function($) {
  function changeTab(e) {
    e.preventDefault();
    $("#tabs li.active").removeClass("active");
    $(this).addClass("active");
    var activeId = $("#tabs li.active a").attr("href");
    showTabs(activeId);
  }

  function showTabs(activeTab){
    $("#tabs table").hide();
    $(activeTab).show();
  }

  $("#tabs li").click(changeTab);

  $("#tabs li:first").click();

});