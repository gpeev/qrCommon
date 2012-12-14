<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>


<div class="container-fluid">
    <div class="row-fluid">
        <div class="span4">
            <!-- Controls -->
            <form:form modelAttribute="preUpdate" action="/qr/prepFinal/submit" method="post">
                <fieldset>
                    <legend><spring:message code="qr.businesscard.legend" /></legend>

                    <tag:input path="title" type="text" readOnly="${false}" placeholder="Unique name" label="Title" />
                    <tag:input path="header" type="text" readOnly="${false}" placeholder="Top part" label="Header" />
                    <tag:input path="footer" type="text" readOnly="${false}" placeholder="Bottom part" label="Footer" />
                    <tag:input path="border" type="text" readOnly="${false}" placeholder="1px black solid" label="Border" />
                    <tag:input path="badge" type="text" readOnly="${false}" placeholder="Unique name" label="Badge" />
                    <tag:input path="url" type="text" readOnly="${false}" placeholder="Unique name" label="URL" />
                    <tag:input path="color" type="text" readOnly="${false}" placeholder="Unique name" label="Color" />

                    <form:input type="hidden" path="shortCode"/>




                    <tag:submitBtns active="false" />


                </fieldset>
            </form:form>





        </div>
        <div class="span4">
            <!--QR Code Preview -->

            <div class="alert alert-info" style="padding: 9px;">
                <div class="alert-block"
                     style="background-color: #ffffff;border: 1px solid #cc6600;-webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;padding: 10px">
                    <center>
                        <font size="4pt">Header Text2</font>
                        <br>
                        <img src="/qr/img/${preUpdate.shortCode}/150" alt="" />
                        <br>

                        <font face="veranda" color="#a9a9a9">${directUrl}/${preUpdate.shortCode}</font>
                        <br>
                        Footer Textccc
                    </center>
                </div>
            </div>


        </div>
        <div class="span4">
            <!--Content Preview -->
        </div>


    </div>
</div>

