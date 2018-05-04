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
	<body>
	    <!-- Code Starts Here-->
	    <div class="container1 selectWidth50">
	      <div id="alertBox">
	        <div class="alertboxContent">
	          <div class="spacer1"></div>
	          <div>
	          	Unable to login, <br>
	            please try again.
	          </div>
	          <div class="spacer2"></div>
	          <div>
	            <input type="submit" value="OK" class="alertButtonblue">
	          </div>
	          <div class="clear"></div>
	          <div class="spacer1"></div>
	        </div>
	      </div>
	    </div>
	    <!-- Code Ends Here-->
	
	</body>
	</form:form>
</body>
</html>