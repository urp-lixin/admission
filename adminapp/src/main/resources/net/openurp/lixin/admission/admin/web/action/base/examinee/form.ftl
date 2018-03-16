[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="批次配置"]
    bar.addBack();
  [/@]
  [@b.form name="examineeForm" action="!save" target="examinees" theme="list"]
    [#assign elementSTYLE = "width: 200px"/]
    [@b.textfield label="身份证号" name="examinee.idNumber" value=(examinee.idNumber)! required="true" maxlength="30" style=elementSTYLE/]
    [@b.validity]
      $("[name='examinee.idNumber']", document.examineeForm).require().assert(function() {
        var isOk = false;

        $.ajax({
          "type": "POST",
          "url": "${b.url("!checkAjax")}",
          "async": false,
          "dataType": "json",
          "data": {
            "id": document.examineeForm["examinee.id"].value,
            "idNumber": document.examineeForm["examinee.idNumber"].value
          },
          "success": function(data) {
            isOk = data.isOk;
          }
        });

        return isOk;
      }, "名称已存在！！！");
    [/@]
    [@b.textfield label="考生号" name="examinee.code" value=(examinee.code)! required="true" maxlength="30" style=elementSTYLE/]
    [@b.textfield label="姓名" name="examinee.name" value=(examinee.name)! required="true" maxlength="100" style=elementSTYLE/]
    [@b.select label="专业" name="examinee.major.id" items=majors?sort_by(["name"]) value=(examinee.major.id)! required="true" style=elementSTYLE/]
    [@b.select label="批次" name="examinee.batch.id" items=batches?sort_by(["name"]) value=(examinee.batch.id)! required="true" style=elementSTYLE/]
    [@b.formfoot]
      <input type="hidden" name="examinee.id" value="${examinee.persisted?string(examinee.id, "")}"/>
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
