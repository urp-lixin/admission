[@b.head title = "面试时段选择系统－管理员"/]
  [@b.toolbar title="专业配置"]
    bar.addBack();
  [/@]
  [@b.form name="majorForm" action="!save" target="majors" theme="list"]
    [@b.textfield label="代码" name="major.code" value=(major.code)! required="true" maxlength="20"/]
    [@b.textfield label="名称" name="major.name" value=(major.name)! required="true" maxlength="100"/]
    [@b.formfoot]
      <input type="hidden" name="major.id" value="${major.persisted?string(major.id, "")}"/>
      [@b.submit value="提交"/]
    [/@]
  [/@]
[@b.foot/]
