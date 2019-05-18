[@b.head title = "上海立信会计金融学院专升本考试成绩查询系统"/]
[#if examGrade??]
<div class="container">
<h3>上海立信会计金融学院 专升本考试成绩</h3>
<hr>
 <dl class="dl-horizontal">
  <dt>身份证号:</dt>
  <dd>${examGrade.examinee.idNumber}</dd>
  <dt>姓名:</dt>
  <dd>${examGrade.examinee.name}</dd>
  <dt>准考证号:</dt>
  <dd>${examGrade.examinee.code}</dd>
  [#--<dt>报考专业:</dt>
  <dd>${examGrade.examinee.major.name}</dd>
  --]
  <dt>总成绩:</dt>
  <dd>${examGrade.score}</dd>
  [#list subjectGrades as sg]
  <dt>${sg.subject.name}:</dt><dd>${sg.score}</dd>
  [/#list]
</dl>
</div>
[#else]
  找不到您的成绩.
[/#if]
[@b.foot/]
