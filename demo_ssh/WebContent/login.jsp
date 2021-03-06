<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
   String basePath = request.getScheme()+"://"+request.getServerName()
         +":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CQDX-OA办公管理系统</title>
<!-- 内部文档样式表 -->
<style>
body {
	font-family: "微软雅黑";
	font-size: 12px;
	background-color: #87CEFF;
}

#login {
	position: relative;
	width: 360px;
	/*边框样式*/
	border: solid 10px #FFF;
	border-radius: 10px;
	/*边界样式*/
	margin: 200px auto 0px;
	background-color: rgba(255, 255, 255, 0.7);
}

#login dl dt {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	line-height: 50px;
	color: dodgerblue;
}

#login dl dt span {
	letter-spacing: 2px;
}

#login dl dd {
	margin: 5px 0px;
	text-align: center;
}

.input-size {
	width: 260px;
	height: 26px;
	padding-left: 5px; /* 左部填充 */
	line-height: 26px;
}

.btn-submit {
	width: 270px;
	height: 35px;
	line-height: 30px;
	margin-top: 10px;
	margin-bottom: 10px;
	background-color: dodgerblue;
	border: 0px;
	color: #FFFFFF;
	cursor: pointer;
}

.btn-submit:hover {
	/*background-color: lightgreen;*/
	opacity: 0.6;
}
</style>
</head>
<body>
	<div id="login">
		<form id="form1" name="form1" method="post" action="login.action">
			<dl>
				<dt>
					CQDX-O<span>A办公管理系统</span>
				</dt>
				<dd>
					<input type="text" name="user.userName" placeholder="请输入用户名"
						required="required" autofocus="autofocus" class="input-size" />
				</dd>
				<dd>
					<input type="password" name="user.userPassword" placeholder="请输入密码"
						required="required" class="input-size" />
				</dd>
				<dd style="text-align:center;color:red;">${error }</dd> <%-- ${requestScope.error } --%>
				<dd>
					<input type="submit" value="登 录" class="btn-submit" />
				</dd>
			</dl>
		</form>
	</div>
</body>
</html>
