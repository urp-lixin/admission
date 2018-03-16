[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="批次配置"]
    bar.addBack();
  [/@]
  [@b.form name="batchForm" action="!save" target="batches" theme="list"]
    [@b.textfield label="名称" name="batch.name" value=(batch.name)! required="true" maxlength="10"/]
    [@b.validity]
      $("[name='batch.name']", document.batchForm).require().assert(function() {
        var isOk = false;

        $.ajax({
          "type": "POST",
          "url": "${b.url("!checkAjax")}",
          "async": false,
          "dataType": "json",
          "data": {
            "id": document.batchForm["batch.id"].value,
            "name": document.batchForm["batch.name"].value
          },
          "success": function(data) {
            isOk = data.isOk;
          }
        });

        return isOk;
      }, "名称已存在！！！");
    [/@]
    [@b.startend label="使用时间段" name="batch.beginAt,batch.endAt" start=(batch.beginAt)!
        end=(batch.endAt)! required="true,true" format="yyyy-MM-dd HH:mm:ss" /]
    [@b.formfoot]
      <input type="hidden" name="batch.id" value="${batch.persisted?string(batch.id, "")}"/>
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
