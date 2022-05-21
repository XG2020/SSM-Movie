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
    <link rel="stylesheet" type="text/css" href="../static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../static/css/main2.css">
    <link rel="stylesheet" type="text/css" href="../static/css/footer.css">
    <script src="../static/js/header.js" charset="utf-8"></script>
    <script src="../static/js/Api.js"></script>

    <script src="../static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="../static/layui/css/layui.css" media="all">
    <title>电影订票-首页</title>
</head>
<body>
    <!-- ----------------------------首页--------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>

    <!-- 占位符 -->
    <div style="margin-top: 100px;"></div>

    <!-- 主体 -->
    <div class="main">
        <div class="main-inner main-page">
            <div class="layui-carousel" id="test3" lay-filter="test4">
                <div carousel-item="">
                    <div>
                        <img src="../static/images/pic1.jpg" onclick="window.location.href='/Movie/jsp/buyTickets.jsp?movie_id=1'">
                    </div>
                    <div>
                        <img src="../static/images/pic2.jpg" onclick="window.location.href='/Movie/jsp/buyTickets.jsp?movie_id=2'">
                    </div>
                    <div>
                        <img src="../static/images/pic3.jpg" onclick="window.location.href='/Movie/jsp/buyTickets.jsp?movie_id=3'">
                    </div>
                    <div>
                        <img src="../static/images/pic4.jpg" onclick="window.location.href='/Movie/jsp/buyTickets.jsp?movie_id=4'">
                    </div>
                    <div>
                        <img src="../static/images/pic5.jpg" onclick="window.location.href='/Movie/jsp/buyTickets.jsp?movie_id=5'">
                    </div>
                </div>
            </div>
            <div class="aside">
                <div class="most-expect-wrapper">
                    <div class="panel">
                        <div class="panel-header">
<%--                            <span class="panel-more">--%>
<%--                              <a href="./movieList.jsp" class="textcolor_orange" data-act="all-mostExpect-click">--%>
<%--                                <span>查看完整榜单</span>--%>
<%--                              </a>--%>
<%--                              <span class="panel-arrow panel-arrow-orange"></span>--%>
<%--                            </span>--%>
                            <span class="panel-title">
                              <span class="textcolor_red">票房排名</span>
                            </span>
                        </div>
                        <div class="panel-content">
                            <ul class="ranking-wrapper ranking-box boxOffice">
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="most-expect-wrapper">
                    <div class="panel">
                        <div class="panel-header">
