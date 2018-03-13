$(function() {
  function loadMenu(menus) {
    displayAppAndMenus([ {
      "name" : "mssu-base",
      "title" : "基础信息",
      "url" : beangle.contextPath + "/base/"
    }, {
      "name" : "mssu-signup",
      "title" : "面试管理",
      "url" : beangle.contextPath + "/interview/"
    } ], menus);
  }

  $(document).ready(function() {
    loadMenu(window.menus);
    
    setTimeout(function() {
      $(".menu").find("a").first().click();
    }, 0);
  });
});