<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户登录</title>
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
		color: #666;
		font-size: 22px;
		font-weight: normal;
		padding-right: 17px;
	}
</style>
</head>
<body>

<%@include file="header.jsp" %>

	<div class="container"
		style="width: 100%; height: 460px; background: #FF2C4C url('../images/registerAndLogin/loginbg.jpg') no-repeat;">
		<div class="row">
			<!-- 7列空白 -->
			<div class="col-md-7"></div>
			
			<!-- 5列表单 ，border-radius弧度 5px -->
			<div class="col-md-5">
				<div style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: #fff;">
					<font>会员登录</font>USER LOGIN
					<div>&nbsp;</div>
					
					<!-- 表单 -->
					<form class="form-horizontal" action="user?method=login"
						method="post">
						
						<!-- 用户名 -->
						<div class="form-group">
							<!-- control-label: 标签样式 -->
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<input type="text" name="username" class="form-control"
									id="username" placeholder="请输入用户名">
							</div>
						</div>
						
						<!-- 密码 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6">
								<input type="password" name="password" class="form-control"
									id="inputPassword3" placeholder="请输入密码">
							</div>
						</div>
						
						<!-- 格式错误提示信息 -->
						<span style="color: red">${fail }</span>
						
						<!-- 验证码 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="inputPassword3"
									placeholder="请输入验证码">
							</div>
							<div class="col-sm-3">
								<img src="./images/registerAndLogin/captcha.jhtml" />
							</div>
						</div>
						
						<!-- 是否自动登录，是否记住用户名 -->
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"> 自动登录
									</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
										type="checkbox"> 记住用户名
									</label>
								</div>
							</div>
						</div>
						
						<!-- 登录按钮 -->
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" width="100" value="登录" name="submit"
									style="background: url('../images/registerAndLogin/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<%@include file="footer.jsp" %>

</body>
</html>