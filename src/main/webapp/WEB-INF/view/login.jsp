<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title><spring:message code="login.title"/></title>


<sec:authorize access="isAnonymous()">
    <h3><spring:message code="login.header"/></h3>

    <c:if test="${not empty error}">
        <p class="error"><spring:message code="login.error"/></p>
    </c:if>

    <p id="userWarning" class="error" style="display:none"><spring:message code="login.nouser"/></p>


    <form class="form-horizontal" id="loginForm" action="/login/submit" method="post">

        <div class="control-group">
            <label class="control-label" for="username">
                <spring:message code="login.label.username"/>
            </label>

            <div class="controls">
                <input type="text" id="username" name="username" value=""/>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="password">
                <spring:message code="login.label.password"/>
            </label>

            <div class="controls">
                <input type="password" id="password" name="password" value=""/>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="remember_me">
                <spring:message code="login.label.remember"/>  <input type="checkbox" name="remember_me" id="remember_me"/>
            </label>
            <div class="controls">

            </div>
        </div>


        <input name="reset" type="reset" value="<spring:message code="global.reset" />" class="btn btn-large"/>
        <input name="submit" type="submit" value="<spring:message code="global.submit" />" class="btn btn-success btn-large"/>

    </form>

    <p><spring:message code="login.create" htmlEscape="false"/></p>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <p><spring:message code="global.logout" htmlEscape="false"/></p>
</sec:authorize>

<script type="text/javascript">
    $(document).ready(function () {
        $("input[name='username']").blur(function () {
            var values = {};
            values['username'] = this.value;

            sendJson(
                    values,
                    '/login/validate',
                    function (result) {
                        if (result.found) {
                            $('#userWarning').hide();
                        } else {
                            $('#userWarning').show();
                        }
                    }
            );
        });
    });
</script>
