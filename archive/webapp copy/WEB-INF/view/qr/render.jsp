<%@ page import="java.util.Enumeration" %>
<%@ page import="java.net.InetAddress" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<br>
this is the render page
<br>

<a href="/qr/action/<c:out value="${qrdata.id}" />">
    <img src="/qr/qrimg/<c:out value="${qrdata.id}" />" border="1"/>
</a>

<br>
<br>
<br>

<c:forEach items="${qrlist}" var="qr">
   <a href="/qr/render/<c:out value="${qr.id}"/>"><c:out value="${qr}"/></a><br>
</c:forEach>


<br>
<hr>
<br>



<%

    out.print("Local:"+  InetAddress.getLocalHost().getHostAddress());
    out.print("<br>Remote:"+request.getRemoteAddr());

    String url = request.getScheme()+"://"+request.getServerName();
    String port = request.getServerPort()+"";
    if(port != null && !port.equals("80"))
        url+=":"+port;
    out.print(url+"<br><br>");


    Enumeration headers = request.getHeaderNames();
    out.print("<b>Headers</b><br>");
    while (headers.hasMoreElements())
    {
        String header = (String) headers.nextElement();
        out.println(header+" : "+request.getHeader(header)+"<br>");
    }

    out.print("<br><br>");

    Enumeration atrs = request.getAttributeNames();
    out.print("<b>Attributes</b><br>");
    while (atrs.hasMoreElements())
    {
        String atr = (String) atrs.nextElement();
        out.println(atr+" : "+request.getAttribute(atr)+"<br>");
    }



%>