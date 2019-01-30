[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="面试安排配置"]
    bar.addItem("返回", function() {
      bg.form.submit(document.searchForm, "${b.url("!search")}", "sessions");
    }, "backward.png");
  [/@]
  [@b.form name="sessionForm" action=b.rest.save(interviewSession) target="sessions" theme="list"]
    [#assign elementSTYLE = "width: 200px"/]
    [@b.select label="批次" name="interviewSession.batch.id" items=batches?sort_by(["name"]) value=(interviewSession.batch.id)! required="true" style=elementSTYLE comment="（一个批次、一个专业只能出现一次）"/]
    [@b.select label="专业" name="interviewSession.major.id" items=majors?sort_by(["name"]) value=(interviewSession.major.id)! required="true" style=elementSTYLE/]
    [@b.startend label="面试时间" name="interviewSession.beginAt,interviewSession.endAt" start=(interviewSession.beginAt?string("yyyy-MM-dd HH:mm"))! end=(interviewSession.endAt?string("yyyy-MM-dd HH:mm"))! format="yyyy-MM-dd HH:mm" required="true,true" readOnly="readOnly" style=elementSTYLE/]
    [@b.textfield label="人数上限" name="interviewSession.maximum" value=(interviewSession.maximum)! required="true" maxlength="5" style=elementSTYLE/]
    [@b.textfield label="已选人数" name="interviewSession.selected" value=(interviewSession.selected)! required="true" maxlength="5" style=elementSTYLE/]
    [@b.validity]
      var form=document.sessionForm;
      $("[name='interviewSession.maximum']", document.sessionForm).require().match("integer").greaterThanOrEqualTo(0).assert(function() {
        return parseInt(form["interviewSession.maximum"].value) >= parseInt(form["interviewSession.selected"].value);
      }, "不能低于已选人数！！！");

      $("[name='interviewSession.selected']", document.sessionForm).require().match("integer").greaterThanOrEqualTo(0).assert(function() {
        return parseInt(form["interviewSession.maximum"].value) >= parseInt(form["interviewSession.selected"].value);
      }, "不能高于人数上限！！！");
    [/@]
    [@b.formfoot]
      [@b.submit value="提交"/]
    [/@]
  [/@]
  <script>
    $(function() {
      $(document).ready(function() {
        $(".Wdate").attr("readOnly", "");
      });
    });
  </script>
[@b.foot/]
