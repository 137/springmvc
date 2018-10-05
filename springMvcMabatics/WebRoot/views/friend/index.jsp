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
      url: "/MyFriendController/selectMyFriend.do",
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
          "<td>" + p.createdate + "</td>" +
          "<td>" + p.name + "</td>" +
          "<td>" + p.sex + "</td>" +
          "<td>" + p.birthday + "</td>" +
          "<td>" + p.telephone + "</td>" +
          "<td>" + p.qq + "</td>" +
          "<td>  *********** </td>" +
          "<td>" + p.school + "</td>" +
          "<td>  *********** </td>" +
          "<td>" + p.major + "</td>" +
          "<td>" + p.address + "</td>" +
          "<td>" + p.company + "</td>" +
          "<td>  *********** </td>" +
          "<td><span onclick=modifyFriend('"+p.qq+"')>" +
          "<a href='#'> 修</a></span>&nbsp;&nbsp;<span onclick=deleteFriend('" + p.qq + "')><a href='#'> 删</a></span></td>" +
          "</tr>";
        }
        table.append(dataStr);
      }
    });

    //搜索
    function selectMyFriend() {
      $.ajax({
        type: "post",
        url: "/MyFriendController/selectMyFriend.do",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: {"columnName": $("#columnName").val(), "columnValue": $("#columnValue").val()},
        success: function (data) {

          var table = $('.table');
          $('#letitsave').nextAll().remove();
          obj = data;
          if (obj.error != null && obj.error != "") {
            table.append("<tr>" + "<td colspan='15' align='center'>" + obj.error + "</td>" + "/<tr>");
          }
          else {
            var dataStr = "";
            for (var i = 0; i < obj.length; i++) {
              var p = obj[i];
              dataStr += "<tr>" + "<td>" + i + "</td>" +
              "<td>" + p.createdate + "</td>" +
              "<td>" + p.name + "</td>" +
              "<td>" + p.sex + "</td>" +
              "<td>" + p.birthday + "</td>" +
              "<td>" + p.telephone + "</td>" +
              "<td>" + p.qq + "</td>" +
              "<td>  *********** </td>" +
              "<td>" + p.school + "</td>" +
              "<td>  *********** </td>" +
              "<td>" + p.major + "</td>" +
              "<td>" + p.address + "</td>" +
              "<td>" + p.company + "</td>" +
              "<td>  *********** </td>" +
              "<td><span onclick=modifyFriend('"+p.qq+"')>" +
              "<a href='#'> 修</a></span>&nbsp;&nbsp;<span onclick=deleteFriend('" + p.qq + ")><a href='#'> 删</a></span></td>" +
              "</tr>";
            }
            table.append(dataStr);
          }
        }
      });
    }

    //添加
    function addcontent() {

      location.href = "/MyFriendController/toInsertPage.do";
    }

    //修改
    function modifyFriend( qq) {
//            $.ajax({
//                url: 'MyFriendController/toUpdatePage.do',
//                type: "post",
//                data: { "name": name,"sex":sex,"birthday":birthday,"telephone":telephone,"qq":qq,"hobby":hobby,
//                    "school":school,"education_background":education_background,
//                    "major":major,"address":address,"company":company,"relation":relation},
//                success: function (data) {
//                    alert(1);
//                },
//                error: function (e) {
//                    debugger;
//                    alert(eval(e));
//                }
//            });
      var url="/MyFriendController/toUpdatePage.do?qq=" + qq + "";
      location.href=url;
    }

    //删除
    function deleteFriend(qq) {
      if (confirm("您确定要删除用户qq为:" + qq + "的用户?")) {
        $.ajax({
          type: "post",
          url: "/MyFriendController/deleteFriend.do",
          dataType: "json",
          data: {"qq": qq},
          error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status);
          },

          success: function (data) {
            //obj = eval("(" + data + ")");//经过springmvc的处理返回的数据已经是json对象了不需要再进行转换了
            if (data == 1) {
              alert("删除成功!");
              selectMyFriend();

            } else {
              alert("删除失败!" + data);
            }
          }
        });
      }
    }

    //给搜索按钮绑定回车事件,回车键keycode为13
    $(document).keydown(function (event) {
      if (event.keyCode == 13) {
//                $("#mouse").attr({"disabled":"disabled"});//将按钮变灰
//                $("#mouse").css("opacity","0.3");//将按钮设置透明
        $("#mouse").click();
      }
    });

    $(".private").attr("value","*************");

    $("#columnName").focus(function(){
      alert(1);
    });
  </script>
</head>

<body>
<div style="background-color: #dcdcdc;height: 38px;border: 5px dotted blanchedalmond ">.
    <span style="font-size: 16px">条件搜索列名：</span>
    <%--<input type="text" id="columnName" name="columnName"/>--%>
    <select name="columnName" id="columnName">

      <option value="姓名">姓名</option>
      <option value="创建时间">创建时间</option>
      <option value="性别">性别</option>
      <option value="出生日期">出生日期</option>
      <option value="电话号码">电话号码</option>
      <option value="qq">qq</option>
      <option value="兴趣爱好">兴趣爱好</option>
      <option value="学校">学校</option>
      <option value="专业">专业</option>
      <option value="地址">地址</option>
      <option value="公司">公司</option>
    </select>
    <span style="font-size: 16px">条件搜索属性值:</span>
    <input type="text" id="columnValue" name="columnValue"/>
    <input type="button" class="btn-primary" value="搜  索" id="mouse" onclick="selectMyFriend()"/>
    <input type="button" class="btn-primary" value="添   加" onclick="addcontent()">
    <span style="color:blue;font-size: 16px">友情提示:点击修改就可以看到明细</span>
</div>


<table class="table table-striped" cellspacing="1">

  <tr id="letitsave" style="background-color:#E3E3E3;">
    <td style="width: 80px"><span style="font-family: bolder">编号</span></td>
    <td style="width: 80px">创建时间</td>
    <td style="width: 80px">姓名</td>
    <td style="width: 80px">性别</td>
    <td style="width: 130px">出生日期</td>
    <td style="width: 230px">电话号码</td>
    <td style="width: 230px">qq</td>
    <td style="width: 120px">兴趣爱好</td>
    <td style="width: 480px">学校</td>
    <td style="width: 130px">教育背景</td>
    <td style="width: 380px">专业</td>
    <td style="width: 330px">地址</td>
    <td style="width: 330px">公司</td>
    <td style="width: 130px">与本人关系</td>
    <td>操作</td>
  </tr>
</table>
</body>
</html>