$(function() {
  function changeTab(e) {
    e.preventDefault();
    $("#tabs li.active").removeClass("active");
    $(this).addClass("active");
    var activeId = $("#tabs li.active a").attr("href");
    showTabs(activeId);
  }

  function showTabs(activeTab){
    $("#tabs table").removeClass("active").hide();
    $(activeTab).addClass("active").show();
  }

  $("#tabs li").click(changeTab);

  $("#tabs li:first").click();

});
