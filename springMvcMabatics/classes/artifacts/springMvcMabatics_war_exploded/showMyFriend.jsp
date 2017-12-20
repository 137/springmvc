<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<%
    String contextPath = request.getContextPath();
%>
<head>
    <%--<link type="text/css" rel="stylesheet" href="<%=contextPath%>/css/bootstrap-2.3.2/docs/assets/css/bootstrap.css">样式会发生冲突--%>
    <link type="text/css" rel="stylesheet" href="<%=contextPath%>/css/bootstrap-2.3.2/docs/assets/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet"
          href="<%=contextPath%>/css/bootstrap-2.3.2/docs/assets/css/bootstrap-responsive.css">
    <link type="text/css" rel="stylesheet" href="<%=contextPath%>/css/bootstrap-2.3.2/docs/assets/css/docs.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>love137</title>
    <style>
        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 16px;
            line-height: 1.428571429;
            color: #333333;
            background-color: #ffffff;
        }

        td {
            vertical-align: bottom;
        }
    </style>
    <script type="text/javascript"
            src="js/jquery-1.8_veryhuo.com/jquery-1.8.0.js"></script>
    <script type="text/javascript"
            src="js/bootstrap/bootstrap.min.js"></script>
</head>

<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/views/friend/index.jsp" style="font-size: 23px" target="mainFrame" >我的专栏我做主</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="/MyFriendController/toFriendPiePage.do" target="mainFrame" style="font-size: 16px">好友性别年龄分析</a></li>
                <li><a href="/echarts-2.2.7/doc/example.html"style="font-size: 16px" target="mainFrame">echarts实例展示标准</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"style="font-size: 16px"  target="mainFrame" data-toggle="dropdown">
                         java<b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"style="font-size: 16px"target="mainFrame">jmeter</a></li>
                        <li><a href="#"style="font-size: 16px"target="mainFrame">EJB</a></li>
                        <li><a href="#"style="font-size: 16px"target="mainFrame">Jasper Report</a></li>
                        <li class="divider"></li>
                        <li><a href="#"style="font-size: 16px"target="mainFrame">分离的链接</a></li>
                        <li class="divider"style="font-size: 16px"></li>
                        <li><a href="#"style="font-size: 16px"target="mainFrame">另一个分离的链接</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<iframe src="/views/friend/index.jsp" id="mainFrame" name="mainFrame" allowtransparency="true" style="background-color:transparent" title="test" frameborder="0" width="100%" height="810"  >
</iframe>
<style>
    .black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=80);
    }
    .white_content {
        display: none;
        position: absolute;
        top: 17%;
        left: 10%;
        width: 860px;
        height: 686px;
        /*border: 16px solid lightblue;*/
        background-color: ACC9F5;
        z-index:1002;
        overflow: auto;
    }

</style>
<script type="text/javascript">

    //弹出隐藏层
    function ShowDiv(show_div,bg_div){
        document.getElementById(show_div).style.display='block';
        document.getElementById(bg_div).style.display='block' ;
        var bgdiv = document.getElementById(bg_div);
        bgdiv.style.width = document.body.scrollWidth;
// bgdiv.style.height = $(document).height();
        $("#"+bg_div).height($(document).height());
    };

    //关闭弹出层
    function CloseDiv(show_div,bg_div)
    {
        document.getElementById(show_div).style.display='none';
        document.getElementById(bg_div).style.display='none';
    };

</script>
<!--弹出层时背景层DIV-->
<div id="fade" class="black_overlay">
</div>
<div id="MyDiv2" class="white_content">
    
    <%--<div style="text-align: right; cursor: default; height: 20px;">--%>
        <%--<span style="font-size: 16px;" onclick="CloseDiv('MyDiv2','fade')">关闭</span>--%>
    <%--</div>--%>
    <div style="background-color: #ACC9F5;margin-left: 2%">
        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <center><strong><span style="font-family: bolder;font-size: 42px">山有木兮木有枝，心悦君兮君不知。</span></strong></center>
        <div>&nbsp;</div>
        <center><strong><span style="font-family: bolder;font-size: 34px">人生若只如初见，何事秋风悲画扇。</span></strong></center>
        <div style="margin-top: 2%;margin-left: 3%">
            <div><span style="font-weight: 100;font-size: 22px;">等闲变却故人心</span></div>
            <div>&nbsp;</div>
            <div><span style="font-weight: 100;font-size: 22px;">却道故人心易变</span></div>
            <div>&nbsp;</div>
            <div><span style="font-weight: 100;font-size: 22px;">骊山语罢清宵半</span></div>
            <div>&nbsp;</div>
            <div><span style="font-weight: 100;font-size: 22px;">泪雨霖铃终不怨</span></div>
            <div>&nbsp;</div>
            <div><span style="font-weight: 100;font-size: 22px;">何如薄幸锦衣郎，比翼连枝当日愿。</span></div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //弹出隐藏层
    ShowDiv('MyDiv2','fade');

    //空白地方点击关闭弹窗
    $('body').click( function() {
        CloseDiv('MyDiv2','fade');
    });
</script>
</body>
</html>