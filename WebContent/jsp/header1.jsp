<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 页面头部信息 -->

<html>
<head></head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>会员注册</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<!-- <link rel="stylesheet" href="../css/style.css" type="text/css" /> -->

<!-- <style>
	body {
		margin-top: 20px;
		margin: 0 auto;
	}
	
	.carousel-inner .item img {
		width: 100%;
		height: 300px;
	}
	
	font {
		color: #3164af;
		font-size: 18px;
		font-weight: normal;
		padding: 0 10px;
	}
</style> -->
</head>
<body>

<div class="container-fluid">
	<div class="col-md-4">
		<img src="../images/logo2.png" />
	</div>
	<div class="col-md-5">
		<img src="../images/header.png" />
	</div>
	<div class="col-md-3" style="padding-top:20px">
		<ol class="list-inline">
		   <c:choose>
		     <c:when test="${user==null }">
				<li><a href="login.jsp">登录</a></li>
				<li><a href="register.jsp">注册</a></li>
		     </c:when>
		     <c:otherwise>
				<li>欢迎<span style="color:red">${user.name }</span></li>
				<li><a href="#">注销</a></li>
		     </c:otherwise>
		   </c:choose>
			<li><a href="cart.jsp">购物车</a></li>
			<li><a href="order?method=orderlist">我的订单</a></li>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="category">
				</ul>
				<form class="navbar-form navbar-right" role="search" action="product?method=showByCategory&cid=${cid }" method="post">
					<div class="form-group">
						<input type="text" name="pname" class="form-control" value="${pname }" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">查询</button>
				</form>
			</div>
		</div>
	</nav>
</div>

</body>

<!-- 从数据库中查询所有商品分类列表 -->
<script type="text/javascript">
  $.post("category",{"method":"findAll"},function(data){
	  //data.length
	  var info;
	  for (var i = 0; i < data.length; i++) {
		info+="<li><a href='product?method=showByCategory&cid="+data[i].cid+"'>"+data[i].cname+"</a><li>";
	}
	$("#category").html(info);
	  
  },"json");
  
</script>

</html>





