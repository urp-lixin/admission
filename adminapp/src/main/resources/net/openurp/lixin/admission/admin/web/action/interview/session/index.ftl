[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="面试安排时段管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="sessions" theme="search"]
          [@b.select label="批次" name="interviewSession.batch.id" items=batches?sort_by(["name"]) empty="..."/]
          [@b.select label="专业" name="interviewSession.major.id" items=majors?sort_by(["name"]) empty="..."/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="sessions"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "sessions");
      });
    });
  </script>
[@b.foot/]
