[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="面试安排报名管理"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="choices" theme="search"]
          [@b.textfield label="报名号" name="interviewChoice.examinee.code" /]
          [@b.textfield label="姓名" name="interviewChoice.examinee.name" /]
          [@b.select label="批次" name="interviewChoice.examinee.batch.id" items=batches?sort_by(["name"]) empty="..."/]
          [@b.select label="专业" name="interviewChoice.examinee.major.id" items=majors?sort_by(["name"]) empty="..."/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="choices"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "choices");
      });
    });
  </script>
[@b.foot/]
