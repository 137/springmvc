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
      padding-top: 0px;
    }

    td {
      vertical-align: bottom;
    }
  </style>
  <script type="text/javascript"
          src="/js/jquery-1.8_veryhuo.com/jquery-1.8.0.js"></script>
  <script type="text/javascript"
          src="/js/bootstrap/bootstrap.min.js"></script>
  <script>
    /**加载数据**/
    $.ajax({
      type: "post",
      url: "/LogRecordController/showMyRecordLog.do",
      contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      dataType: "json",
      error: function (XMLHttpRequest, textStatus, errorThrown) {
        alert(XMLHttpRequest.status);
      },

      success: function (data) {
        //obj = eval("(" + data + ")");//经过springmvc的处理返回的数据已经是json对象了不需要再进行转换了
        obj = data;
        temp = obj[0];
        dataStr = "";
        for (var i = 0; i < obj.length; i++) {
          var p = obj[i];
          var table = $('.table');
          dataStr += "<tr>" + "<td>" + i + "</td>" +
          "<td>" + p.createTime + "</td>" +
          "<td>" + p.operateName + "</td>" +
          "<td>" + p.operateDes + "</td>" +
          "<td>" + p.operateObj + "</td>" +
          "</tr>";
        }
        table.append(dataStr);
      }
    });




    //给搜索按钮绑定回车事件,回车键keycode为13
    $(document).keydown(function (event) {
      if (event.keyCode == 13) {
//                $("#mouse").attr({"disabled":"disabled"});//将按钮变灰
//                $("#mouse").css("opacity","0.3");//将按钮设置透明
        $("#mouse").click();
      }
    });

    $(".private").attr("value","*************");

  </script>
</head>

<body>

<table class="table table-striped" cellspacing="1">

  <tr id="letitsave" style="background-color:#E3E3E3;">
    <td style="width: 80px">编号</td>
    <td style="width: 80px">创建时间</td>
    <td style="width: 80px">操作名称</td>
    <td style="width: 80px">操作描述</td>
    <td style="width: 130px">操作对象</td>
  </tr>
</table>
</body>
</html>