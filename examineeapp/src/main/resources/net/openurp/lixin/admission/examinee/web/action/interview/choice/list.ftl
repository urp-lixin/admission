[@b.head title = "上海立信会计金融学院春季招生面试时段选择系统"/]
      <link href="${base}/static/css/user.css" rel="stylesheet" type="text/css" />
      [@b.messages/]
      [@b.form title="春季招生面试时段选择" name="interviewChoiceForm" action="!save"
        theme="list" onsubmit="return confirmLast()"]
        <table class="infoTable">
          <tr>
            <td class="title" width="20%">身份证号：</td>
            <td>${examinee.idNumber}</td>
            <td class="title" width="20%">考生号：</td>
            <td>${examinee.code}</td>
          </tr>
          <tr>
            <td class="title">姓名：</td>
            <td>${examinee.name}</td>
            <td class="title">专业：</td>
            <td>${examinee.major.name}</td>
          </tr>
          <tr>
            <td class="title">网上选择面试时间：</td>
            <td>
            ${examinee.batch.beginAt?string("yyyy-MM-dd HH:mm:ss")}~${examinee.batch.endAt?string("yyyy-MM-dd HH:mm:ss")}
            </td>
            <td class="title"></td>
            <td></td>
          </tr>
        </table>
        [@b.field id="session" label="可选择的面试安排" required="true"]
          <div style="display: inline-block; width: 68%">
            [@b.grid items=sessions var="session" style="font-weight: normal; font-size: 10pt" sortable="false"]
              [@b.row]
                [@b.boxcol type="radio" boxname="sessionId"/]
                [@b.col title="面试日期" width="30%"]${session.beginAt?string("yyyy-MM-dd")}[/@]
                [@b.col title="面试时段"]${session.beginAt?string("HH:mm")}～${session.endAt?string("HH:mm")}[/@]
                [@b.col title="限报人数"]${session.maximum}[/@]
                [@b.col title="已选人数"]${session.selected}[/@]
              [/@]
            [/@]
          </div>
        [/@]
        [@b.field label="备注"]考生请提前三十分钟到校备考。注意测试时间段一旦选定不可再次修改。[/@]
        [@b.formfoot]
          <input type="hidden" name="code" value="${examinee.code}"/>
          <input type="hidden" name="name" value="${examinee.name}"/>
          <input type="hidden" name="idNumber" value="${examinee.idNumber}"/>
          [@b.submit value="提交"/]
        [/@]
      [/@]
      <script>
        function confirmLast(){
           if($("input[name=sessionId]:checked").size()<0){
              alert("请选择面试时段");
             return false;
           }
             if(confirm("注意测试时间段一旦选定不可再次修改。确定提交?")){
               return true;
             }else{
               return false;
             }
        }
      </script>
[@b.foot/]
