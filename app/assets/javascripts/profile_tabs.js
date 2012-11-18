jQuery(function($) {
  function changeProfileTab(e) {
    e.preventDefault();
    $("#tabs li.active").removeClass("active");
    $(this).addClass("active");
    var activeTab = $("#tabs li.active").attr("href");
    showProfileTabs(activeTab);
  }

  function showProfileTabs(activeTab){
    $("#tabs div").hide();
    $(activeTab).show();
  }

  $("#tabs li").click(changeProfileTab);

  $("#tabs li:first").click();

});