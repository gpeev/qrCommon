<%@ page import="java.util.Enumeration" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<c:if test="${vcard!=null}">

    <a target="_blank" href="/myqrs/action/VCARD/<c:out value="${vcard.id}" />">
        <img src="/myqrs/qrimg/VCARD/<c:out value="${vcard.id}" />" border="1" width="450px"/>
    </a>


</c:if>
<br>

<hr>
<br>


Target Encoded Content: <c:out value="${qrdata.qrText}"/>
<br>

<%


    // out.print("Local:"+  InetAddress.getLocalHost().getHostAddress());
    // out.print("<br>Remote:"+request.getRemoteAddr());

    String url = request.getScheme() + "://" + request.getServerName();
    String port = request.getServerPort() + "";
    if(port != null && !port.equals("80")) url += ":" + port;
    // out.print(url+"<br><br>");


    Enumeration headers = request.getHeaderNames();
    //  out.print("<b>Headers</b><br>");
    while (headers.hasMoreElements())
    {
        String header = (String) headers.nextElement();
        //     out.println(header+" : "+request.getHeader(header)+"<br>");
    }

    // out.print("<br><br>");

    Enumeration atrs = request.getAttributeNames();
    // out.print("<b>Attributes</b><br>");
    while (atrs.hasMoreElements())
    {
        String atr = (String) atrs.nextElement();
        //   out.println(atr+" : "+request.getAttribute(atr)+"<br>");
    }


%>