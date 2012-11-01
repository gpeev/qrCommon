<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<%
    // <c:set var="email">
    // <sec:authentication property="principal.email"/>
    // </c:set>


    // <c:set var="gravatarHash"
    //value=' DigestUtils.md5Hex(StringEscapeUtils.unescapeXml((String)pageContext.getAttribute("email")).trim().toLowerCase()) >'/>
    // <p>
    //   <spring:message code="header.info"/>

    //<img
    //  src="${pageContext.request.scheme}://
    //<c:choose>
    //   <c:when test="${pageContext.request.scheme == 'http'}">www</c:when>
    //   <c:otherwise>secure</c:otherwise>
    //</c:choose>
    // .gravatar.com/avatar/${gravatarHash}.jpg?s=25&amp;d=identicon&amp;r=pg"
    // alt="<sec:authentication property="principal.displayName" />"/> <sec:authentication
    // property="principal.displayName"/></p>


%>


<div id="nc-navbar" style="display: block; ">
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">

                <!--nav id="top-nav">
                                                        <ul id="utility-menu" class="utility-menu unstyled float hover-links"><li id="menu-item-16508" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-16508"><a href="http://university.monetate.com">University</a></li>
                                                            <li id="menu-item-13343" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13343"><a href="http://monetate.com/jobs/">Jobs</a>
                                                                <ul class="sub-menu">
                                                                    <li id="menu-item-14249" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-14249"><a href="http://monetate.com/jobs/why-work-at-monetate/">Why Work At Monetate?</a></li>
                                                                    <li id="menu-item-14250" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-14250"><a href="http://monetate.com/jobs/open-positions/">Open Positions</a></li>
                                                                    <li id="menu-item-14251" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-14251"><a href="http://monetate.com/jobs/life-at-monetate/">Life at Monetate</a></li>
                                                                    <li id="menu-item-14252" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-14252"><a href="http://monetate.com/jobs/benefits-perks/">Benefits &amp; Perks</a></li>
                                                                </ul>
                                                            </li>
                                                            <li id="menu-item-13342" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-13342"><a href="http://monetate.com/about-monetate/contact-us/">Contact Us</a></li>
                                                            <li id="menu-item-14538" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14538"><a href="https://marketer.monetate.net/control/" onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://marketer.monetate.net']);">Login</a></li>
                                                        </ul>
                                                        <ul id="social-menu" class="social-menu unstyled float"><li id="menu-item-14541" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a target="_blank" href="http://twitter.com/monetate" onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a></li>
                                                            <li id="menu-item-14542" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a target="_blank" href="http://www.linkedin.com/company/monetate-inc./products" onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a></li>
                                                            <li id="menu-item-14543" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a target="_blank" href="http://facebook.com/monetate" onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a></li>
                                                            <li id="menu-item-14545" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a target="_blank" href="http://www.youtube.com/monetate" onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a></li>
                                                            <li id="menu-item-14840" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a target="_blank" href="http://www.slideshare.net/monetate" onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a></li>
                                                            <li id="menu-item-14546" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a target="_blank" href="http://feeds.feedburner.com/monetate" onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS Feed</a></li>
                                                        </ul>
                                                    </nav-->

                <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <!--a id="nb-logo" class="logo brand">NanoTrader</a-->
                <a id="nb-logo2" class="logo2 brand" href="/">peekinsi.de</a>


                <div id="navbar-collapse" class="nav-collapse">
                    <ul class="nav nav-top">
                        <li class="divider-vertical"></li>


                        <sec:authorize access="isAnonymous()">
                            <li <%=isActive("dashboard",request)%>>
                                <a id="nb-dashboard" class="nav-link" href="/myqrs/type">
                                    <span id="nb-dashboard-type" class="icon-ok icon-white"></span>Value
                                </a>
                            </li>
                            <li class="divider-vertical"></li>

                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">

<%!
    public String isActive(String path, HttpServletRequest req)
    {
        String uri = req.getRequestURI();
        return uri.startsWith("/"+path)?"class=\"active\"":"";
    }
%>

                            <li <%=isActive("dashboard",request)%>>
                                <a id="nb-dashboard" class="nav-link" href="/myqrs/dash">
                                    <span id="nb-dashboard-dashboard" class="icon-home icon-white"></span>Dashboard
                                </a>
                            </li>
                            <li class="divider-vertical"></li>
                            <li <%=isActive("myqrs",request)%>>
                                <a id="nb-myqrs" class="nav-link" href="/myqrs">
                                    <span id="nb-myqrs-icon" class="icon-qrcode icon-white"></span>myQRs
                                </a>
                            </li>
                            <li class="divider-vertical"></li>
                            <!--li class="active"-->
                            <li <%=isActive("peeks",request)%>>
                                <a id="nb-peeks" class="nav-link" href="/peeks">
                                    <span id="nb-peeks-icon" class="icon-eye-open icon-white"></span>Peeks
                                </a>
                            </li>
                            <!--
                            profile is part of logged in sub menu
                            li class="divider-vertical"></li>
                            <li <%=isActive("profile",request)%>>
                                <a id="nb-profile" class="nav-link" href="/profile">
                                    <span id="nb-profile-icon" class="icon-file icon-white"></span>Profile
                                </a>
                            </li-->
                            <li class="divider-vertical"></li>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <li <%=isActive("admin",request)%>>
                                    <a id="nb-admin" class="nav-link" href="/admin">
                                        <span id="nb-admin-icon" class="icon-custom icon-trade"></span>Admin
                                    </a>
                                </li>
                                <li class="divider-vertical"></li>
                            </sec:authorize>


                        </sec:authorize>
                    </ul>


                    <div class="navbar-text pull-right">
                        <ul class="nav">
                            <li class="divider-vertical"></li>
                            <li class="dropdown" id="fat-menu">

                                <sec:authorize access="isAnonymous()">
                                    <a class="dropdown-toggle pull-right" data-toggle="dropdown" href="/login">
                                        <span class="icon-custom icon-user"></span>
                                        <span id="nb-login">Login</span>
                                        <!--span class="icon-down-arrow"></span-->
                                    </a>
                                </sec:authorize>
                                <!--
                                todo: make a menu item with Register option.
                                div class="dropdown-menu">
                                    <ul class="dropdown-nav">
                                        <li><a id="register">Register</a></li>
                                        <li></li>
                                        <li><a id="help2">Help</a></li>
                                        <li class="divider"></li>
                                    </ul>
                                </div-->




                                <sec:authorize access="isAuthenticated()">
                                    <a class="dropdown-toggle pull-right" data-toggle="dropdown">
                                        <span class="icon-custom icon-user"></span>
                                        <span id="nb-username">
                                            <sec:authentication property="principal.displayName"/>
                                        </span>
                                        <span class="icon-down-arrow"></span>
                                    </a>
                                </sec:authorize>
                                <div class="dropdown-menu">
                                    <ul class="dropdown-nav">
                                        <li><a id="profile">Profile</a></li>
                                        <li></li>
                                        <li><a id="help">Help</a></li>
                                        <li class="divider"></li>
                                        <li><a id="logout" href="/logout">Logout</a></li>
                                    </ul>
                                </div>



                            </li>
                            <li class="divider-vertical"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

