<%--
  Created by IntelliJ IDEA.
  User: love137
  Date: 2016/11/22
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="ECharts">
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<center>
  <div style="height: 15%;margin-top: 60px">&nbsp;皑如山上雪，皎若云间月。
    闻君有两意，故来相决绝。
    今日斗酒会，明旦沟水头。
    躞蹀御沟上，沟水东西流。
    凄凄复凄凄，嫁娶不须啼。
    愿得一人心，白首不相离。
    竹竿何袅袅，鱼尾何簁簁！
    男儿重意气，何用钱刀为！</div>
  <div id="main" style="height:600px;width: 60%;"></div>
</center>
<script type="text/javascript" src="/js/jquery-1.8_veryhuo.com/jquery-1.8.0.js"></script>
<!-- ECharts单文件引入 -->
<script src="/echarts-2.2.7/echarts.js"></script>
<script type="text/javascript">

  var dataArray=new Array();

  //好友生日分析
  $.ajax({
    type: "post",
    url: "/MyFriendController/birAnalysis.do",
    dataType: "json",
    error: function (XMLHttpRequest, textStatus, errorThrown) {
      alert(XMLHttpRequest.status);
    },

    success: function (data) {
      //obj = eval("(" + data + ")");//经过springmvc的处理返回的数据已经是json对象了不需要再进行转换了
      loadPie1(data);//ajax是异步请求,调用完之后就销毁活动,不能用于数据赋值,但是可以将方法放在内部执行
    }
  });




  //好友性别饼图挂载
  function loadPie1(data){
    // 路径配置
    require.config({
      paths: {
        echarts: '/echarts-2.2.7/build/dist'
      }
    });
    var dataValue=new Array();
    var dataValue2=new Array();
    for(i=0;i<data.length;i++){
      dataValue.push(data[i].name);
    }
    for(var j in data){
      dataValue2.push(data[j].value);
    }
    // 使用
    require(
            [
              'echarts',
              'echarts/chart/line',
              'echarts/chart/bar'
               // 使用饼图就加载bar模块，按需加载
            ],
            function (ec) {
              // 基于准备好的dom，初始化echarts图表
              var myChart = ec.init(document.getElementById('main'));

              var option = {
                title : {
                  text: '好友生日分析图',
                  subtext: '芥子纳须弥'
                },
                tooltip : {
                  trigger: 'axis'
                },
                legend: {
                  data:['出生日期']
                },
                toolbox: {
                  show : true,
                  feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                  }
                },
                calculable : true,
                xAxis : [
                  {
                    type : 'category',
                    data : dataValue
                  }
                ],
                yAxis : [
                  {
                    type : 'value',
                    splitArea: {
                      "show": true
                    },max:1800

                  }
                ],
                series : [
                  {
                    name:'出生日期',
                    type:'bar',
                    data:dataValue2,
                    markPoint : {
                      data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                      ]
                    },
                    markLine : {
                      data : [
                        {type : 'average', name : '平均值'}
                      ]
                    }
                  }
                ]
              };

              // 为echarts对象加载数据
              myChart.setOption(option);
            }
    );
  }

</script>
</body>
</html>