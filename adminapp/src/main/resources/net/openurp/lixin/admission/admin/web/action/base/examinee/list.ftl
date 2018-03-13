[@b.head title = "面试时段选择系统"/]
  [@b.grid items=examinees var="examinee"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认要删除吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="考生号" property="code" width="25%"/]
      [@b.col title="姓名" property="name" width="10%"/]
      [@b.col title="专业" property="major.name" width="10%"/]
      [@b.col title="身份证号" property="idNumber" width="30%"/]
      [@b.col title="批次" property="batch.name" width="10%"]${examinee.batch.name}[/@]
    [/@]
  [/@]
[@b.foot/]
