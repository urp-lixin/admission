[@b.head title = "面试时段选择系统－管理员"/]
  [@b.grid items=interviewSessions var="interviewSession"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="批次" property="batch.name" width="30%"]${interviewSession.batch.name}[/@]
      [@b.col title="专业" property="major.name"/]
      [@b.col title="开始时间" property="beginAt"]${interviewSession.beginAt?string("yyyy-MM-dd HH:mm")}[/@]
      [@b.col title="结束时间" property="endAt"]${interviewSession.endAt?string("yyyy-MM-dd HH:mm")}[/@]
      [@b.col title="人数上限" property="maximum" width="7%"/]
      [@b.col title="已选人数" property="selected" width="7%"/]
    [/@]
  [/@]
[@b.foot/]
