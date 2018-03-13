[@b.head title = "上海立信会计金融学院春季招生面试成绩查询系统"/]
<div class="container">
<h3>上海立信会计金融学院 春季招生成绩</h3>
<hr>
 <dl class="dl-horizontal">
  <dt>身份证号:</dt>
  <dd>${examGrade.examinee.idNumber}</dd>
  <dt>姓名:</dt>
  <dd>${examGrade.examinee.name}</dd>
  <dt>报名号:</dt>
  <dd>${examGrade.examinee.code}</dd>
  <dt>专业:</dt>
  <dd>${examGrade.examinee.major.name}</dd>

  <dt>排名:</dt>
  <dd>${examGrade.rank}</dd>
  <dt>总成绩:</dt>
  <dd>${examGrade.totalScore}</dd>
  <dt>高考成绩:</dt>
  <dd>${examGrade.cultureScore}</dd>
  <dt>校测成绩:</dt>
  <dd>${examGrade.interviewScore}<dd>
  [#list subjectGrades as sg]
  <dt>${sg.subject.name}:</dt><dd>${sg.score}</dd>
  [/#list]
</dl>
</div>
[@b.foot/]