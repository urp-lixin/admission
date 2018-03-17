[@b.head title = "上海立信会计金融学院春季招生面试时段选择系统"/]
<div>
  [#if examinee??]
     面试网上选择时间为:${examinee.batch.beginAt?string("yyyy-MM-dd HH:mm:ss")}~${examinee.batch.endAt?string("yyyy-MM-dd HH:mm:ss")}
  [#else]
  对不起，您不在当前面试名单中！
  [/#if]
</div>
[@b.foot/]
