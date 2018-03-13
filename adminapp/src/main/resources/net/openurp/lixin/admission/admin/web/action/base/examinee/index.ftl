[@b.head title = "面试时段选择系统"/]
  [@b.toolbar title="考生信息"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="examinees" theme="search"]
          [@b.textfields names="examinee.idNumber;身份证号,examinee.code;考生号,examinee.name;姓名"/]
          [@b.select label="专业" name="examinee.major.id" items=majors?sort_by(["name"]) empty="..."/]
          [@b.select label="批次" name="examinee.batch.id" items=batches?sort_by(["name"]) empty="..."/]
        [/@]
      </td>
      <td class="index_content">[@b.div id="examinees"/]</td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        bg.form.submit(document.searchForm, "${b.url("!search")}", "examinees");
      });
    });
  </script>
[@b.foot/]
