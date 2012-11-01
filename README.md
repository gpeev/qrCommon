qrCommon
========

Increase heap size
 export MAVEN_OPTS=-Xmx512m
  mvn war:exploded tomcat7:run




http://i0.wp.com/peekinsi.de/images/s/scan-page-picture-default-portrait.png

http://tomcat.apache.org/maven-plugin-2.0-SNAPSHOT/


create qrText
    -text
    -url
    -phone number
    -email
    -vCard || meCard
    -WiFi Access [andriod only]

add qrText to dB - return a [uniqueId]
create a [shortUrl] redirect with [uniqueId]
create [qrCode] based on [shortUrl]

accessing the qrCode will take user to shortUrl which then will redirect to the content.


{"status":"success","response":{"id":"scn-012ab121-9f3f-4552-a46d-a0f9b85d9883","shortReference":"x9pdz9","optionsString":"W10=","croppedPictureUrl":null}}




...n-left':'-18px', 'padding-left':'18px'})if($('#personalScanPageProfilePictureUrl



Twitter - Gets the followers.
https://api.twitter.com/1/users/show.json?screen_name=gpeev&include_entities=true
https://api.twitter.com/1/users/show.json?screen_name=davidguetta&include_entities=true


https://si0.twimg.com/profile_background_images/290955473/Twitter.jpg
http://a0.twimg.com/profile_images/1445376527/david-guetta-nothing-but-the-beat-cover_normal.jpg
https://si0.twimg.com/profile_images/1445376527/david-guetta-nothing-but-the-beat-cover_normal.jpg
https://si0.twimg.com/brand_banners/davidguetta/1344822644/live
davidguetta


Facebook Data
https://graph.facebook.com/DavidGuetta



https://api.twitter.com/1/followers/ids.json?cursor=-1&screen_name=davidguetta
https://api.twitter.com/1/account/totals.json?screen_name=davidguetta
http://twitter.com/AdamFreemer
http://twitter.com/davidguetta



register/activate/b6f06036359099e72eaf3a5cbdf7a4ff8a7520e43637be82df2e5c0edf4d45fc





<form:form modelAttribute="qrdata" action="/myqrs/generate" method="post">
    <fieldset>
        <legend>QR Generator</legend>
        <p>
            <form:label for="qrText" path="qrText" cssErrorClass="error">
                String 2 Encode:
            </form:label>
            <form:input path="qrText"/>
            <form:errors path="qrText" cssClass="error"/>
        </p>

        <p>
            <input name="reset" type="reset" value="<spring:message code="global.reset" />"/>
            <input name="submit" type="submit" value="<spring:message code="global.submit" />"/>
        </p>
    </fieldset>
</form:form>


<br>
<br>
<b>Previously Encoded</b><br>
<c:forEach items="${qrlist}" var="qr">
    <a href="/myqrs/render/<c:out value="${qr.id}"/>"><c:out value="${qr}"/></a><br>
</c:forEach>



--------------
features
<div class="features-container">
    <div class="row-fluid">
        <div class="span6">
            <h2>
                <img src="/images/viewstack.png">
                Unlimited
            </h2>
            <dl>
                <dt>Unlimited Scans</dt>
                <dd>
                    <p>There is no limit to how many customers you can reach with your signs. Never again
                        worry about filling up empty flyer boxes with expensive color leaflets.</p>
                </dd>
                <dt>Unlimited Time</dt>
                <dd>
                    <p>You will never need to make sure your listing needs to be renewed. Your property
                        listings never expire.</p>
                </dd>
                <dt>Unlimited Edits</dt>
                <dd>
                    <p>Instantly change the price or description for a property at any time. No extra
                        charge.</p>
                </dd>
            </dl>
        </div>
        <div class="span6">
            <h2>
                <img src="/images/iphone.png">
                Mobile
            </h2>
            <dl>
                <dt>Mobile Anytime</dt>
                <dd>
                    <p>Cutsomers can scan your sign anytime. Your listings were optimized for mobile and oh
                        do they look good doing it.</p>
                </dd>
                <dt>Mobile Anywhere</dt>
                <dd>
                    <p>They can pull up your listings anywhere. Your listings look excellent on phones,
                        tablets, laptops, and even desktops.</p>
                </dd>
                <dt>Mobile Anyhow</dt>
                <dd>
                    <p>Any customer with a smart phone can see your listing. iPhone, Android, Windows Phone,
                        it doesn't matter.</p>
                </dd>
            </dl>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <h2>
                <img src="/images/twitter.png">
                Social
            </h2>
            <dl>
                <dt>Social for You</dt>
                <dd>
                    <p>You can easily share your listings on your Facebook and Twitter pages.</p>
                </dd>
                <dt>Social for Them</dt>
                <dd>
                    <p>Customers can also easily share your listings on their Facebook and Twitter
                        pages.</p>
                </dd>
            </dl>
        </div>
        <div class="span6">
            <h2>
                <img src="/images/comments.png">
                Exciting
            </h2>
            <dl>
                <dt>Exciting Listings</dt>
                <dd>
                    <p>Your clean and effective listings will get you leads you otherwise may have
                        missed.</p>
                </dd>
                <dt>Exciting Photos</dt>
                <dd>
                    <p>Cutstomers will love looking at your up to 20 property photos.</p>
                </dd>
            </dl>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <h2>
                <img src="/images/analytics.png" width="32px">
                Analytics
            </h2>
            <dl>
                <dt>Real-time</dt>
                <dd>
                    <p>No more guessing at the interest.</p>
                </dd>
                <dt>Charting</dt>
                <dd>
                    <p>Advanced reports detail when and how your listing is consumed.</p>
                </dd>
            </dl>
        </div>
        <div class="span6">
            <h2>
                <img src="/images/free-icon.jpeg" width="32">
                FREE
            </h2>
            <dl>
                <dt>You pay nothing</dt>
                <dd>
                    <p>All of these capabilities for nothing.</p>
                </dd>
                <dt></dt>
                <dd>
                    <p></p>
                </dd>
            </dl>
        </div>
    </div>


    <%
        String vCardLink = "/login";
        String listingLink = "/login";
    %>

    <sec:authorize access="isAuthenticated()">

        <%
            vCardLink = "/myqrs/vcardcreate";
            listingLink = "/myqrs/listingCreate";
        %>
        <!--div class="row-fluid">
        <div class="span6 center-text">
        <p class="pull-right">
        <a class="btn btn-success btn-large" href="/myqrs/vCardCreate">
        <strong>Create a Virtual Business Card - It's FREE</strong>
        </a>
        </p>
        </div>
        <div class="span6 center-text">
        <p>
        <a class="btn btn-info btn-large" href="/myqrs/listingCreate">
        <strong>Create a Virtual Listing - It's FREE</strong>
        </a>
        </p>
        </div>

        </div-->

    </sec:authorize>


    <sec:authorize access="isAnonymous()">


    </sec:authorize>
    <div class="row-fluid">
        <div class="span6 center-text">
            <p class="pull-right">
                <a class="btn btn-success btn-large" href="<%=vCardLink%>">
                    <img src="/images/vcard.png"/>
                    <strong>Create a Virtual Business Card - It's FREE</strong>
                </a>
            </p>
        </div>
        <div class="span6 center-text">
            <p>
                <a class="btn btn-info btn-large" href="<%=listingLink%>">
                    <img src="/images/qrsign.png"/>
                    <strong>Create a Virtual Listing2 - It's FREE</strong>

                </a>
            </p>
        </div>

    </div>


</div>




