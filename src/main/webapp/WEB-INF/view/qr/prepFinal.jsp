<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="container-fluid">
    <div class="row-fluid">
        <div class="span4">
            <!-- Controls -->
            <form class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" for="inputEmail">Title</label>

                    <div class="controls">
                        <input type="text" id="inputEmail" placeholder="Title">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputHeader">Header</label>

                    <div class="controls">
                        <input type="password" id="inputHeader" placeholder="Header">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputFooter">Footer</label>

                    <div class="controls">
                        <input type="password" id="inputFooter" placeholder="Footer">
                    </div>
                </div>
                <div class="control-group">
                    <div class="span3">
                        <input type="checkbox" id="checkBorder"/> Border
                    </div>
                    <div class="span3">
                        <input type="checkbox" id="checkBadge"/> Badge
                    </div>
                    <div class="span3">
                        <input type="checkbox" id="checkUrl"/> URL
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputColor">Color</label>
                    <input type="text" id="inputColor" class="span2"/>

                </div>

                <div class="control-group">
                    <div class="controls">
                        <button type="button" class="btn">Back</button>
                        <button type="button" class="btn btn-success">Save</button>
                    </div>
                </div>
            </form>

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


fName:<c:out value="${qrdata.firstName}"/><br>
lName:<c:out value="${qrdata.lastName}"/><br>

fffffffffffffffffffff
this is prep final


this page changes the boarder, header, footer color of final qr frame and surrounding data.