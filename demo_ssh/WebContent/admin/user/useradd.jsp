<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
   String basePath = request.getScheme()+"://"+request.getServerName()
         +":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>" /><!-- 设置基准路径 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="css/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/my/input.css" />
</head>
<body>
	<div id="header">
		<ul class="nav nav-tabs">
			<li class="active"><a href="userlist.html">用户管理</a></li>
		</ul>
	</div>
	<div id="content">
		<form id="form1" name="form1" method="post" action="user!add.action">
			<dl>
				<dt>添加用户信息</dt>
				<!-- 表单要有name属性才会提交到服务器！！！ -->
				<dd>
					<span>用户名:</span><input type="text" id="userName" name="user.userName"
						class="input" required="required" autofocus="autofocus" />
				</dd>
				<dd>
					<span>密码：</span><input type="password" id="passwordA"
						name="user.userPassword" class="input" required="required"/>
				</dd>
				<dd>
					<span>确认密码：</span><input type="password" id="passwordB"
						class="input" required="required"/>
				</dd>
				<dd>
					<span>性别：</span> <input type="radio" name="user.userGender" value="男"
						checked="checked" />男 <input type="radio" name="user.userGender" value="女"
						class="input-radio" />女
				</dd>
				<dd>
					<span>角色：</span> <select id="role" name="user.userRole" class="input">
						<option value="1">普通用户</option>
						<option value="2">部门经理</option>
						<option value="3">系统管理员</option>
					</select>
				</dd>
				<dd>
					<span>出生年月：</span><input type="date" id="birthday" name="user.userBirthday"
						class="input" />
				</dd>
				<dd>
					<span>邮箱：</span><input type="text" id="email" name="user.userEmail"
						class="input" />
				</dd>
				<dd>
					<span>联系电话：</span><input type="text" id="telphone" name="user.userTelphone"
						class="input" />
				</dd>
				<dd class="btn-groups">
					<input type="submit" value="确 定" class="btn btn-primary btn-sm" />
					<input type="reset" value="取 消" class="btn btn-danger btn-sm" />
				</dd>
			</dl>
		</form>
	</div>
</body>
</html>
