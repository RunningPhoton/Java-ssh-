<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String basePath = request.getScheme()+"://"+request.getServerName()+":"
            +request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
		<link rel="stylesheet" href="css/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/my/input.css" />
	</head>

	<body>
		<div id="header">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#">我的资料</a></li>
			</ul>
		</div>
		<div id="content">
			<form id="form1" name="form1" method="post" action="myinfo?status=update" target="_top">
				<dl>
					<dt>用户详细资料</dt>
					<dd><span>用户名:</span><input type="text" id="userName" name="userName" class="input" value="${user.userName }" /></dd>
					<dd><span>密码：</span><input type="password" id="passwordA" name="passwordA" class="input" value="${user.userPassword }" /></dd>
					<dd><span>确认密码：</span><input type="password" id="passwordB" name="passwordB" class="input" value="${user.userPassword }" /></dd>
					<dd><span>性别：</span>
						<input type="radio" name="gender" value="男" ${user.userGender=="男"?"checked":"" }  />男
						<input type="radio" name="gender" value="女" class="input-radio" ${user.userGender=="女"?"checked":"" } />女
					</dd>
					<dd><span>角色：</span>
						<select id="role" name="role" class="input">
							<option value="1" ${user.userRole=="1"?"selected":"" }>普通用户</option>
							<option value="2" ${user.userRole=="2"?"selected":"" }>部门经理</option>
							<option value="3" ${user.userRole=="3"?"selected":"" }>系统管理员</option>
						</select>
					</dd>
					<dd><span>出生年月：</span><input type="date" id="birthday" name="birthday" class="input" value="${user.userBirthday }" /></dd>
					<dd><span>邮箱：</span><input type="text" id="email" name="email" class="input" value="${user.userEmail }" /></dd>
					<dd><span>联系电话：</span><input type="text" id="telphone" name="telphone" class="input" value="${user.userTelphone }" /></dd>
					<dd class="btn-groups">
						<input type="submit" value="确 定" class="btn btn-primary btn-sm" />
						<input type="reset" value="取 消" class="btn btn-danger btn-sm" />
					</dd>
				</dl>
			</form>
		</div>
	</body>

</html>