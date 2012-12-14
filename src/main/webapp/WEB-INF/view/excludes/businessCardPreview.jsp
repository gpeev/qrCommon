<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--@include file="../debug.jsp"--%>
<!DOCTYPE html>
<html class="ui-mobile">
<head>
    <meta name="decorator" content="display">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>G:${qrdata}</title>
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0-rc.1/jquery.mobile-1.1.0-rc.1.min.css">

    <link rel="stylesheet" type="text/css" href="/css/s/scan-page.css">
    <link rel="stylesheet" type="text/css" href="/css/s/footer.css">

    <link rel="stylesheet" type="text/css" href="/css/s/social-buttons.css">

    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery.mobile-1.1.0-rc.1.min.js"></script>

</head>
<body class="softGrain ui-mobile-viewport" style="">

<div data-role="page" data-theme="x" id="home" data-url="home" tabindex="0" class="ui-page ui-body-x ui-page-active" style="border: 1px #000000 solid; ">
    <div data-role="content" class="ui-content" role="main"   style="border: 0px #000000 solid; width: 350px; min-height: 410px">
        <!--div class="reticle top" style="border: 1px #000000 solid;"></div-->
        <div class="scanPageWrapper">
            <div class="scanPageContainer">
                <div class="profileImage"
                     style="background-image: url(http://assets.scan.me/ast-f726d575-a319-49c5-a74b-3c4c1e2c0409_the-most-interesting-man-in-the-world.jpg);">
                </div>
                <div class="profile">
                    <h1 class="name">Interesting Guy</h1>

                    <p class="bio">i do cool things</p>

                    <p class="website"><a rel="external" href="http://www.cools.com/" class="ui-link">www.cools.com</a>
                    </p>
                </div>

                <a rel="external" data-role="button" style="clear:both;" href="http://www.site.com/"
                   class="websiteIcon ui-btn ui-btn-up-x ui-btn-corner-all ui-shadow" data-corners="true"
                   data-shadow="true" data-iconshadow="true" data-inline="false" data-wrapperels="span"><span
                        class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">visit us</span></span></a><a
                    rel="external" data-role="button" style="clear:both;" href="tel:321-321-3215"
                    class="phoneIcon ui-btn ui-btn-up-x ui-btn-corner-all ui-shadow" data-corners="true"
                    data-shadow="true" data-iconshadow="true" data-inline="false" data-wrapperels="span"><span
                    class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">call me</span></span></a>

                <a rel="external" data-role="button" class="textIcon ui-btn ui-btn-up-x ui-btn-corner-all ui-shadow"
                   href="sms:321-31-3211" data-corners="true" data-shadow="true" data-iconshadow="true"
                   data-inline="false" data-wrapperels="span"><span class="ui-btn-inner ui-btn-corner-all"><span
                        class="ui-btn-text">text me</span></span></a>

                <div style="clear: both;" class="ui-grid-b">
                    <div class="ui-block-a"><a rel="external" href="http://facebook.com/bob" data-role="button"
                                               class="facebookBackground socialIcon ui-btn ui-btn-up-x ui-btn-corner-all ui-shadow"
                                               data-corners="true" data-shadow="true" data-iconshadow="true"
                                               data-inline="false" data-wrapperels="span"><span
                            class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">facebook</span></span></a>
                    </div>
                    <div class="ui-block-b"><a rel="external" href="http://twitter.com/bob" data-role="button"
                                               class="twitterBackground socialIcon ui-btn ui-btn-up-x ui-btn-corner-all ui-shadow"
                                               data-corners="true" data-shadow="true" data-iconshadow="true"
                                               data-inline="false" data-wrapperels="span"><span
                            class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">twitter</span></span></a>
                    </div>
                    <div class="ui-block-c"><a rel="external" href="http://github.com/bob" data-role="button"
                                               class="githubBackground socialIcon ui-btn ui-btn-up-x ui-btn-corner-all ui-shadow"
                                               data-corners="true" data-shadow="true" data-iconshadow="true"
                                               data-inline="false" data-wrapperels="span"><span
                            class="ui-btn-inner ui-btn-corner-all"><span class="ui-btn-text">github</span></span></a>
                    </div>
                </div>
                <div data-role="footer" class="footer scan ui-footer ui-bar-a"
                     style="position: fixed; bottom: 0; width: 100%;" role="contentinfo">
                    <div class="ui-grid-b" style="height: 32px; line-height: 32px;">
                        <div class="ui-block-a" style="text-align: left;"><a rel="external" href="http://scan.me/"
                                                                             class="createYourFreeProfile ui-link">Create
                            Your Free Profile</a></div>
                        <div class="ui-block-b" style="text-align: center;">Scan</div>
                        <div class="ui-block-c" style="text-align: right;"><a rel="external"
                                                                              href="http://scan.me/apps/scan/download/"
                                                                              class="downloadFreeScanApp ui-link">Download
                            Free Scan App</a></div>
                    </div>
                </div>
            </div>
        </div>
        <!--div class="reticle bottom"></div-->

    </div>

    <!--div data-role="footer" class="footer scan ui-footer ui-bar-a" style="position: fixed; bottom: 0; width: 100%;"
         role="contentinfo">
        <div class="ui-grid-b" style="height: 32px; line-height: 32px;">
            <div class="ui-block-a" style="text-align: left;"><a rel="external" href="http://scan.me/"
                                                                 class="createYourFreeProfile ui-link">Create Your Free
                Profile</a></div>
            <div class="ui-block-b" style="text-align: center;">PEEK</div>
            <div class="ui-block-c" style="text-align: right;"><a rel="external"
                                                                  href="http://scan.me/apps/scan/download/"
                                                                  class="downloadFreeScanApp ui-link">Download Free Scan
                App</a></div>
        </div>
    </div-->
