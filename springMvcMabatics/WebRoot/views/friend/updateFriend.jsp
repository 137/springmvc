<%--
  Created by IntelliJ IDEA.
  User: love137
  Date: 2016/9/9
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String contextPath = request.getContextPath();
%>
<head>
    <link type="text/css" rel="stylesheet"
          href="<%=contextPath%>/css/bootstrap-2.3.2/docs/assets/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet"
          href="<%=contextPath%>/css/bootstrap-2.3.2/docs/assets/css/bootstrap-responsive.css">
    <link type="text/css" rel="stylesheet" href="<%=contextPath%>/css/bootstrap-2.3.2/docs/assets/css/docs.css">
    <script type="text/javascript" src="/js/jquery-1.8_veryhuo.com/jquery-1.8.0.js"></script>
    <script type="text/javascript" src="/js/bootstrap/bootstrap.min.js"></script>
    <style>

    </style>
    <title></title>
    <script type="text/javascript">
        //获取后端的数据
        $(function () {
            name = "${myFriend.name}";
            sex = "${myFriend.sex}";
            birthday = "${myFriend.birthday}";
            telephone = "${myFriend.telephone}";
            qq = "${myFriend.qq}";
            hobby = "${myFriend.hobby}";
            school = "${myFriend.school}";
            education_background = "${myFriend.education_background}";
            major = "${myFriend.major}";
            address = "${myFriend.address}";
            company = "${myFriend.company}";
            relation = "${myFriend.relation}";

//    alert(name+";"+sex+";"+birthday+";"+telephone+";"+qq+";"+hobby+";"+school+";"+education_background+";"+major+";"+address+";"+company+";"+relation);

        });
    </script>
</head>
<body>
<div class="panel panel-default" style="background-image: url('/images/insertBackground.jpg');">
    <div class="panel-heading">
        <h3 class="panel-title">修改friend的数据</h3>
    </div>

    <div style="float: right">
          这个人的兴趣爱好以及其他信息说明展示：<span id="showHobbyAndInfo" ></span>
    </div>

    <div name="myAlert" id="inputSuccessAlert" class="alert alert-success" style="display: none">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>成功！</strong>修改数据成功。
    </div>
    <div name="myAlert" id="inputErrorAlert" class="alert alert-warning" style="display: none;">
        <a href="#" class="close" data-dismiss="alert">&times;</a>
        <strong>警告！</strong>修改数据失败。
    </div>
    <form class="form-horizontal" role="form" style="width: 500px;margin-left: 5%;margin-top: 1%">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">

            </label>

            <div class="col-sm-10">
                <input type="hidden" class="form-control" id="inputSuccess">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                姓名:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" readonly="readonly">
                <span name="error"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                性别:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="sex" readonly="readonly">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                生日:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="birthday">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                电话号码:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="telephone">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                qq:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="qq" readonly="readonly">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                兴趣爱好:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="hobby">
            </div>

        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                学校:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="school">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                教育背景:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="education_background">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                专业:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="major">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                地址:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="address">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                公司:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="company">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="inputSuccess">
                关系:
            </label>

            <div class="col-sm-10">
                <input type="text" class="form-control" id="relation">
            </div>
        </div>
    </form>
    <button type="submit" class="btn btn-default" style="width: 20%;margin-left:10%;margin-top: 1%"
            onclick="submitFriend()">提交
    </button>


</div>

<script type="text/javascript">
    //默认加载数据
    $(function () {
        $("#name").attr("value", name);
        $("#sex").attr("value", sex);
        $("#birthday").attr("value", birthday);
        $("#telephone").attr("value", telephone);
        $("#qq").attr("value", qq);
        $("#hobby").attr("value", hobby);
        $("#school").attr("value", school);
        $("#education_background").attr("value", education_background);
        $("#major").attr("value", major);
        $("#address").attr("value", address);
        $("#company").attr("value", company);
        $("#relation").attr("value", relation);
        $("#showHobbyAndInfo").append(hobby);


    });

    //数据校验
    var dataValidate = function () {
        var inputName = $("#name").val();
        var sex = $("#sex").val();
        var reg = /^[\u4e00-\u9fa5 ]{2,8}$/;         //要求密码需在2-4位之间并且是汉子
        if (!reg.test(inputName)) {
            $("span[name=error]").html("<span style='color: red'>姓名必须是汉子并且在2到4位之间</span>");
            return false;
        }
        else {
            $("span[name=error]").empty();
            return true;
        }
    }

    //数据提交
    var submitFriend = function () {
        if (dataValidate()) {
            //变量定义
            var name = "";
            var sex = "";
            var birthday = "";
            var telephone = "";
            var qq = "";
            var hobby = "";
            var school = "";
            var education_background = "";
            var major = "";
            var address = "";
            var company = "";
            var relation = "";
            name = $("#name").val();
            sex = $("#sex").val();
            birthday = $("#birthday").val();
            telephone = $("#telephone").val();
            qq = $("#qq").val();
            hobby = $("#hobby").val();
            school = $("#school").val();
            education_background = $("#education_background").val();
            major = $("#major").val();
            address = $("#address").val();
            company = $("#company").val();
            relation = $("#relation").val();
            $.ajax({
                type: "post",
                url: "/MyFriendController/updateFriend.do",
                dataType: "json",
                data: {
                    "name": name,
                    "sex": sex,
                    "birthday": birthday,
                    "telephone": telephone,
                    "qq": qq,
                    "hobby": hobby,
                    "address": address,
                    "school": school,
                    "education_background": education_background,
                    "major": major,
                    "company": company,
                    "relation": relation
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                },

                success: function (data) {
                    <%String flag="1";%>
                    //obj = eval("(" + data + ")");//经过springmvc的处理返回的数据已经是json对象了不需要再进行转换了
                    if (data == 1) {
                        alert("修改成功!");
                        top.location.href = "/showMyFriend.jsp";
                        <%--<% if(flag=="1"){response.sendRedirect("toShowMyFriendPage.do");}%>--%>
                    } else {
                        alert("修改失败!" + data);
                    }
                }
            });

        }
    }
</script>
</body>
</html>
