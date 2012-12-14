<%@ tag body-content="tagdependent" isELIgnored="false" %>
<%@ attribute name="active" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:choose>
    <c:when test="${!active}">
        <c:set var="turnOff" value="disable=\"true\"" scope="page"/>
        <span class="readOnly">${status.value}</span>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>
<div class="control-group">
    <div class="controls">
        <button type="reset" class="btn" ${turnOff}>Back</button>
        <button type="submit" class="btn btn-success" ${turnOff}>Save</button>
    </div>
</div>