<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.apex.bss.foundation.utils.StringUtils" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.apex.bss.foundation.web.ContextHelper" %>
<%@ page import="com.apex.form.UserContext" %>
<%@ page contentType="text/html; charset=utf-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String contextPath = request.getContextPath();
    String userId = UserContext.getContext().getUser().getId();
    Date currentTime = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
    String nowDate = formatter.format(currentTime);
    //获取本周所有的日期

    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

    Date currentDate = new Date();

    // 比如今天是2012-12-25
    List<Date> days = dateToWeek(currentDate);
    List showDays=new ArrayList();
//    System.out.println("今天的日期: " + sdf.format(currentDate));
    for (Date date : days) {
        showDays.add(sdf.format(date));
    }

    int weekday= 1;
    try {
        Date today = new Date();
        Calendar c=Calendar.getInstance();
        c.setTime(today);
        weekday=c.get(Calendar.DAY_OF_WEEK)-1;
        if(weekday>5){
            weekday = 5;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<%!
    public static List<Date> dateToWeek(Date mdate) {
        int b = mdate.getDay();
        Date fdate;
        List<Date> list = new ArrayList<Date>();
        Long fTime = mdate.getTime() - b * 24 * 3600000;
        for (int a = 1; a <= 7; a++) {
            fdate = new Date();
            fdate.setTime(fTime + (a * 24 * 3600000));
            list.add(a-1, fdate);
        }
        return list;
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <title>中山证券 - 展业工作平台</title>
    <jsp:include page="/plug-in/bss/pages/inc_ext_resources.jsp"></jsp:include>
    <jsp:include page="/plug-in/bss/pages/inc_resources.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css"
          href="/plug-in/faweb/user/css/global.css?ver=<%=System.currentTimeMillis()%>">
    <link rel="stylesheet" type="text/css" href="/plug-in/faweb/user/css/index.css?ver=<%=System.currentTimeMillis()%>">
    <script type="text/javascript" src="/plug-in/bss/mod/userlog/userlog.js"></script>
    <script type="text/javascript" src="/plug-in/bss/mod/customer/customer_mot.js"></script>
    <script src="/plug-in/bss/mod/prodCenter/jquery.cookie.js" type="text/javascript"></script>
    <script src="/plug-in/bss/mod/prodCenter/jquery.bss.dytabs.js" type="text/javascript"></script>

    <!--Echarts 帮助文件 引入-->
    <script src="/plug-in/bss/js/plugins/jquery.bss.echarts.helper.js" type="text/javascript"></script>
    <script src="/plug-in/bss/js/plugins/echarts/echarts-all-2.2.0.js" type="text/javascript"></script>
    <script src="/plug-in/bss/js/plugins/echarts/macarons.js" type="text/javascript"></script>

    <!--AMcharts 文件 引入-->
    <link rel="stylesheet" href="/plug-in/bss/css/amcharts/style.css"/>
    <script type="text/javascript" src="/plug-in/bss/js/plugins/amcharts/amcharts.js"></script>
    <script type="text/javascript" src="/plug-in/bss/js/plugins/amcharts/serial.js"></script>
    <script type="text/javascript" src="/plug-in/bss/js/plugins/amcharts/amstock.js"></script>
</head>
<body>
<div class="zszq-main">
    <div class="zszq-main-top">
        <div class="zszq-main-box mr10">
            <h2 class="zszq-box-title">渠道开户日报表（结果）</h2>

            <p class="fzrsm" id="qdfzr"></p>
            <table class="qdxx-table">
                <tr>
                    <th class="ta-l">渠道汇总</th>
                    <th>星期一</th>
                    <th>星期二</th>
                    <th>星期三</th>
                    <th>星期四</th>
                    <th>星期五</th>
                </tr>
                <tbody id="tbody_qdhz">
                </tbody>
            </table>
            <%--<div class="mt10 ta-c"><img src="images/data_pic.gif" width="450"/></div>--%>
            <div class="mt10 ta-c">
                <div id="MSCombiDY2D_qdkhs" modType="2" chartType="MSCombiDY2D"
                     class="tc"
                     style="height: 300px;width:500px"></div>
            </div>
            <div class="weekday-box">
                <ul class="weekday-select" id="weekday_select">
                    <%if(showDays!=null&&showDays.size()==7){

                        String two="";
                        String three="";
                        String four="";
                        String five="";
                        if(nowDate.equalsIgnoreCase(showDays.get(0).toString())){
                             two="disabled";
                             three="disabled";
                             four="disabled";
                             five="disabled";
                        }else    if(nowDate.equalsIgnoreCase(showDays.get(1).toString())){
                            three="disabled";
                            four="disabled";
                            five="disabled";
                        }else    if(nowDate.equalsIgnoreCase(showDays.get(2).toString())){
                            four="disabled";
                            five="disabled";
                        }else   if(nowDate.equalsIgnoreCase(showDays.get(3).toString())){
                            five="disabled";
                        }
                    %>
                    <li><span>星期一</span><i class="week_i <%=weekday==1?"active":""%>" sid="<%=showDays.get(0)%>" ></i></li>
                    <li><span>星期二</span><i class="week_i <%=weekday==2?"active":""%>" sid="<%=showDays.get(1)%>" <%=two%>></i></li>
                    <li><span>星期三</span><i class="week_i <%=weekday==3?"active":""%>" sid="<%=showDays.get(2)%>" <%=three%>></i></li>
                    <li><span>星期四</span><i class="week_i <%=weekday==4?"active":""%>" sid="<%=showDays.get(3)%>" <%=four%>></i></li>
                    <li><span>星期五</span><i class="week_i <%=weekday==5?"active":""%>" sid="<%=showDays.get(4)%>" <%=five%>></i></li>
                    <%}%>
                </ul>
            </div>
        </div>
        <div class="zszq-mian-top-right">
            <div class="zszq-main-box2 mb10">
                <h2 class="zszq-box-title">渠道开户日报表（流程）</h2>

                <p class="fzrsm" id="lc_qdfzr"></p>

                <%--<div class="data-loudou-box">--%>
                    <%--<div class="fl"><img src="/plug-in/faweb/user/images/data_loudou.png" width="382"/></div>--%>
                    <%--<div class="fl mt15">--%>
                        <%--<p class="data-loudou-shuju"><a href="#" class="href_dialog" sid="51" id="rkllkhs"></a></p>--%>

                        <%--<p class="data-loudou-shuju"><a href="#" class="href_dialog" sid="52" id="tjcgkhs"></a></p>--%>

                        <%--<p class="data-loudou-shuju"><a href="#" class="href_dialog" sid="53" id="shtgkhs"></a></p>--%>

                        <%--<p class="data-loudou-shuju"><a href="#" class="href_dialog" sid="54" id="khcgkhs"></a></p>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div><img src="/plug-in/faweb/user/images/biaoshi.png" width="434"/></div>--%>
                <div class="dataContainer" id="qd_Chart" style="height: 350px;"></div>
                <div class="pl10 pt2"><span class="pr50">审核驳回数：<a href="#" id="shbhs" class="href_dialog" sid="55"></a></span><span class="pr50">7日待审核数(修复/待审)：<a
                        href="#" id="dshs" class="href_dialog" sid="56"></a></span><span>跑批失败数：<a class="href_dialog" sid="57" href="#" id="ppsbs"></a></span></div>
            </div>
            <div class="zszq-main-box3">
                <h2 class="zszq-box-title mb10">渠道的预警信息</h2>
                <table class="qdxx-table">
                    <tr>
                        <th class="fwb">预警事件</th>
                        <th class="fwb">渠道数量</th>
                    </tr>
                    <tbody id="tbody_qdyjxx">

                    <%--<tr>--%>
                    <%--<td>流量低于前30日平均值</td>--%>
                    <%--<td><a href="#">20</a></td>--%>
                    <%--</tr>--%>
                    <%--<tr class="even">--%>
                    <%--<td>新开户低于前30日平均值</td>--%>
                    <%--<td><a href="#">20</a></td>--%>
                    <%--</tr>--%>
                    <%--<tr>--%>
                    <%--<td>渠道连续3日无新开户</td>--%>
                    <%--<td><a href="#">30</a></td>--%>
                    <%--</tr>--%>
                    <%--<tr class="even">--%>
                    <%--<td>上一交易日无渠道日</td>--%>
                    <%--<td><a href="#">1</a></td>--%>
                    <%--</tr>--%>
                    </tbody>

                </table>
            </div>
        </div>
    </div>

    <div class="zszq-main-body">
        <div class="zszq-main-body-left">
            <h2 class="zszq-box-title"><a class="forDetail" href="/UIProcessor?Table=CX_WJKHSJMX&id=<%=userId%>&ParamAction=true" target="_blank">网金开户数据</a></h2>

            <p class="fzrsm" id="id_sj"></p>
            <table class="qdxx-table2">
                <tr>
                    <th class="title">当日资金户(户)</th>
                    <th>当日股东户(户)</th>
                    <th>当日总资产(万元)</th>
                    <th>本月新开(户)</th>
                    <th>本年新开(户)</th>
                    <th>年度任务(万户)</th>
                    <th>距离任务目标(户)</th>
                    <th>任务达成率</th>
                    <th>累计开户(户)</th>
                </tr>
                <tbody id="tbody_wjkhsj">

                </tbody>
            </table>
        </div>
        <div class="zszq-main-body-right">
            <h2 class="zszq-box-title">年度任务</h2>

            <div id="gaugeChart" style="width: 90%;height: 150px;margin: 0 auto;"></div>

        </div>
    </div>

    <div class="zszq-main-bottom">
        <h2 class="zszq-box-title"><a class="forDetail" href="/UIProcessor?Table=CX_WJZJHYJQK&id=<%=userId%>&ParamAction=true">网金资金和佣金数据</a></h2>

        <p class="fzrsm" id="id_yjqk"></p>
        <table class="qdxx-table2">
            <tr>
                <th class="title">当日资金流入(万元)</th>
                <th>当日资金流出(万元)</th>
                <th>当日资金净流入(万元)</th>
                <th>昨日资金流入(万元)</th>
                <th>昨日资金流出(万元)</th>
                <th>昨日资金净流入(万元)</th>
                <th>昨日佣金贡献(元)</th>
                <th>昨日净佣金贡献(元)</th>
                <th>本月佣金贡献(元)</th>
                <th>本月净佣金贡献(元)</th>
            </tr>
            <tbody id="tbody_qdzjhyjqk">

            </tbody>
        </table>
    </div>

    <div class="zszq-main-bottom">
        <h2 class="zszq-box-title">渠道综合业绩日报表</h2>

        <p class="fzrsm" id="id_rbb"></p>
        <table class="qdxx-table2">
            <tr>
                <th class="title">渠道名称</th>
                <th>入口流量客户数</th>
                <th>新开客户数</th>
                <th>新增入金客户数</th>
                <th>当日交易客户数</th>
                <th>当日交易总金额(万)</th>
                <th>当日佣金贡献(预估元)</th>
                <th>当日净佣金贡献(预估元)</th>
                <%--< <th>当日总资产(万)</th>--%>
                <th>当日市值(万)</th>
                <%--<th>当日资金余额<i class="arrow-btn"><img src="images/arrow-right.png" width="7" /></i></th>--%>
            </tr>
            <tbody id="tbody_qdzhyjrbb">

            </tbody>
        </table>
    </div>
</div>
<div class="tabContainer"></div>
<script type="text/javascript">
    $(function () {
        // Dom对象
        var container = $(document.body);
        var ServicePath = "/plug-in/faweb/user/service.jsp";
        var qdfzr = $("#qdfzr");
        var lc_qdfzr = $("#lc_qdfzr");
        var nowDate = "<%=nowDate%>";
        var tbody_qdhz = $("#tbody_qdhz");
        var rkllkhs = $("#rkllkhs");
        var tjcgkhs = $("#tjcgkhs");
        var shtgkhs = $("#shtgkhs");
        var khcgkhs = $("#khcgkhs");
        var shbhs = $("#shbhs");
        var dshs = $("#dshs");
        var ppsbs = $("#ppsbs");
        var tbody_qdyjxx = $("#tbody_qdyjxx");
        var tbody_qdzhyjrbb = $("#tbody_qdzhyjrbb");
        var tbody_wjkhsj = $("#tbody_wjkhsj");
        var tbody_qdzjhyjqk = $("#tbody_qdzjhyjqk");
        var id_rbb = $("#id_rbb");
        var weekday_select=$("#weekday_select");
        var maxValue = "";
        var currentVal = "";

         var initQdfzr = function (nowDate) {
            //渠道负责人
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "QDFZR"},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"]) {
                        qdfzr.text(ret["O_CURRESULT"][0]["QDFZR"]);
                        lc_qdfzr.text(ret["O_CURRESULT"][0]["QDFZR"]);
                        id_rbb.text(ret["O_CURRESULT"][0]["QDFZR"]);
                    }
                }
            });
        }
        var initKhjg = function (nowDate) {
            // 渠道开户_结果
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "QDKHJG", rq: nowDate},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"] && ret["O_CURRESULT"].length > 0) {
                        
                        tbody_qdhz.empty();
                        var html = [];
                        var xq = ret["O_XQ"];
                        for (var i = 0; i < ret["O_CURRESULT"].length; i++) {
                            var innerResult = ret["O_CURRESULT"][i];
                            html.push('<tr>');
                            html.push(' <td class="cont-title">' + innerResult["渠道汇总"] + '</td>');
                            html.push(' <td><a '+(xq=="1"?"style='color:#c00; font-weight:bold;'":"")+' href="#" sid="'+(i+1)+'1"  class="href_dialog">' + innerResult["星期一"] + '</a></td>');
                            html.push(' <td ><a '+(xq=="2"?"style='color:#c00; font-weight:bold;'":"")+' href="#" sid="'+(i+1)+'2"  class="href_dialog">' + innerResult["星期二"] + '</a></td>');
                            html.push(' <td ><a '+(xq=="3"?"style='color:#c00; font-weight:bold;'":"")+' href="#" sid="'+(i+1)+'3"  class="href_dialog">' + innerResult["星期三"] + '</a></td>');
                            html.push(' <td ><a '+(xq=="4"?"style='color:#c00; font-weight:bold;'":"")+' href="#" sid="'+(i+1)+'4"  class="href_dialog">' + innerResult["星期四"] + '</a></td>');
                            html.push(' <td ><a '+(xq=="5"?"style='color:#c00; font-weight:bold;'":"")+' href="#" sid="'+(i+1)+'5"  class="href_dialog">' + innerResult["星期五"] + '</a></td>');
                            html.push('</tr>');
                        }
                        tbody_qdhz.append(html.join(""));
                    }
                }
            });
        }
        //href_dialog
        container.off("click",".href_dialog").on("click",".href_dialog",function(){
            var sid=$(this).attr("sid");
            var href="/plug-in/faweb/user/detailIframe.jsp?bh="+sid;
            LBUI.showModalDialog(href, {width:1200,height:800,title:"详情"
            });
            return false;
        });
        $(".forDetail").off("click").on("click",function(){
            var href= $(this).attr("href");
            LBUI.showModalDialog(href, {width:1200,height:800,title:"详情"
            });
            return false;
        });
        MacaronsTheme["color"][0]="#52ceff";
        MacaronsTheme["color"][1]="#ffb760";
        MacaronsTheme["color"][2]="#ff4747";
        MacaronsTheme["color"][3]="#717acc";
        var chart = echarts.init(document.getElementById("qd_Chart"), MacaronsTheme);
        var ifBindClick = false;//是否绑定区块点击事件,以免重复绑定事件
        var queryIt = function(ret) {
                    if(ret && ret['O_CODE'] > 0) {
                        var result = ret['O_CURRESULT'];
                        if(result && result.length > 0) {
                            var text = '';
                            var totalCount = 1;
                            var legendData = [];
                            var seriesData = [];
                            var preData = [];
                            //获取总数,如果总数为0,则让它变成1,以便于后面的除法运算.
                            for(var i = 0; i < result.length; i ++) {
                                var data = result[i];
                                var cnt = data['客户数'];
                                var grade = data['GRADE'];
                                if(grade == 1) {
                                    if(cnt != "0") {
                                        totalCount = cnt;
                                    }
                                }
                            }
                            for(var i = 0; i < result.length; i ++) {
                                var data = result[i];
                                var name = data['NAME'];
                                var cnt = data['客户数'];
//                                var grade = data['GRADE'];
                                var id = i+50+1;
//                                if(grade != 0) {
                                    var temp = {
                                        value: '',
                                        name: '',
                                        amount: '',
                                        id: ''
                                    }
                                    temp.value = (cnt / totalCount) * 100;
                                    temp.name = name;
                                    temp.amount = cnt;
                                    temp.id = id;

                                    legendData.push(name);
                                    seriesData.push(temp);
                                    preData.push(cnt);
//                                } else if(grade == 0) {
//                                    text = name;
//                                }
                            }
                            var chart_option = {
                                title : {
                                    text: text
                                },
                                tooltip : {
                                    trigger: 'item',
                                    formatter: function(data){
                                        var a = data[1].split('&');
                                        var amount = 0;
                                        for(var i = 0; i < a.length; i ++) {
                                            var b = $.trim(a[i]);
                                            var c = preData[$.inArray(b, legendData)];
                                            amount += !c ? 0 : parseInt(c);
                                        }
                                        return data[0] + "<br/>" + data[1] + "："+ amount;
                                    }
                                },
                                legend: {
//                                    orient: 'horizontal',
//                                    orient: 'vertical',
                                    x: 'left',
                                    y: '85%',
                                    data : legendData
                                },
                                calculable : false,
                                series : [
                                    {
                                        name: text,
                                        type:'funnel',
                                        width: '70%',
                                        x: '10%',
                                        y: '0%',
                                        y2: '15%',
                                        data:seriesData
                                    }
                                ]
                            };

                            chart.clear();
                            chart.setOption(chart_option);
                            if(!ifBindClick) {
                                function clickFunc(param) {
                                    if (param.type == 'click') {
                                        //这里是点击涂层之后的事件的具体内容
                                        var name = param.name;
                                        if($.inArray(name, legendData) != -1) {
                                            var sid = param.data.id;
                                            var href="/plug-in/faweb/user/detailIframe.jsp?bh="+sid;
                                            LBUI.showModalDialog(href, {width:500,height:500,title:"详情"
                                            });

                                            <%--var href = '/bss/channelManagement/panorama/detail/page/channelAccountFunnelChartDetail.sdo?qdid=${qdid}&khbzid=' + khbzid + '&startDay=' + param0.startDay + '&endDay=' + param0.endDay + '&t=' + new Date().getTime();--%>
                                            <%--LBUI.showModalDialog(href, {title: "开户详细信息", width: 600, height: 450,--%>
                                                <%--fun: {--%>
                                                    <%--callback: function (ret) {--%>
                                                        <%--var success = ret && ret["success"];--%>
                                                        <%--if (success) {   //true表示页面点击确定,false表示点击关闭--%>

                                                        <%--}--%>
                                                    <%--}--%>
                                                <%--}--%>
                                            <%--});--%>
                                        }
                                    }
                                }
                                chart.on(echarts.config.EVENT.CLICK, clickFunc);
                                ifBindClick = true;
                            }

                    }
        }}
        var initqdlc = function (nowDate) {
            //渠道开户_流程 漏斗图
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "QDKHLC", rq: nowDate},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"]) {
                        var result = ret["O_CURRESULT"][0];
                        var shbhsCount = result["审核驳回数"];
                        var dshsCount = result["待审核客户数"];
                        var ppsbsCount = result["跑批失败数"];

                        shbhs.text(shbhsCount);
                        dshs.text(dshsCount);
                        ppsbs.text(ppsbsCount);
                        try {
                            if(parseInt(shbhsCount)>=100){
                                shbhs.css("color","#c00").css("font-weight","bold");
                            }
                            if(parseInt(dshsCount)>=100){
                                dshs.css("color","#c00").css("font-weight","bold");
                            }
                            if(parseInt(ppsbsCount)>=100){
                                ppsbs.css("color","#c00").css("font-weight","bold");
                            }
                        } catch (e) {
                        }
                    }
                }
            });
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "QDKHRBBLC_ZS", rq: nowDate},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"]) {
                        queryIt(ret);
                    }
                }
            });
        }
        // 渠道预警信息
        var initqdyjxx = function (nowDate) {
            // 渠道开户_结果
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "QDYJXX", rq: nowDate},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"] && ret["O_CURRESULT"].length > 0) {
                        
                        tbody_qdyjxx.empty();
                        var html = [];
                        for (var i = 0; i < ret["O_CURRESULT"].length; i++) {
                            var innerResult = ret["O_CURRESULT"][i];
                            var bs = innerResult["标识"];
                            html.push('<tr>');
                            html.push(' <td>' + innerResult["预警事件"] + '</td>');
                            html.push(' <td><a '+(bs=="1"?"style='color:#c00; font-weight:bold;'":"")+' href="#" class="href_dialog" sid="6'+(i+1)+'">' + innerResult["渠道数量"] + '</a></td>');
                            html.push('</tr>');
                        }
                        tbody_qdyjxx.append(html.join(""));
                    }
                }
            });
        }

        var initRbb = function (nowDate) {
            // 渠道综合业绩日报表
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "QDZHYJRBB", rq: nowDate},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"] && ret["O_CURRESULT"].length > 0) {
                        
                        tbody_qdzhyjrbb.empty();
                        var html = [];
                        for (var i = 0; i < ret["O_CURRESULT"].length; i++) {
                            var innerResult = ret["O_CURRESULT"][i];
                            html.push('<tr>');
                            html.push(' <td class="title">' + innerResult["渠道名称"] + '</td>');
                            html.push(' <td>' + innerResult["入口流量客户数"] + '</td>');
                            html.push(' <td >' + innerResult["新开客户数"] + '</td>');
                            html.push(' <td >' + innerResult["新增入金客户数"] + '</td>');
                            html.push(' <td >' + innerResult["当日交易客户数"] + '</td>');
                            html.push(' <td >' + innerResult["当日交易总金额(万)"] + '</td>');
                            html.push(' <td >' + innerResult["当日佣金贡献(预估元)"] + '</td>');
                            html.push(' <td >' + innerResult["当日净佣金贡献(预估元)"] + '</td>');
                         <%-- html.push(' <td >' + innerResult["当日总资产(万)"] + '</td>');--%>
                            html.push(' <td >' + innerResult["当日市值(万)"] + '</td>');
                            html.push('</tr>');
                        }
                        tbody_qdzhyjrbb.append(html.join(""));
                    }
                }
            });
        }
        $(".week_i").click(function(){
            var _t=$(this);
            var _sid=_t.attr("sid");
            $(".week_i").removeClass("active");
            _t.addClass("active");
            renderEChart(2, "资产指标值");
        });
        function renderEChart(modType, title, xAxisName, yAxisNames, rightYAxisNames) {
            $("div[modType='" + modType + "']", container).each(function () {
                var modType = $(this).attr("modType");
                var id = $(this).attr("id");
                $.ajax({
                    url:ServicePath,
                    type: "POST",
                    data:{rq:$(".week_i.active").attr("sid"),MOD:"QDSYTX"},
                    dataType: "JSON",
                    success: function (ret) {
                        if (ret && ret['O_CODE'] && parseInt(ret['O_CODE']) > 0) {
                            var result = ret["O_CURRESULT"];
                            var theChart = echarts.init(document.getElementById(id), MacaronsTheme);
                            var xDatas = [];
                            var ptDatas = [];
                            var ggDatas = [];
                            for (var i = 0; i < result.length; i++) {
                                xDatas.push(result[i]["指标"]);
                                ptDatas.push(result[i]["指标值"]);
                                ggDatas.push(result[i]["平均值"]);
                            }
                            var legendData = ['指标值', '平均值'];
                            var yAxisName = '客户数(户)';
                            var theSeries = [
                                {
                                    name: '指标值',
                                    type: 'line',
                                    data: ptDatas
                                },
                                {
                                    name: '平均值',
                                    type: 'line',
                                    data: ggDatas
                                }
                            ];
                            var theAxisLabel;
                            if (xDatas[0].length > 5 || result.length > 11) {
                                theAxisLabel = {rotate: 10};
                            } else {
                                theAxisLabel = {rotate: 0};
                            }
                            var option = {
                                tooltip: {
                                    trigger: 'axis'
                                },
                                calculable: true,
                                legend: {
                                    data: legendData
                                },
                                xAxis: [
                                    {
                                        type: 'category',
                                        data: xDatas,
                                        axisLabel: theAxisLabel
                                    }
                                ],
                                yAxis: [
                                    {
                                        type: 'value',
                                        name: yAxisName
                                    }
                                ],
                                series: theSeries
                            };
                            theChart.dispose();
                            theChart = echarts.init(document.getElementById(id), MacaronsTheme);
                            theChart.setOption(option);
                        }/* else {
                            alert("查询" + title + "出错");
                        }*/
                    }/*, error: function (text, msg, e) {
                        alert("查询" + title + "出错!");
                    }*/
                });
            });
        }

        /*
         <th class="title">当日资金户(户)</th>
         <th>当日股东户(户)</th>
         <th>当日总资产(万元)</th>
         <th>本月新开(户)</th>
         <th>本年新开(户)</th>
         <th>年度任务(万户)</th>
         <th>距离任务目标(户)</th>
         <th>任务达成率</th>
         <th>累计开户(户)</th>
        */
        var initWjkhsj = function (userId) {
            // 网金开户数据
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "WJKHSJ"},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"] && ret["O_CURRESULT"].length > 0) {

                        tbody_wjkhsj.empty();
                        var html = [];
                        for (var i = 0; i < ret["O_CURRESULT"].length; i++) {
                            var innerResult = ret["O_CURRESULT"][i];
                            currentVal = innerResult["本年新开(户)"];
                            currentVal = currentVal/10000;
                            maxValue = innerResult["年度任务(万户)"];//将万户转为户
                            if(currentVal >= maxValue){
                                //currentVal = maxValue;
				maxValue = currentVal;
                            }
                            html.push('<tr>');
                            html.push(' <td class="title">' + innerResult["当日资金户(户)"] + '</td>');
                            html.push(' <td>' + innerResult["当日股东户(户)"] + '</td>');
                            html.push(' <td >' + innerResult["当日总资产(万元)"] + '</td>');
                            html.push(' <td >' + innerResult["本月新开(户)"] + '</td>');
                            html.push(' <td >' + innerResult["本年新开(户)"] + '</td>');
                            html.push(' <td >' + innerResult["年度任务(万户)"] + '</td>');
                            html.push(' <td >' + innerResult["距离任务目标(户)"] + '</td>');
                            html.push(' <td >' + innerResult["任务达成率"] + '</td>');
                            html.push(' <td >' + innerResult["累计开户(户)"] + '</td>');
                            html.push('</tr>');
                        }
                        tbody_wjkhsj.append(html.join(""));
                        updateNdrw(currentVal, maxValue);
                    }
                }
            });
        }

        /*
         <th class="title">当日资金流入(万元)</th>
         <th>当日资金流出(万元)</th>
         <th>当日资金净流入(万元)</th>
         <th>昨日资金流入(万元)</th>
         <th>昨日资金流出(万元)</th>
         <th>昨日资金净流入(万元)</th>
         <th>日佣金贡献(元)</th>
         <th>日净佣金贡献(元)</th>
         <th>本月佣金贡献(元)</th>
         <th>本月净佣金贡献(元)</th>
         */
        var initZjhyjqk = function (userId) {
            // 渠道资金和佣金情况
            $.ajax({
                url: ServicePath,
                type: "POST",
                dataType: "json",
                data: {MOD: "ZJHYJQK"},
                success: function (ret) {
                    if (ret != null && ret["O_CURRESULT"] && ret["O_CURRESULT"].length > 0) {

                        tbody_qdzjhyjqk.empty();
                        var html = [];
                        for (var i = 0; i < ret["O_CURRESULT"].length; i++) {
                            var innerResult = ret["O_CURRESULT"][i];
                            html.push('<tr>');
                            html.push(' <td class="title">' + innerResult["当日资金流入(万元)"] + '</td>');
                            html.push(' <td> <font color="red">' + innerResult["当日资金流出(万元)"] + '</font></td>');
                            html.push(' <td >' + innerResult["当日资金净流入(万元)"] + '</td>');
                            html.push(' <td >' + innerResult["昨日资金流入(万元)"] + '</td>');
                            html.push(' <td >' + innerResult["昨日资金流出(万元)"] + '</td>');
                            html.push(' <td >' + innerResult["昨日资金净流入(万元)"] + '</td>');
                            html.push(' <td >' + innerResult["昨日佣金贡献(元)"] + '</td>');
                            html.push(' <td >' + innerResult["昨日净佣金贡献(元)"] + '</td>');
                            html.push(' <td >' + innerResult["本月佣金贡献(元)"] + '</td>');
                            html.push(' <td >' + innerResult["本月净佣金贡献(元)"] + '</td>');
                            html.push('</tr>');
                        }
                        tbody_qdzjhyjqk.append(html.join(""));
                    }
                }
            });
        }

        var initData = function () {
            initQdfzr(nowDate);
            initKhjg(nowDate);
            initqdlc(nowDate);
            initqdyjxx(nowDate);
            initRbb(nowDate);
            renderEChart(2, "资产指标值");
            initWjkhsj();
            initZjhyjqk();// 渠道资金和佣金情况
        }
        initData();

