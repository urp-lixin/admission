[#assign mssu = { "shortName": "春招系统" }/]
[@b.head title=mssu.shortName/]
  <link href="${base}/static/nav/menu.css?v=default" rel="stylesheet" type="text/css" />
  <script src="${base}/static/nav/menu.js?v=20200204" type="text/javascript"></script>

[#include "/nav.ftl"/]
[@displayFrame org =mssu appName="mssu-signup" /]

<script type="text/javascript">
  var webappBase = "";
  thisAppName = "mssu-signup";
  var menus = [
    {
      "id": 3,
      "title": "面试安排",
      "entry": "${base}/interview/session",
      "code": "03"
    }, {
      "id": 4,
      "title": "面试选择",
      "entry": "${base}/interview/choice",
      "code": "04"
    }
  ];
</script>
<script src="${base}/static/nav/admin.js?v=20200205" type="text/javascript"></script>
[@b.foot/]
