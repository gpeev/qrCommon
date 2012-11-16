<%@ page isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form modelAttribute="businesscard" action="/qr/businessCard/submit" method="post">
    <fieldset>
        <legend><spring:message code="qr.businesscard.legend" /></legend>
        <p>
            <form:label for="firstName" path="firstName" cssErrorClass="error">
                <spring:message code="qr.businesscard.firstName" />
            </form:label>
            <form:input path="firstName" />
            <form:errors path="firstName" cssClass="error" />
        </p>

        <p>
            <form:label for="lastName" path="lastName" cssErrorClass="error">
                <spring:message code="qr.businesscard.lastName" />
            </form:label>
            <form:input path="lastName" />
            <form:errors path="lastName" cssClass="error" />
        </p>

        <p>
            <input name="reset" type="reset" value="<spring:message code="global.reset" />" />
            <input name="submit" type="submit" value="<spring:message code="global.submit" />" />
        </p>
    </fieldset>
</form:form>