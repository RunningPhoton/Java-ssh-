<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
   String basePath = request.getScheme()+"://"+request.getServerName()
         +":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>" /><!-- 设置基准路径 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/my/list.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script>
	/**
	 * 全选或反选
	 * @param {Object} thisz
	 */
	function checkAll(thisz) {
		//修改复选框的选中状态
		$("input[name=ids]").prop("checked", thisz.checked);
	}
	/**
	 * 添加
	 */
	function add() {
		location.href = "admin/user/useradd.jsp";
	}
	/**
	 * 修改
	 */
	function update() {
		//获得选中记录的数量
		var count = $("input[name=ids]:checked").size();
		//判断是否选中一行记录，修改操作只能选中一行记录
		if (count != 1) {
			alert("请选中一条要修改的记录!");
			return;
		}
		//获得表单对象
		var form = $("#form2").get(0);
		//设置提交路径
		form.action = "userview.html";
		//提交表单
		form.submit();
	}
	/**
	 * 删除
	 */
	function deleting() {
		//获得选中记录的数量
		var count = $("input[name=ids]:checked").size();
		//判断是否选中记录，修改操作可以同时选中多行记录
		if (count < 1) {
			alert("请选中要删除的记录!");
			return;
		}
		//选择确定是否要执行删除操作
		if (confirm("您是否要删除选中的记录？")) {
			//获得表单对象
			var form = $("#form2").get(0);
			//设置提交路径
			form.action = "user!delete.action";
			//提交表单
			form.submit();
		}
	}
</script>
</head>

<body>
	<div id="header">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">用户管理</a></li>
		</ul>
	</div>
	<div id="content">
		<div id="search">
			<form id="form1" name="form1" method="post" action="#">
				<input type="text" name="susername" placeholder="请输入用户名"
					class="input-search" /> <input type="submit" value="搜 索"
					class="btn btn-warning btn-sm" />
			</form>
		</div>
		<div id="datalist">
			<form id="form2" name="form2" method="post" action="">
				<table class="table table-bordered table-hover">
					<tr>
						<th><input type="checkbox" onclick="checkAll(this)" /></th>
						<th>序号</th>
						<th>用户名</th>
						<th>性别</th>
						<th>角色</th>
						<th>邮箱</th>
						<th>联系电话</th>
						<th>出生年月</th>
					</tr>
					<s:iterator id="user" value="#request.list" status="st">
					<tr>
						<td><input type="checkbox" name="ids" value="<s:property value="#user.userId" />" /></td>
						<td><s:property value="#st.count" /></td>
						<td><s:property value="#user.userName" /></td>
						<td><s:property value="#user.userGender" /></td>
						<td><s:property value="#user.userRole" /></td>
						<td><s:property value="#user.userEmail" /></td>
						<td><s:property value="#user.userTelphone" /></td>
						<td><s:date name="#user.userBirthday" format="yyyy年MM月dd日"/></td>
					</tr>
					</s:iterator>
				</table>
			</form>
		</div>
		<div id="btns">
			<input type="button" value="添 加" class="btn btn-primary btn-sm" onclick="add()" /> 
			<input type="button" value="修 改" class="btn btn-success btn-sm" onclick="update()" /> 
			<input type="button" value="删 除" class="btn btn-danger btn-sm" onclick="deleting()" />
		</div>
	</div>
</body>

</html>