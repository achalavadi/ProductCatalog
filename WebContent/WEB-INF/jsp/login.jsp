<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, target-densityDpi=device-dpi, user-scalable=no" />
<title>OPUS MOBILE</title>
<spring:url value="/resources/OM.css" var="omCSS"/>
<link href="${omCSS}" rel="stylesheet" />
</head>
<body>
	<form:form name="submitForm" method="POST">
		<div align="center">

			<div class="container3">
				<div class="loginForm ">
					<div class="selectWidth95">
						<input name="userName" id="userName" type="text"	class="inputboxBg" size="15" maxlength="15" placeholder="ATTUID">
					</div>
					<div class="spacer1"></div>
					<div class="selectWidth95">
						<input name="password" type="password" class="inputboxBg" placeholder="Password">
					</div>
					<div class="container alignCenter">
						<span class="floatLeft marginTop15"> <a href="#"
							title="Login Information">
								<button class="roundedButtoninfo" type="button" align="top">
								</button>
						</a>
						</span> <input class="loginButtonblue" id="" type="submit"
							value=" Login " />
					</div>
					<div style="color: red">${error}</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>