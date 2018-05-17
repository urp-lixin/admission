[@b.head title = "上海立信会计金融学院专升本考试成绩查询系统"/]
<div>
  [#if examinee??]
     成绩查询时间为:${examinee.batch.beginAt?string("yyyy-MM-dd HH:mm:ss")}~${examinee.batch.endAt?string("yyyy-MM-dd HH:mm:ss")}
  [#else]
  对不起，您不在当前考生名单中！
  [/#if]
</div>
[@b.foot/]
