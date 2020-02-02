[@b.head title = "面试时段选择系统－管理员"/]
  [@b.grid items=batches var="batch"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="名称" property="name"/]
      [@b.col title="开始时间" property="beginAt"]${(batch.beginAt?string("yyyy-MM-dd HH:mm:ss"))!}[/@]
      [@b.col title="结束时间" property="endAt"]${(batch.endAt?string("yyyy-MM-dd HH:mm:ss"))!}[/@]
    [/@]
  [/@]
[@b.foot/]
