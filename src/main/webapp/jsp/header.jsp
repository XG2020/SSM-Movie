<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="../static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="../static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="icon" type="image/x-icon" href="../static/images/logo.ico"/>
    <link rel="stylesheet" type="text/css" href="../static/css/header.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>

    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>电影订票</title>
</head>
<body>
 	<!-- 导航栏 -->
     <div class="header navbar navbar-fixed-top">
        <div class="header-top">
            <div class="header-inner">
                <div class="nav">
                    <ul>
                        <li><a href="./mainPage.jsp">首页</a></li>
                        <li class="active"><a href="./movieList.jsp">电影</a></li>
                    </ul>
                </div>
                <div class="user-info">
                <div class="user-avatar J-login">
                    <ul class="layui-nav" style="background-color: #fff;">
                        <li class="layui-nav-item header-li" style="width:40px;" lay-unselect="" style="width: 40px;">
                        </li>
                    </ul>
                </div>
                </div>
                <%--影片搜索暂未实现--%>
<%--                <form action="">--%>
<%--                    <input id="searchMovie" name="searchMovie" class="search" type="search" maxlength="32" placeholder="电影名、影人、影院" autocomplete="off">--%>
<%--                <input class="submit" type="submit" value="">--%>
<%--                </form>--%>
            </div>
        </div>
    </div>

    <script>
        var clientHeight = document.documentElement.clientHeight;
        window.onload = function(){
            //initHeader1();
        }
        $(function(){
            $('#searchMovie').bind('keypress',function(event){
                if(event.keyCode == "13"){
                    var value=$("#searchMovie").val();
                    window.location.href="../jsp/movieList.jsp?searchMovie="+value;
                }
            })

        });


    </script>
</body>
</html>