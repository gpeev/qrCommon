<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<title>QR Generator</title>


<h2 class="edit-heading">
    <img src="/images/vcard.png">
    vCard
</h2>
Give your customers all the information they will need to contact you.
<hr>

<form:form class="form-horizontal" id="editvcard"  modelAttribute="vcard"
           action="/myqrs/submitvcard" method="post" enctype="multipart/form-data">

    <div class="control-group">
        <form:label class="control-label" path="name" for="name">Your Name</form:label>
        <div class="controls">
            <form:input type="text" class="span3" path="name"/>
            <form:errors path="name" cssClass="error" />
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="homePhone" path="homePhone">Home Phone</form:label>
        <div class="controls">
            <form:input class="span2" path="homePhone"/>
            <form:errors path="homePhone" cssClass="error" />
            <span class="help-block">ex: 333-333-4444</span>
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="mobilePhone" path="mobilePhone">Mobile Phone</form:label>
        <div class="controls">
            <form:input class="span2" path="mobilePhone"/>
            <form:errors path="mobilePhone" cssClass="error" />
            <span class="help-block">ex: 333-333-4444</span>
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="officePhone" path="officePhone">Office Phone</form:label>
        <div class="controls">
            <form:input class="span2" path="officePhone"/>
            <form:errors path="officePhone" cssClass="error" />
            <span class="help-block">ex: 333-333-4444</span>
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="email" path="email">Email</form:label>
        <div class="controls">
            <form:input class="span2" path="email"/>
            <form:errors path="email" cssClass="error" />
            <span class="help-block">ex: john@smith.com</span>
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="facebookUrl" path="facebookUrl">Your Facebook Page</form:label>
        <div class="controls">
            <form:input class="span6" path="facebookUrl"/>
            <form:errors path="facebookUrl" cssClass="error" />
            <span class="help-block">ex: http://www.facebook.com/pages/Chris-Smith-Realtor/191836142173</span>
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="website" path="website">Website</form:label>
        <div class="controls">
            <form:input class="span6" path="website"/>
            <form:errors path="website" cssClass="error" />
            <span class="help-block">ex: http://www.mywebsite.com</span>
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="companyName" path="companyName">Company Name</form:label>
        <div class="controls">
            <form:input class="span6" path="companyName"/>
            <form:errors path="companyName" cssClass="error" />
        </div>
    </div>
    <div class="control-group">
        <form:label class="control-label" for="companyPhone" path="companyPhone">Company Phone</form:label>
        <div class="controls">
            <form:input class="span6" path="companyPhone"/>
            <form:errors path="companyPhone" cssClass="error" />
            <span class="help-block">ex: 888-888-8888</span>
        </div>
    </div>
    <!--div class="control-group">
        <label class="control-label" for="photo" path="photo">Your Photo</label>
        <div class="controls">
            <input class="input-file" path="photo" type="file" size="1"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="photoCompany" path="photoCompany">Company Photo</label>
        <div class="controls">
            <input class="input-file" path="photoCompany" type="file" size="1"/>
        </div>
    </div-->
    <div class="form-actions">
        <input path="reset-button"  type="reset"  class="btn" value="Reset"/>
        <form:input path="submitButton" type="submit" class="btn btn-primary" value="Save Changes"/>
    </div>
</form:form>