//        FusionCharts.setCurrentRenderer('javascript');
        var updateNdrw = function(currentVal, maxValue){
            var pdata = {
                minValue: "0",
                maxValue: maxValue,
                unit: "万户",     //单位
                value: currentVal    // 值
            }

            //创建仪表盘图
            function createGaugeChart(data) {
                new FusionCharts({
                    swfUrl: "/plug-in/acrm/Charts/AngularGauge.swf",
                    width: "100%",
                    height: "100%",
                    renderAt: "gaugeChart",
                    dataFormat: "xml",
                    dataSource: getGaugeData(data)
                }).render();
            }
            //仪表盘XML格式数据
            function getGaugeData(data) {
                var xml = [];
                if (data) {
                    var minval = parseInt(data.minValue);
                    var maxval = parseInt(data.maxValue);
                    /*chart*/
                    xml.push('<chart numberSuffix="' + data.unit + '" manageResize="1" origW="400" origH="250" ');
                    xml.push('showBorder="0" basefontColor="FF0000" manageValueOverlapping="1" autoAlignTickValues="1" bgColor="FFFFFF" upperLimit="' + maxval + '" lowerLimit="' + minval + '" ');
                    xml.push('showGaugeBorder="0" gaugeOuterRadius="140" gaugeOriginX="205" gaugeOriginY="226" gaugeInnerRadius="2" ');
                    xml.push('formatNumberScale="1" decmials="2" pivotRadius="17" tickValueDistance="10" showAboutMenuItem="0" showPrintMenuItem="0" >');
                    /*colorRange*/
                    xml.push('<colorRange>');
                    xml.push('<color minValue="' + minval + '" maxValue="' + parseInt(minval + (maxval - minval) * 0.5) + '" code="ff4646"/>');
                    xml.push('<color minValue="' + parseInt(minval + (maxval - minval) * 0.5) + '" maxValue="' + parseInt(minval + (maxval - minval) * 0.8) + '" code="ffb760"/>');
                    xml.push('<color minValue="' + parseInt(minval + (maxval - minval) * 0.8) + '" maxValue="' + maxval + '" code="52cfff"/>');
                    xml.push('</colorRange>');
                    /*dials*/
                    xml.push('<dials>');
                    xml.push('<dial value="' + data.value + '" borderAlpha="0" bgColor="BEC0C2" baseWidth="28" topWidth="1" radius="130"/>');
                    xml.push('</dials>');
                    /*trendpoints*/
                    xml.push('<trendpoints>');
                    xml.push('<point startValue="' + data.avgValue + '" displayValue="平均值" useMarker="1" markerRadius="8" dashed="1" dashLen="2" dashGap="2"  />');
                    xml.push('</trendpoints>');
                    /*annotations*/
                    xml.push('<annotations><annotationGroup id="Grp1" showBelow="1" showShadow="1" x="205" y="227.5">');
                    xml.push('<annotation type="circle" x="0" y="2.5" radius="150" startAngle="0" endAngle="180" fillPattern="linear" ');
                    xml.push('fillAsGradient="1" fillColor="dddddd,666666" fillAlpha="100,100"  fillRatio="50,50" fillAngle="0" showBorder="0"/>');
                    xml.push('<annotation type="circle" x="0" y="0" radius="145" startAngle="0" endAngle="180" fillPattern="linear" ');
                    xml.push('fillAsGradient="1" fillColor="666666,ffffff" fillAlpha="100,100"  fillRatio="50,50" fillAngle="0" />');
                    xml.push('</annotationGroup></annotations>');

                    xml.push('</chart>');
                    return xml.join("");
                } else {
                    return xml.join("");
                }
            }

            createGaugeChart(pdata);
        }

        function reLoadPage() {

            setInterval(initData, 180000);
        }
        reLoadPage();
    });
</script>
</body>
</html>