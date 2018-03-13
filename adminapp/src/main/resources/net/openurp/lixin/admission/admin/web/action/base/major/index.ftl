[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="考生管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="majors" theme="search"]
          [@b.textfields names="major.code;代码,major.name;名称"/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="majors"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "majors");
      });
    });
  </script>
[@b.foot/]
