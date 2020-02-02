$(function() {
  function loadMenu(menus) {
    displayAppAndMenus(menus);
  }

  $(document).ready(function() {
    loadMenu(window.menus);

    setTimeout(function() {
      $(".menu").find("a").first().click();
    }, 0);
  });
});
