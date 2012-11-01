<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!-- saved from url=(0060)http://nanotrader.springsource.com/index.html#trade/qAAPL/26 -->
<html lang="en-GB" class="no-js"><!--<![endif]-->
<head>
    <%@ include file="/WEB-INF/view/includes/header.jsp" %>
    <%@ include file="/WEB-INF/view/includes/style.jsp" %>
    <%@ include file="/WEB-INF/view/includes/script.jsp" %>
</head>

<body>

<%@ include file="/WEB-INF/view/includes/topNav.jsp" %>

<%

    //todo - this is to fix the offset problem in the qr generator page
    String requestURI = request.getRequestURI();
    System.out.println("Path:"+requestURI);
    if(requestURI.contains("/myqrs/type"))
    {
        out.print("<br><br><br><br>");
    }



%>

<div class="container page bodyBox" style="border: 1px #000000 solid">
    <decorator:body/>
</div>
<%@ include file="/WEB-INF/view/includes/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/view/includes/modals.jsp" %>
</html>