<%--                            <span class="panel-more">--%>
<%--                              <a href="./movieList.jsp" class="textcolor_orange" data-act="all-mostExpect-click">--%>
<%--                                <span>查看完整榜单</span>--%>
<%--                              </a>--%>
<%--                              <span class="panel-arrow panel-arrow-orange"></span>--%>
<%--                            </span>--%>
                            <span class="panel-title">
                              <span class="textcolor_red">评分排名</span>
                            </span>
                        </div>
                        <div class="panel-content">
                            <ul class="ranking-wrapper ranking-mostExpect" id="sortMovie"></ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="movie-grid">

                <div class="panel-header">
                    <span class="panel-more">
                        <a href="./movieList.jsp" class="textcolor_red" data-act="all-playingMovie-click">
                            <span>全部</span>
                        </a>
                        <span class="panel-arrow panel-arrow-red"></span>
                    </span>
                    <span class="panel-title hot-title">
                    </span>
                </div>
                <div class="panel-content">
                    <ul class="movie-list movie-hot">
                    </ul>
                </div>
                <div class="panel">
                    <span class="panel-more">
                        <a href="./movieList.jsp" class="textcolor_red" data-act="all-upcomingMovie-click">
                            <span>全部</span>
                        </a>
                        <span class="panel-arrow panel-arrow-blue"></span>
                    </span>
                    <span class="panel-title on-title">
                    </span>
                </div>
                <div class="panel-content">
                    <ul class="movie-list movie-on">
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>
    
    <!-- ------------------------------------------------------------------- -->
    <script>
        var clientHeight = document.documentElement.clientHeight;

        window.onload = function(){
            initHostMovie(); //初始化正在热映和即将上映电影
            initHeader();
        }

        //图片轮播
        layui.use(['carousel', 'form'], function(){
            var carousel = layui.carousel, form = layui.form;
            carousel.render({
                elem: '#test3'
                ,width: '100%'
                ,height: '368px'
                ,interval: 5000
            });
        });

        //初始化正在热映和即将上映电影
        function initHostMovie(){
            var MoiveLiHot = $(".movie-hot");
            var MoiveLiOn = $(".movie-on");
            var sortMovie = $("#sortMovie");
            var htmlHot,htmlOn;
            var ListLength;
            var sortMovieList;
            var notice, sale;
            var HotNum = $(".hot-title");
            var OnNum = $(".on-title");

            $.ajax({
                type:'post',
                url: url + "/movie/findAllMovies",
                dataType:'json',
                data: {},
                success:function (obj) {
                    console.log(obj);
                    HotNum.append("<span class=\"textcolor_red\">正在热映（" + obj.data.length + "部）</span>");
                    if(obj.data.length<8){
                        ListLength = obj.data.length;
                    }
                    else{
                        ListLength = 8;
                    }
                    for(var i=0;i<ListLength;i++){
                        htmlHot =
                        "<li>" +
                            "<div class=\"movie-item\">" +
                                "<a href=\"./movieDetail.jsp?movie_id=" +obj.data[i].movie_id + "\" target=\"_blank\" data-act=\"playingMovie-click\" data-val=\"" + obj.data[i].movie_id + "\">" +
                                    "<div class=\"movie-poster\" style=\"cursor:default;\">" +
                                        "<img id=\"moive_picture\" src=\"" + obj.data[i].movie_picture + "\">" +
                                        "<div class=\"movie-overlay movie-overlay-bg\">" +
                                            "<div class=\"movie-info\">" +
                                                "<div class=\"movie-score\"><i id=\"moive_score\" class=\"integer\">" + obj.data[i].movie_score + "</i></div>" +
                                                "<div class=\"movie-title movie-title-padding\" title=\"" + obj.data[i].movie_cn_name + "\">" + obj.data[i].movie_cn_name + "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                "</a>" +
                                "<div class=\"movie-detail movie-detail-strong movie-sale\">" +
                                    "<a href=\"./buyTickets.jsp?movie_id=" + obj.data[i].movie_id + "\" class=\"active\" target=\"_blank\" data-act=\"salePlayingMovie-click\" data-val=\"{movieid:42964}\">购 票</a>" +
                                "</div>" +
                            "</div>" +
                        "</li>";
                        MoiveLiHot.append(htmlHot);
                    }

                    //设置按照评分排名的电影
                    if(obj.sort.length<8){
                        sortMovieList = obj.sort.length;
                    }
                    else{
                        sortMovieList = 8;
                    }
                    var htmlSort='';
                    for(var i=0;i<sortMovieList;i++){
                        var releaseDate = obj.sort[i].releaseDate;
                        if(i == 0){
                            htmlSort =
                                "<li class=\"ranking-item ranking-top ranking-index-1\" onclick=\"window.location.href='./buyTickets.jsp?movie_id="+obj.sort[i].movie_id+"'\">"+
                                "<a target=\"_blank\" data-act=\"mostExpect-movie-click\" data-val=\"{movieid:1229534}\">"+
                                "<div class=\"ranking-top-left\">"+
                                "<i class=\"ranking-top-icon\"></i>"+
                                "<img class=\"ranking-img  default-img\" src="+obj.sort[i].movie_picture+" style='width:140px;height:194px'>"+
                                "</div>"+
                                "<div class=\"ranking-top-right\">"+
                                "<div class=\"ranking-top-right-main\">"+
                                "<span class=\"ranking-top-moive-name\">"+obj.sort[i].movie_cn_name+"</span>"+

                                "<p class=\"ranking-release-time\">上映时间："+datefomate(releaseDate)+"</p>"+

                                "<p class=\"ranking-top-wish\">"+
                                "<span class=\"stonefont\">"+obj.sort[i].movie_score+"</span>分"+
                                "</p>"+
                                "</div>"+
                                "</div>"+
                                "</a>"+
                                "</li>";
                            sortMovie.append(htmlSort);
                            <!--1-->
                        }else if(i == 1){
                            htmlSort = "<li class=\"ranking-item ranking-index-2\" onclick=\"window.location.href='./buyTickets.jsp?movie_id="+obj.sort[i].movie_id+"'\">"+
                                "<a target=\"_blank\" data-act=\"mostExpect-movie-click\" data-val=\"{movieid:346210}\">"+
                                "<i class=\"ranking-index\">2</i>"+
                                "<span class=\"img-link\"><img class=\"ranking-img default-img\" style='width:170px;height:200px' src="+obj.sort[i].movie_picture+"></span>"+
                                "<div class=\"name-link ranking-movie-name\">"+obj.sort[i].movie_cn_name+"</div>"+

                                "<span class=\"ranking-num-info\"><span class=\"stonefont\">"+obj.sort[i].movie_score+"</span>分</span>"+
                                "</a>"+
                                "</li>";
                            sortMovie.append(htmlSort);
                            <!--2-->
                        }else if(i == 2){
                            htmlSort = "<li class=\"ranking-item ranking-index-3\" onclick=\"window.location.href='./buyTickets.jsp?movie_id="+obj.sort[i].movie_id+"'\">"+
                                "<a target=\"_blank\" data-act=\"mostExpect-movie-click\" data-val=\"{movieid:346210}\">"+
                                "<i class=\"ranking-index\">3</i>"+
                                "<span class=\"img-link\"><img class=\"ranking-img default-img\" style='width:170px;height:200px' src="+obj.sort[i].movie_picture+"></span>"+
                                "<div class=\"name-link ranking-movie-name\">"+obj.sort[i].movie_cn_name+"</div>"+

                                "<span class=\"ranking-num-info\"><span class=\"stonefont\">"+obj.sort[i].movie_score+"</span>分</span>"+
                                "</a>"+
                                "</li>";
                            sortMovie.append(htmlSort);
                            <!--3-->
                        }else{
                            htmlSort = "<li class=\"ranking-item ranking-index-"+(i+1)+"\" onclick=\"window.location.href='./buyTickets.jsp?movie_id="+obj.sort[i].movie_id+"'\">"+
                                "<a target=\"_blank\" data-act=\"mostExpect-movie-click\" data-val=\"{movieid:346210}\">"+
                                "<span class=\"normal-link\"><i class=\"ranking-index\">"+(i+1)+"</i>"+
                                "<div class=\"ranking-movie-name\">"+obj.sort[i].movie_cn_name+"</div>"+
                                "<span class=\"ranking-num-info\"><span class=\"stonefont\">"+obj.sort[i].movie_score+"</span>分</span></span>"+
                                "</a>"+
                                "</li>";
                            sortMovie.append(htmlSort);
                        }
                    }


                    OnNum.append("<span class=\"textcolor_blue\">即将上映（" + obj.data1.length + "部）</span>");
                    if(obj.data1.length<8){
                        ListLength = obj.data1.length;
                    }
                    else{
                        ListLength = 8;
                    }
                    for(var i=0;i<ListLength;i++){
                        var random = Math.floor(Math.random(1,10)*50000);
                        htmlOn =
                        "<li>" +
                            "<div class=\"movie-item\">" +
                                "<a href=\"./buyTickets.jsp?movie_id="+ obj.data1[i].movie_id + "\" target=\"_blank\" data-act=\"playingMovie-click\" data-val=\"" + obj.data1[i].movie_id + "\">" +
                                    "<div class=\"movie-poster\" style=\"cursor:default;\">" +
                                        "<img id=\"moive_picture\" src=\"" + obj.data1[i].movie_picture  + "\">" +
                                        "<div class=\"movie-overlay movie-overlay-bg\">" +
                                            "<div class=\"movie-info\">" +
                                                "<div class=\"movie-score\"><i id=\"moive_score\" class=\"integer\">" + obj.data1[i].movie_score + "</i></div>" +
                                                "<div class=\"movie-title movie-title-padding\" title=\"" + obj.data1[i].movie_cn_name + "\">" + obj.data1[i].movie_cn_name + "</div>" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                "</a>" +
                                "<div class=\"movie-detail movie-wish\"><span class=\"stonefont\">" + random + "</span>人想看</div>" +
                                // "<div class=\"movie-detail movie-detail-strong movie-presale\">" +
                                //     "<a id=\"movie-notice\" class=\"movie-presale-sep movie-notice\">预告片</a>" +
                                //     "<a id=\"movie-sale\" class=\"movie-presale-sep movie-sale\">预 售</a>" +
                                // "</div>" +
                            "</div>" +
                        "</li>";
                        MoiveLiOn.append(htmlOn);
                    }
                    notice = $(".movie-on").find(".movie-notice");
                    sale = $(".movie-on").find(".movie-sale");
                    // for(var i=0;i<ListLength;i++){
                    //     notice[i].index = i;
                    //     notice[i].onclick = function(){
                    //         layer.alert('‘' + obj.data1[this.index].movie_cn_name + '’电影暂未有预告片！',{icon: 0,offset: clientHeight/7});
                    //     }
                    //     sale[i].index = i;
                    //     sale[i].onclick = function(){
                    //         layer.alert('预售‘' + obj.data1[this.index].movie_cn_name + '’电影成功！',{icon: 0,offset: clientHeight/7});
                    //     }
                    // }
                    initBoxOffice(obj);
                }
            });
        }


        //设置按票房排名的电影
        function initBoxOffice(obj){
            console.log(obj);
            var TempLength;
            if(obj.sort.length>9){
                TempLength = 9;
            }
            else{
                TempLength = obj.sort.length;
            }
            var BoxOffice = $(".boxOffice");
            for(var i=0;i<TempLength;i++){
                var releaseDate = obj.sort[i].releaseDate;
                if(i==0){
                    BoxOffice.append(
                        "<li class=\"ranking-item ranking-top ranking-index-1\">" +
                            "<a href=\"./movieDetail.jsp?movie_id=" + obj.sort[i].movie_id + "\" target=\"_blank\">" +
                                "<div class=\"ranking-top-left\">" +
                                    "<i class=\"ranking-top-icon\"></i>" +
                                    "<img class=\"ranking-imgs  default-img\" src=\"" + obj.sort[i].movie_picture + "\">" +
                                "</div>" +
                                "<div class=\"ranking-top-right\">" +
                                    "<div class=\"ranking-top-right-main\">" +
                                        "<span class=\"ranking-top-moive-name\">" + obj.sort[i].movie_cn_name + "</span>" +
                                        "<p class=\"ranking-top-wish\">" +
                                            "<span class=\"stonefont\">" + obj.sort[i].movie_boxOffice + "</span>万" +
                                        "</p>" +
                                        "<p class=\"ranking-release-time\">上映时间："+datefomate(releaseDate)+"</p>" +
                                    "</div>" +
                                "</div>" +
                            "</a>" +
                        "</li>"
                    );

                }
                else{
                    BoxOffice.append(
                        "<li class=\"ranking-item ranking-index-4\">" +
                            "<a href=\"./movieDetail.jsp?movie_id=" + obj.sort[i].movie_id + "\" target=\"_blank\">" +
                                "<span class=\"normal-link\">" +
                                    "<i class=\"ranking-index ranking-index-"+(i+1)+"\">" + (i+1) + "</i>" +
                                    "<span class=\"ranking-movie-name\">" + obj.sort[i].movie_cn_name + "</span>" +
                                    "<span class=\"ranking-num-info\">" +
                                        "<span class=\"stonefont\">" + obj.sort[i].movie_boxOffice + "</span>万" +
                                    "</span>" +
                                "</span>" +
                            "</a>" +
                        "</li>"
                    );
                }
            }
        }
        function datefomate(value) {
            if(value==null || value == undefined){
                return "";
            }
            var date = new Date(value);

            Y = date.getFullYear(),
                m = date.getMonth()+1,
                d = date.getDate(),
                H = date.getHours(),
                i = date.getMinutes(),
                s = date.getSeconds();
            return Y+'-'+m+'-'+d;
        };

    </script>
    <!-- ------------------------------------------------------------------- -->
</body>
</html>