<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- width:可视区域的宽度，值可为数字或关键词device-width -->
<!-- intial-scale:页面首次被显示是可视区域的缩放级别，取值1.0则页面按实际尺寸显示，无任何缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
<style>
	body {
		margin-top: 20px;
		margin: 0 auto;
	}
	font {
		color: #3164af;
		font-size: 18px;
		font-weight: normal;
		padding: 0 10px;
	}
</style>

</head>
<body>

	<!-- 引入同级的header.jsp文件  -->
	<%@include file="header.jsp"%>
	
	<!-- 注册页面主体,为bootstrap的容器 ;样式：宽度占页面100%，背景为图片-->
	<!-- 在url(path)里的这个path(图片路径)。原来它是相对于.css文件所在的文件夹，也就是调用css文件夹下的子文件夹来获取路径地址， -->
	<div class="container" style="width: 100%; background: url('../images/registerAndLogin/regist_bg.jpg');">
		<!-- 大容器下面的小容器，并且里面的元素排成一行 -->
		<div class="row">
			<!-- 前2列空白，3-8列为表单，最后2列为空白（总共12列） -->
			
			<!-- 2列空白 -->
			<div class="col-md-2"></div>
			
			<!-- 8列为表单,表单外边距为5px -->
			<div class="col-md-8" style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<font>会员注册</font>USER REGISTER
				<form class="form-horizontal" style="margin-top: 5px;" action="${pageContext.request.contextPath}/RegisterServlet?method=regist" method="post">
					<!-- 表单里面为：用户名，密码，电话等等 -->
					<div class="form-group">
						<!-- 每个元素分别占 2、6列 -->
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username" name="username"
								placeholder="请输入用户名">
						</div>
					</div>
					
					<!-- 密码 -->
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="inputPassword3" name="password"
								placeholder="请输入密码">
						</div>
					</div>
					
					<!-- 确认密码 -->
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="confirmpwd" name="confirmpwd"
								placeholder="请输入确认密码">
						</div>
					</div>
					
					<!-- 手机 -->
					<div class="form-group">
						<label for="tel" class="col-sm-2 control-label">手机</label>
						<div class="col-sm-6">
							<input type="tel" class="form-control" id="tel" name="telephone"
									placeholder="请输入手机号">
						</div>
					</div>
					
					<!-- 电子邮箱 -->
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3" name="email"
								placeholder="Email">
						</div>
					</div>
					
					<!-- 姓名 -->
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="usercaption" name="name"
								placeholder="请输入姓名">
						</div>
					</div>
					
					<!-- 性别 -->
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<label class="radio-inline"> <input type="radio"
								name="sex" id="inlineRadio1" value="man">
								男
							</label> <label class="radio-inline"> <input type="radio"
								name="sex" id="inlineRadio2" value="women">
								女
							</label>
						</div>
					</div>
					
					<!-- 出生日期 -->
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-6">
							<input type="date" class="form-control" name="birthday">
						</div>
					</div>
					
					<!-- 验证码 -->
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="verificationCode" id="verification">
						</div>
						<div class="col-sm-2">
							<button  class="btn btn-default"  id="btn_msg" type="button" onclick="sendMsg()">发送验证码</button>
						</div>
					</div>
					
					<!-- 提示信息 -->
					<div class="form-group">
						<p id="info"></p>
					</div>
					
					<!-- 注册按钮 -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册" name="submit"  id="submit" 
								style="background: url('../images/registerAndLogin/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
						</div>
					</div>
				</form>
			</div>
			
			<!-- 最后两列为空白 -->
			<div class="col-md-2"></div>
		</div>
		
		<!-- 引入页脚footer.jsp -->
		<%@include file="footer.jsp" %>
	</div>
	

</body>
</html>