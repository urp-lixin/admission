$(function() {
  $(document).ready(function() {
    var obj = $(".listform");
    window.onresize = function() {
      $(".user").css("top", ($(window).height() - obj.height()) / 2 - 15);
      $(".user").css("left", ($(window).width() - obj.width()) / 2);
    };
    
    setTimeout(function() {
      window.onresize();
    }, 0);
  });
});