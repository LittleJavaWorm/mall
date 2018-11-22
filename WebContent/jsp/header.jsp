<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 页头 -->

<!-- 最顶部容器,分三块：网站标识，承诺图片，登录、注册等按钮 -->
<div class="container-fluid">
	<!-- 网站标识占4列 -->
	<div class="col-md-4">
		<img src="../images/registerAndLogin/logo.png">
	</div>
	
	<!-- 承诺图片占5列 -->
	<div class="col-md-5">
		<img src="../images/registerAndLogin/header.jpg">
	</div>
	
	<!-- 按钮占3列 ,元素的上内边距为：20px -->
	<div class="col-md-3" style="padding-top: 20px">
		<!-- 按钮以有序列表展示,并且列表元素在一行-->
		<!-- 需要判断是否已有用户登录，已登录显示：欢迎xxx 注销 ...；未登录显示：登录 注册 ... -->
		<!-- 注：test="${user1==null }" 写为test="${user1==null} "  不会进when -->
		<ol class="list-inline">
			<c:choose>
				<c:when test="${user1==null }">
					<li><a href="login.jsp">登录</a></li>
					<li><a href="register.jsp">注册</a></li>
				</c:when>
				<c:otherwise>
					<li>欢迎，<a><span style="color: blue">${user1.name}</span> </a></li>
					<li><a>注销</a></li>
				</c:otherwise>
			</c:choose>
			<li><a>购物车</a></li>
			<li><a>注销</a></li>
		</ol>
	</div>
</div>

<!-- 导航条，包含：导航分类，搜索框与搜索按钮-->
<div class="container-fluid">
	<!-- <div class="navbar navbar-inverse" role="navigation"> -->
	<div class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- 导航条头部 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">首页</a>
			</div>
			
			<!-- 导航目录，搜索框 -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<!-- 导航条商品分类 -->
				<ul class="nav navbar-nav" id="category">
			        <li class="active"><a href="#">Link</a></li>
			        <li><a href="#">Link</a></li>
			        <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
			          		Dropdown <span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <li><a href="#">Action</a></li>
			            <li><a href="#">Another action</a></li>
			            <li><a href="#">Something else here</a></li>
			            <li class="divider"></li>
			            <li><a href="#">Separated link</a></li>
			            <li class="divider"></li>
			            <li><a href="#">One more separated link</a></li>
			          </ul>
			        </li>
	        	</ul>
	        	<!-- 搜索 -->
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
		</div>
	</div>
</div>

