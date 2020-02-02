[#assign mssu = { "shortName": "春招系统" }/]
[@b.head title=mssu.shortName/]
  <link href="${base}/static/nav/menu.css?v=default" rel="stylesheet" type="text/css" />
  <script src="${base}/static/nav/menu.js?v=20200205" type="text/javascript"></script>
  <script src="${base}/static/nav/admin.js?v=20200205" type="text/javascript"></script>

[#include "/nav.ftl"/]
[@displayFrame org =mssu appName="mssu-base" /]

<script type="text/javascript">
  var webappBase = "";
  thisAppName = "mssu-base";
  window.menus = [
    {
      "id": 1,
      "title": "专业",
      "entry": "${base}/base/major",
      "code": "01"
    }, {
      "id": 2,
      "title": "批次维护",
      "entry": "${base}/base/batch",
      "code": "02"
    }, {
      "id": 3,
      "title": "考生信息",
      "entry": "${base}/base/examinee",
      "code": "03"
    },
  ];
</script>
[@b.foot/]
