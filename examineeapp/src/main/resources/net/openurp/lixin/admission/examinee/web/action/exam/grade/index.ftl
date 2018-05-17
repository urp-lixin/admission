[@b.head title = "上海立信会计金融学院专升本考试成绩查询系统"/]
  <link href="${base}/static/css/user.css" rel="stylesheet" type="text/css" />
  <div class="container">
     <div class="user">
    [@b.form title="上海立信会计金融学院 专升本考试成绩查询系统" name="interviewChoiceForm" action="!search" theme="list"]
      [#assign elementSTYLE = "width: 200px"/]
      [@b.textfield label="准考证号" name="code" placeholder="准考证号" required="true" maxlength="50" style=elementSTYLE/]
      [@b.textfield label="姓名" name="name" placeholder="姓名" required="true" maxlength="50" style=elementSTYLE/]
      [@b.textfield label="身份证号" name="idNumber" placeholder="身份证号" required="true" maxlength="50" style=elementSTYLE/]
      [@b.formfoot]
        [@b.submit value="查询" style="margin-left: 48px;"/]
      [/@]
    [/@]
    </div>
  </div>
  <script src="${base}/static/js/user.js" type="text/javascript"></script>
[@b.foot/]
