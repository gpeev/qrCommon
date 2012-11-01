<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><decorator:title /></title>
    <decorator:head />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file="/WEB-INF/view/includes/style.jsp" %>
</head>

<body>

<%@ include file="/WEB-INF/view/includes/header.jsp" %>

<div class="container-fluid">


    <decorator:body />
    <hr>

    <%@ include file="/WEB-INF/view/includes/footer.jsp" %>

</div><!--/.fluid-container-->

<%@ include file="/WEB-INF/view/includes/script.jsp" %>
</body>
</html>
