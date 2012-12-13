<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>List Page</title>

<a href="/qr/deleteAll">Delete All</a>
<br><br>


<c:if test="${qrListBusinessCard!=null}">
    <c:forEach var="bCard" items="${qrListBusinessCard}">

        <div style="border: 1px #dcdcdc solid; padding: 3px; margin-bottom: 4px;" class="alert-message  success span10">



            <div class="span2" style="border: 1px blue solid; padding: 3px;margin: 3px; text-align: center;">
                <a  href="#myModal${bCard.shortCode}" data-toggle="modal">
                    <img src="/qr/img/${bCard.shortCode}/100" alt=""/>
                </a><br>
                <a href="${directUrl}/${bCard.shortCode}" target="_blank" >View</a>
            </div>

                ${bCard}
            <br>
            <br>
            <a href="/qr/prepFinal/${bCard.shortCode}">Edit</a> <br>
            <a href="/qr/delete/${bCard.shortCode}">Delete</a>
            <br>
            <!-- Modal : Start -->
            <div id="myModal${bCard.shortCode}" class="modal hide fade" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true" style="width: 600">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h3 id="myModalLabel">Modal header</h3>
                </div>
                <div class="modal-body">


                    <p>
                    <iframe src="/${bCard.shortCode}" height="650" width="550">
                    </iframe>

                    <br>
                    <br>
                    <br>
                    <br>
                        <strong>${bCard.firstName} ${bCard.lastName}</strong><br/>
                    <address>${bCard.address}</address>
                    <br/>
                        ${bCard.phone} <br/>
                        ${bCard.email} <br/>
                    <a href="/qr/addToContacts/${bCard.shortCode}" class="btn btn-primary">Add to Contacts</a>
                    </p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                    <button class="btn btn-primary">Save changes</button>
                </div>
            </div>
            <!-- Modal : End -->


        </div>
    </c:forEach>
</c:if>