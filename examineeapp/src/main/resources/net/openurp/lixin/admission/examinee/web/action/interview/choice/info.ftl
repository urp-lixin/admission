[@b.head title = "上海立信会计金融学院春季招生面试时段选择系统"/]
<!--引用百度地图API-->
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
      [@b.form title="上海立信会计金融学院 面试时段选择结果" name="interviewChoiceForm" action="/user/interview-choice/search" 
         theme="list" onsubmit="return confirmLast()" validate="true"]
        <table class="infoTable">
          <tr>
            <td class="title" width="20%">身份证号：</td>
            <td>${choice.examinee.idNumber}</td>
            <td colspan="2" rowspan="8">
              <div style="width:497px;height:350px;border:#ccc solid 1px;" id="dituContent"></div>
            </td>
          </tr>
          <tr>
            <td class="title">姓名：</td>
            <td>${choice.examinee.name}</td>
          </tr>
          <tr>
            <td class="title">专业：</td>
            <td>${choice.examinee.major.name}</td>
          </tr>
          <tr>
            <td class="title" width="20%">报名号：</td>
            <td>${choice.examinee.code}</td>
          </tr>
          <tr>
            <td class="title" style="color: blue">面试时间：</td>
            <td style="color: blue">${choice.session.beginAt?string("yyyy-MM-dd")} ${choice.session.beginAt?string("HH:mm")}~${choice.session.endAt?string("HH:mm")}</td>
          </tr>
          <tr>
            <td class="title">测试地点：</td>
            <td>浦东上川路995号上海立信会计金融学院第六教学楼</td>
          </tr>
          <tr>
            <td class="title">备注：</td>
            <td>考生请提前三十分钟到校备考。注意测试时间段一旦选定不可再次修改。</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
      [/@]
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(121.661023,31.284933);//定义一个中心点坐标
        map.centerAndZoom(point,17);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_ZOOM});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:0});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    //标注点数组
    var markerArr = [{title:"春季招生面试点-第六教学楼",content:"面试时间:${choice.session.beginAt?string("yyyy-MM-dd")} ${choice.session.beginAt?string("HH:mm")}开始，请提前半小时到校备考。",
    point:"121.660978|31.286106",isOpen:0,icon:{w:21,h:21,l:0,t:0,x:6,lb:5}}
		 ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }
    
    initMap();//创建和初始化地图
</script>
[@b.foot/]