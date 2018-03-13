[@b.head title = "面试时段选择系统－管理员"/]
  [@b.grid items=majors var="major"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="代码" property="code" width="20%"/]
      [@b.col title="名称" property="name"/]
    [/@]
  [/@]
[@b.foot/]
