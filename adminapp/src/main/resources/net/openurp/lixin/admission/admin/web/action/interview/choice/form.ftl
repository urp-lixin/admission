[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="面试安排配置"]
    bar.addItem("返回", function() {
      bg.form.submit(document.searchForm, "${b.url("!search")}", "sessions");
    }, "backward.png");
  [/@]
  [@b.form name="sessionForm" action="!save" target="sessions" theme="list"]
    [#assign elementSTYLE = "width: 200px"/]
    [@b.select label="批次" name="session.batch.id" items=batches?sort_by(["name"]) value=(session.batch.id)! required="true" style=elementSTYLE comment="（一个批次、一个专业只能出现一次）"/]
    [@b.select label="专业" name="session.major.id" items=majors?sort_by(["name"]) value=(session.major.id)! required="true" style=elementSTYLE/]
    [@b.validity]
      var form = document.sessionForm;
      function checkAjax() {
        var isOk = false;
        
        $.ajax({
          "type": "POST",
          "url": "${b.url("!checkAjax")}",
          "async": false,
          "dataType": "json",
          "data": {
            "id": form["session.id"].value,
            "batchId": form["session.batch.id"].value,
            "majorId": form["session.major.id"].value
          },
          "success": function(data) {
            isOk = data.isOk;
          }
        });
        
        return isOk;
      }
      
      $("[name='session.batch.id']", form).require().assert(function() {
        return checkAjax();
      }, "当前面试安排已存在！！！");
      
      $("[name='session.major.id']", form).require().assert(function() {
        return checkAjax();
      }, "当前面试安排已存在！！！");
    [/@]
    [@b.startend label="面试时间" name="session.beginAt,session.endAt" start=(session.beginAt?string("yyyy-MM-dd HH:mm"))! end=(session.endAt?string("yyyy-MM-dd HH:mm"))! format="yyyy-MM-dd HH:mm" required="true,true" readOnly="readOnly" style=elementSTYLE/]
    [@b.textfield label="人数上限" name="session.maximum" value=(session.maximum)! required="true" maxlength="5" style=elementSTYLE/]
    [@b.textfield label="已选人数" name="session.selected" value=(session.selected)! required="true" maxlength="5" style=elementSTYLE/]
    [@b.validity]
      $("[name='session.maximum']", form).require().match("integer").greaterThanOrEqualTo(0).assert(function() {
        return parseInt(form["session.maximum"].value) >= parseInt(form["session.selected"].value);
      }, "不能低于已选人数！！！");
      
      $("[name='session.selected']", form).require().match("integer").greaterThanOrEqualTo(0).assert(function() {
        return parseInt(form["session.maximum"].value) >= parseInt(form["session.selected"].value);
      }, "不能高于人数上限！！！");
    [/@]
    [@b.formfoot]
      <input type="hidden" name="session.id" value="${session.persisted?string(session.id, "")}"/>
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