</div>


<!--div data-role="page" data-theme="x" id="sendContact" data-url="sendContact">
    <div data-role="content">
        <h2 style="margin-top: 0; margin-bottom: .25em;">Coming Soon!</h2>

        <p style="margin-top: 0; margin-bottom: 1em;">We're excited about rolling this feature out shortly. Sign up for
            our newsletter on <a rel="external" href="http://scan.me/">scan.me</a> to receive announcements of new
            features.</p>
        <a href="http://scan.me/q/l7mfmr#home" data-role="button" data-rel="back">Back</a>
    </div>

    <div data-role="footer" class="footer scan" style="position: fixed; bottom: 0; width: 100%;">
        <div class="ui-grid-b" style="height: 32px; line-height: 32px;">
            <div class="ui-block-a" style="text-align: left;"><a rel="external" href="http://scan.me/"
                                                                 class="createYourFreeProfile">Create Your Free
                Profile</a></div>
            <div class="ui-block-b" style="text-align: center;">Scan</div>
            <div class="ui-block-c" style="text-align: right;"><a rel="external"
                                                                  href="http://scan.me/apps/scan/download/"
                                                                  class="downloadFreeScanApp">Download Free Scan App</a>
            </div>
        </div>
    </div>
</div-->


<div data-role="page" data-theme="x" id="addContact" data-url="addContact">
    <div data-role="content">
        <form action="http://scan.me/api/mobile/sendVCardToEmailFromScannable/" method="post">

            <label for="email">Your e-mail address: *</label>
            <input type="email" name="email" id="email" value="">
            <input type="hidden" name="scannableShortReference" value="l7mfmr">

            <div class="ui-grid-a">
                <div class="ui-block-a">
                    <a href="http://scan.me/q/l7mfmr#home" data-role="button" data-rel="back">Back</a>
                </div>
                <div class="ui-block-b">
                    <button type="submit" data-theme="x"
                            onclick="if($(&#39;#email&#39;).val() == &#39;&#39;) { alert(&#39;Please enter your e-mail address.&#39;); return false; } else { return true; }">
                        Send
                    </button>
                </div>
            </div>

            <input type="hidden" name="outputType" value="raw">
        </form>
    </div>
    <div data-role="footer" class="footer scan" style="position: fixed; bottom: 0; width: 100%;">
        <div class="ui-grid-b" style="height: 32px; line-height: 32px;">
            <div class="ui-block-a" style="text-align: left;">
                <a rel="external" href="http://scan.me/" class="createYourFreeProfile">
                    Create Your Free Profile
                </a>
            </div>
            <div class="ui-block-b" style="text-align: center;">Scan</div>
            <div class="ui-block-c" style="text-align: right;"><a rel="external"
                                                                  href="http://scan.me/apps/scan/download/"
                                                                  class="downloadFreeScanApp">Download Free Scan App</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>