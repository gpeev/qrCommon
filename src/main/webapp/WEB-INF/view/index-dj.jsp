<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title><spring:message code="index.title"/></title>

<body>

<!--
<sec:authorize access="isAnonymous()">
    <p><spring:message code="global.login" htmlEscape="false"/></p>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <p><spring:message code="global.logout" htmlEscape="false"/></p>
</sec:authorize>
-->

<!--p>
    Server: <%= application.getServerInfo() %><br/>
    Servlet Specification: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %><br/>
    JSP Version: <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
</p-->

<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3 well">
            <%@ include file="/WEB-INF/view/includes/djNav.jsp" %>
        </div>
        <div class="span6 row-fluid hero-unit">
            <div class="alert alert-info span12" align="center">
                <img src="http://chart.apis.google.com/chart?chs=440x207&cht=lxy&chco=3072F3&chds=0,98.333,0,100&chd=t:-1|35.786,37.131,44.177,45.402,55.15,60.261,66.552,68.333,70.317,68.28,64.675,57.912,58.07,51.207,57.429,52.137,53.491,59.528,66.298,75.191,73.941,73.67,68.234,66.252,67.637,66.516,68.015&chdl=Likes&chdlp=l&chg=20,20,0,5&chls=4,12,6&chma=0,5,5,25|0,9&chtt=Facebook&chts=000000,18.167" width="440" height="207" alt="Facebook" style="border: 1px #000000 solid"/><br><br>
                <img src="http://chart.apis.google.com/chart?chf=a,s,000000A5|bg,s,FFFFFF&chbh=a,8,9&chs=319x207&cht=bvs&chco=FF0000&chd=t:29.045,28.04,35.998,39.229,39.816,41.874,47.56,45.151,51.494,45.907,47.37,49.543,51.73,45.589,44.147,46.36,43.21,50.271,47.627,51.345,59.7,60.843,58.658&chdl=Followers&chdlp=l&chg=20,20,0,5&chma=0,0,3|0,9&chtt=Twitter&chts=000000,18.167" width="430" height="207" alt="Twitter" style="border: 1px #000000 solid" /><br><br>
                <img src="http://chart.apis.google.com/chart?chxl=0:|Jan|Feb|Mar|Jun|Jul|Aug|1:|0|50|100&chxr=1,0,96.667&chxs=0,676767,11.5,-0.333,l,676767|1,676767,11.833,-0.667,l,676767&chxt=x,y&chs=440x207&cht=lc&chd=s:AA,PTYcgZWYYbdgaZcinlml&chg=20,50&chls=0.75,-1,-1|2,4,1&chma=0,0,0,4|0,8&chm=o,0000FF,1,-2,8|b,3399CC44,0,1,0&chtt=Google&chts=000000,18.167" width="440" height="207" alt="Google" style="border: 1px #000000 solid"/>
            </div>
        </div>
        <div class="span3 well sidebar-nav">
            right col<!--Sidebar content-->
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span6 well sidebar-nav">
                left col<!--Sidebar content-->
            </div>
            <div class="span6 well sidebar-nav">
                right col<!--Sidebar content-->
            </div>
        </div>
    </div>


</body>
