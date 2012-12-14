<%@ tag body-content="tagdependent" isELIgnored="false" %>
<%@ attribute name="readOnly" required="true" %>
<%@ attribute name="path" required="true" %>
<%@ attribute name="type" required="false" %>
<%@ attribute name="placeholder" required="true" %>
<%@ attribute name="label" required="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:if test="${empty type}">
    <c:set var="type" value="text" scope="page"/>
</c:if>

<spring:bind path="${path}">
    <c:choose>
        <c:when test="${readOnly}">
            <span class="readOnly">${status.value}</span>
        </c:when>
        <c:otherwise>
            <div class="control-group">
                <form:label for="${path}" path="${path}" cssErrorClass="error">
                    ${label}
                </form:label>
                <div class="controls">
                    <form:input path="${path}" placeholder="${placeholder}" id="${status.expression}" name="${status.expression}" value="${status.value}"/>
                    <form:errors path="${path}" cssClass="error"/>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</spring:bind>