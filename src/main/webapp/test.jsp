<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>用户注销测试</h2>
	<form action="user_logout.action" method="post">
		token:<input name="token" type="text"/>
		<input type="submit" value="提交"/>
	</form>
<hr/>
<hr/>
<br/>
<h2>用户注册测试</h2>
	<form action="user_register.action" method="post">
		tel:<input name="tel" type="text"/>
		<input type="submit" value="提交"/>
	</form>
<hr/>
<hr/>
<br/>
	
<h2>用户登入测试</h2>
	<form action="user_login.action" method="post">
		tel:<input name="tel" type="text"/>
		password:<input name="password" type="post"/>
		<input type="submit" value="提交"/>
	</form>
	
<h2>用户手机登入测试</h2>
	<form action="user_loginByTel.action" method="post">
		tel:<input name="tel" type="text"/>
		<input type="submit" value="提交"/>
	</form>
<hr/>
<hr/>
<br/>

<h2>用户修改测试</h2>
	<form action="user_updateUser.action" method="post">
		token:<input name="token" type="text"/>
		userId:<input name="userId" type="text"/>
		password:<input name="password" type="text"/>
		username:<input name="username" type="text"/>
		type:<input name="type" type="text"/>
		<input type="submit" value="提交"/>
	</form>
	
<hr/>
<hr/>
<br/>
<h2>用户名是否存在测试</h2>
	<form action="user_nameIsExist.action" method="post">
		username:<input name="username" type="text"/>
		<input type="submit" value="提交"/>
	</form>

<hr/>
<hr/>
<br/>
<h2>添加订单测试</h2>

	<form action="userorder_add.action" method="post">
		token:<input name="token" type="text"/>
		userId:<input name="userId" type="text"/>
		shipAddress:<input name="shipAddress" type="text"/>
		shipName:<input name="shipName" type="text"/>
		shipTel:<input name="shipTel" type="text"/>
		receiveAddress:<input name="receiveAddress" type="text"/>
		receiveName:<input name="receiveName" type="text"/>
		receiveTel:<input name="receiveTel" type="text"/>
		payment:<input name="payment" type="text"/>
		remark:<input name="remark" type="text"/>
		state:<input name="state" type="text"/>
		<input type="submit" value="提交"/>
	</form>

<hr/>
<hr/>
<br/>
<h2>查询订单测试</h2>

	<form action="userorder_query.action" method="post">
		token:<input name="token" type="text"/>
		userId:<input name="userId" type="text"/>
		state:<input name="state" type="text"/>
		<input type="submit" value="提交"/>
	</form>
	
<hr/>
<hr/>
<br/>
<h2>修改用户订单状态测试</h2>

	<form action="userorder_updateState.action" method="post">
		token:<input name="token" type="text"/>
		userOrderId:<input name="userOrderId" type="text"/>
		state:<input name="state" type="text"/>
		<input type="submit" value="提交"/>
	</form>	
	
<hr/>
<hr/>
<br/>
<h2>修改用户订单状态测试</h2>

	<form action="userorder_cancelOrder.action" method="post">
		token:<input name="token" type="text"/>
		userOrderId:<input name="userOrderId" type="text"/>
		<input type="submit" value="提交"/>
	</form>	
	
</body>
</html>