<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>QR Generator</title>
</head>
<body>
<form:form modelAttribute="qrdata" action="/qr/generate" method="post">
    <fieldset>
        <legend>QR Generator</legend>
        <p>
            <form:label for="qrText" path="qrText" cssErrorClass="error">
                QR Code String:
            </form:label>
            <form:input path="qrText"/>
            <form:errors path="qrText" cssClass="error"/>
        </p>

        <p>
            <input name="reset" type="reset" value="<spring:message code="global.reset" />"/>
            <input name="submit" type="submit" value="<spring:message code="global.submit" />"/>
        </p>
    </fieldset>
</form:form>




<br>
<br>
<br>

<c:forEach items="${qrlist}" var="qr">
    <a href="/qr/render/<c:out value="${qr.id}"/>"><c:out value="${qr}"/></a><br>
</c:forEach>


</body>
</html>