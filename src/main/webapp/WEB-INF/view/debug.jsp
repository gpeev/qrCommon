<%@ page import="java.util.Enumeration" %>
<%
    System.out.println("=========== Headers ====================");
    Enumeration headers = request.getHeaderNames();
    while (headers.hasMoreElements())
    {
        Object key = headers.nextElement();
        String val = request.getHeader(key.toString());
        System.out.println(key+" : "+val);
    }

    System.out.println("\n\n");
    System.out.println("=========== Attributes ====================");
    Enumeration attrs = request.getAttributeNames();
    while (attrs.hasMoreElements())
    {
        Object key = attrs.nextElement();
        Object val = request.getAttribute(key.toString());
        System.out.println(key+" : "+val);
    }

    System.out.println("\n\n");
    System.out.println("=========== Params ====================");
    Enumeration params = request.getParameterNames();
    while (params.hasMoreElements())
    {
        Object key = params.nextElement();
        String val = request.getParameter(key.toString());
        System.out.println(key+" : "+val);
    }

    System.out.println("\n\n");
    System.out.println("=========== Session Attributes ====================");
    Enumeration sAttrs = session.getAttributeNames();
    while (sAttrs.hasMoreElements())
    {
        Object key = sAttrs.nextElement();
        Object val = session.getAttribute(key.toString());
        System.out.println(key+" : "+val);
    }


%>