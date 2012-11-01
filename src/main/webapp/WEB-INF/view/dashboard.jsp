<%@ page import="java.util.Enumeration" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<span style="font-size: 22pt;" class="label label-info large-size" style="padding: 8px;">
    Recent Activity</span>
<hr>





<!--div id="nc-holdings" class="row" style="display: block; ">
    <div class="span12">
        <div class="well show-well">
            <div class="title"><h3>List of Holdings</h3></div>
            <div class="table-outer">
                <table id="list-of-holdings" class="table table-striped table-bordered table-condensed">
                    <thead>
                    <tr>
                        <th>Purchase Date</th>
                        <th>Symbol</th>
                        <th>Quantity</th>
                        <th>Purchase Price</th>
                        <th>Current Price</th>
                        <th>Purchase Basis</th>
                        <th>Market Value</th>
                        <th>Total Gain/Loss</th>
                        <th>Trade</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>2012-08-15</td>
                        <td title="Apple Inc.">AAPL</td>
                        <td>150</td>
                        <td>$162.26</td>
                        <td>$184.98</td>
                        <td class="green-color">$24,339.00</td>
                        <td class="green-color">$27,747.00</td>
                        <td class="green-color gray">$3,408.00 <span>↑</span></td>
                        <td class="gray"><a index="0" class="sell btn green-btn">Sell</a></td>
                    </tr>
                    </tbody>
                    <tfoot>
                    <tr class="summary bold alert alert-block alert-success">
                        <td colspan="5">Total</td>
                        <td class="large-size">$24,339.00</td>
                        <td class="large-size">$27,747.00</td>
                        <td class="large-size">$3,408.00</td>
                        <td>&nbsp;</td>
                    </tr>
                    </tfoot>
                </table>
                <div id="no-holdings"></div>
            </div>
        </div>
        <!- The prefix "lohp" stands for "List Of Holdings Pagination" ->
        <div class="pagination pagination-right">
            <!-- The prefix "loh" stands for "List Of Holdings" ->
            <ul id="loh-pagination">
                <li id="lohp-previous" class="disabled"><a>«</a></li>

                <li class="g2p active"><a>1</a></li>

                <li id="lohp-next" class="disabled"><a>»</a></li>
            </ul>
        </div>
    </div>
</div-->



<div id="nc-holdings" class="row" style="display: block; ">
<div class="span12">
<div class="well show-well">
<div class="title">
    <h3>
        <img src="/images/qrsticker.png" />
        <a href="/myqrs">QR Management</a>
        <a class="btn btn-success pull-right" href="/myqrs/type" style="margin-top: 10px;">
            <i class="icon-plus icon-white"></i> Create New
        </a>
    </h3>
</div>
<div class="table-outer">
<table id="list-of-holdings" class="table table-striped table-bordered table-condensed">
<thead>
<tr>
    <th>Name</th>
    <th>Desc</th>
    <th>Start Date</th>
    <th>Type</th>
    <th>Visits/Unique</th>
    <th>Action</th>
</tr>
</thead>
<tbody>
<tr>
    <td><a href="#">Gotce Peev - Biz Card</a></td>
    <td>My contact info</td>
    <td>04/13/12</td>
    <td><img src="/images/vcard.png"></td>
    <td>1,231/768</td>
    <td align="center">
        <a href="#" class="icon-edit" title="Edit"></a>
        <a href="#" class="icon-trash" title="Delete"></a>
        <a href="#" class="icon-eye-open" title="Mobile Preview"></a>
        <a href="#" class="icon-eye-open" title="PC Preview"></a>
        <a href="#" class="icon-print" title="Print"></a>
    </td>
</tr>
<tr>
    <td><a href="#">123 Adams St</a></td>
    <td>Real Estate listing.</td>
    <td>04/19/12</td>
    <td><img src="/images/sale-icon.png" width="35px"></td>
    <td>342/296</td>
    <td align="center">
        <a href="#" class="icon-edit" title="Edit"></a>
        <a href="#" class="icon-trash" title="Delete"></a>
        <a href="#" class="icon-eye-open" title="Mobile Preview"></a>
        <a href="#" class="icon-eye-open" title="PC Preview"></a>
        <a href="#" class="icon-print" title="Print"></a>
    </td>
</tr>

<c:forEach items="${vcard}" var="qr">
    <tr>
        <td>
        <c:out value="${qr.id}"/>
        <a href="/myqrs/render/">
            <c:out value="${qr.name}"/>
        </a>
    </td>
    <td></td>
    <td></td>
    <td>1d2</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
</c:forEach>



</tbody>
    <tfoot>
    <tr class="summary bold alert alert-block alert-success">
        <td colspan="4">Total</td>
        <td class="large-size">1234 / 234</td>
        <td></td>
    </tr>
</tfoot>
</table>
    <div id="no-holdings"></div>
</div>
</div>
    <!-- The prefix "lohp" stands for "List Of Holdings Pagination" -->
    <div class="pagination pagination-right">
        <!-- The prefix "loh" stands for "List Of Holdings" -->
        <ul id="loh-pagination">
            <li id="lohp-previous" class="disabled"><a><<</a></li>

            <li class="g2p active"><a>1</a></li>

            <li id="lohp-next" class="disabled"><a>>></a></li>
        </ul>
    </div>
</div>
</div>










<!--h2 id="myqrs">
    <img src="/images/qrsticker.png">
    <a href="/myqrs">QR Management</a>
    <div class="pull-right">
        <a class="btn btn-success" href="/myqrs/type">
            <i class="icon-plus icon-white"></i> Create New
        </a>
    </div>
</h2>
<p>Last 3 qr codes you created.</p>

<div class="bs-docs-example">
    <table class="table table-striped table-hover">
        <tr>
            <th>Name</th>
            <th>Desc</th>
            <th>Start Date</th>
            <th>Type</th>
            <th>Visits/Unique</th>
            <th>Action</th>
        </tr>
        <tr>
            <td><a href="#">Gotce Peev - Biz Card</a></td>
            <td>My contact info</td>
            <td>04/13/12</td>
            <td><img src="/images/vcard.png"></td>
            <td>1,231/768</td>
            <td align="center">
                <a href="#" class="icon-edit" title="Edit"></a>
                <a href="#" class="icon-trash" title="Delete"></a>
                <a href="#" class="icon-eye-open" title="Mobile Preview"></a>
                <a href="#" class="icon-eye-open" title="PC Preview"></a>
                <a href="#" class="icon-print" title="Print"></a>
            </td>
        </tr>
        <tr>
            <td><a href="#">123 Adams St</a></td>
            <td>Real Estate listing.</td>
            <td>04/19/12</td>
            <td><img src="/images/sale-icon.png" width="35px"></td>
            <td>342/296</td>
            <td align="center">
                <a href="#" class="icon-edit" title="Edit"></a>
                <a href="#" class="icon-trash" title="Delete"></a>
                <a href="#" class="icon-eye-open" title="Mobile Preview"></a>
                <a href="#" class="icon-eye-open" title="PC Preview"></a>
                <a href="#" class="icon-print" title="Print"></a>
            </td>
        </tr>
    </table>
</div-->

<hr>

<div id="nc-holdings" class="row" style="display: block; ">
<div class="span12">
<div class="well show-well">
<div class="title">
    <h3>
        <img src="/images/history-icon.gif" height="32px">
        <a href="/myqrs">Quick look at your 'Peeks`</a>
    </h3>
</div>
<div class="table-outer">
<table id="list-of-holdings" class="table table-striped table-bordered table-condensed">
<thead>
<tr>
    <th>Name</th>
    <th>Peek Date</th>
    <th>Type</th>
    <th>Other</th>
    <th>Recommend</th>
    <th>Action</th>
</tr>
</thead>
    <tbody>
    <tr>
        <td><a href="#">Derek G - Contact Info</a></td>
        <td>05/22/12</td>
        <td>vCard</td>
        <td></td>
        <td>
            <nav id="main-nav">
                <ul id="social-menu" class="social-menu unstyled float">
                    <li id="menu-item-14541"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                            target="_blank" href="http://twitter.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                    </li>
                    <li id="menu-item-14542"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                            target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                    </li>
                    <li id="menu-item-14543"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                            target="_blank" href="http://facebook.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                    </li>
                    <li id="menu-item-14545"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                            target="_blank" href="http://www.youtube.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                    </li>
                    <li id="menu-item-14840"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                            target="_blank" href="http://www.slideshare.net/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                    </li>
                    <li id="menu-item-14546"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                            target="_blank" href="http://feeds.feedburner.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                        Feed</a></li>
                </ul>
            </nav>
        </td>
        <td align="center">
            <a href="#" class="icon-comment" title="Leave Feedback"></a>
            <a href="#" class="icon-share" title="Share"></a>
            <a href="#" class="icon-trash" title="Delete"></a>
        </td>
    </tr>
    <tr>
        <td><a href="#">Dave Conrad - Contact Info</a></td>
        <td>03/11/12</td>
        <td>vCard</td>
        <td></td>
        <td>
            <nav id="main-nav">
                <ul id="social-menu" class="social-menu unstyled float">
                    <li id="menu-item-14541"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                            target="_blank" href="http://twitter.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                    </li>
                    <li id="menu-item-14542"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                            target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                    </li>
                    <li id="menu-item-14543"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                            target="_blank" href="http://facebook.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                    </li>
                    <li id="menu-item-14545"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                            target="_blank" href="http://www.youtube.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                    </li>
                    <li id="menu-item-14840"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                            target="_blank" href="http://www.slideshare.net/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                    </li>
                    <li id="menu-item-14546"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                            target="_blank" href="http://feeds.feedburner.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                        Feed</a></li>
                </ul>
            </nav>
        </td>
        <td align="center">
            <a href="#" class="icon-comment" title="Leave Feedback"></a>
            <a href="#" class="icon-share" title="Share"></a>
            <a href="#" class="icon-trash" title="Delete"></a>
        </td>
    </tr>
    <tr>
        <td><a href="#">43 21th St Unit D</a></td>
        <td>09/11/12</td>
        <td>Listing</td>
        <td>Map</td>
        <td>
            <nav id="main-nav">
                <ul id="social-menu" class="social-menu unstyled float">
                    <li id="menu-item-14541"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                            target="_blank" href="http://twitter.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                    </li>
                    <li id="menu-item-14542"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                            target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                    </li>
                    <li id="menu-item-14543"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                            target="_blank" href="http://facebook.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                    </li>
                    <li id="menu-item-14545"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                            target="_blank" href="http://www.youtube.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                    </li>
                    <li id="menu-item-14840"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                            target="_blank" href="http://www.slideshare.net/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                    </li>
                    <li id="menu-item-14546"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                            target="_blank" href="http://feeds.feedburner.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                        Feed</a></li>
                </ul>
            </nav>
        </td>
        <td align="center">
            <a href="#" class="icon-comment" title="Leave Feedback"></a>
            <a href="#" class="icon-envelope" title="Contact Seller"></a>
            <a href="#" class="icon-share" title="Share"></a>
            <a href="#" class="icon-trash" title="Delete"></a>
        </td>
    </tr>
    <tr>
        <td><a href="#">55 20th St Penthouse</a></td>
        <td>09/11/12</td>
        <td>Listing</td>
        <td>Map</td>
        <td>
            <nav id="main-nav">
                <ul id="social-menu" class="social-menu unstyled float">
                    <li id="menu-item-14541"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                            target="_blank" href="http://twitter.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                    </li>
                    <li id="menu-item-14542"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                            target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                    </li>
                    <li id="menu-item-14543"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                            target="_blank" href="http://facebook.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                    </li>
                    <li id="menu-item-14545"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                            target="_blank" href="http://www.youtube.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                    </li>
                    <li id="menu-item-14840"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                            target="_blank" href="http://www.slideshare.net/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                    </li>
                    <li id="menu-item-14546"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                            target="_blank" href="http://feeds.feedburner.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                        Feed</a></li>
                </ul>
            </nav>
        </td>
        <td align="center">
            <a href="#" class="icon-comment" title="Leave Feedback"></a>
            <a href="#" class="icon-envelope" title="Contact Seller"></a>
            <a href="#" class="icon-share" title="Share"></a>
            <a href="#" class="icon-trash" title="Delete"></a>
        </td>
    </tr>
    <tr>
        <td><button class="btn btn-mini btn-danger pull-left">Alert!</button><a href="#">65 19th St Floor 12</a></td>
        <td>09/11/12</td>
        <td>Listing</td>
        <td>Map</td>
        <td>
            <nav id="main-nav">
                <ul id="social-menu" class="social-menu unstyled float">
                    <li id="menu-item-14541"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                            target="_blank" href="http://twitter.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                    </li>
                    <li id="menu-item-14542"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                            target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                    </li>
                    <li id="menu-item-14543"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                            target="_blank" href="http://facebook.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                    </li>
                    <li id="menu-item-14545"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                            target="_blank" href="http://www.youtube.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                    </li>
                    <li id="menu-item-14840"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                            target="_blank" href="http://www.slideshare.net/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                    </li>
                    <li id="menu-item-14546"
                        class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                            target="_blank" href="http://feeds.feedburner.com/monetate"
                            onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                        Feed</a></li>
                </ul>
            </nav>
        </td>
        <td align="center">
            <a href="#" class="icon-comment" title="Leave Feedback"></a>
            <a href="#" class="icon-envelope" title="Contact Seller"></a>
            <a href="#" class="icon-share" title="Share"></a>
            <a href="#" class="icon-trash" title="Delete"></a>
        </td>
    </tr>
    </tbody>
<!--tfoot>
<tr class="summary bold alert alert-block alert-success">
    <td colspan="4">Total</td>
    <td class="large-size">1234 / 234</td>
    <td></td>
</tr>
</tfoot-->
</table>
    <div id="no-holdings"></div>
</div>
</div>
    <!-- The prefix "lohp" stands for "List Of Holdings Pagination" -->
    <div class="pagination pagination-right">
        <!-- The prefix "loh" stands for "List Of Holdings" -->
        <ul id="loh-pagination">
            <li id="lohp-previous" class="disabled"><a><<</a></li>

            <li class="g2p active"><a>1</a></li>

            <li id="lohp-next" class="disabled"><a>>></a></li>
        </ul>
    </div>
</div>
</div>







<!--h2 id="peeks">
    <img src="/images/history-icon.gif" height="32px">
    <a href="/peeks">Quick look at your 'Peeks`</a></h2>

<p>Last 5 scans you made.</p>

<div class="bs-docs-example">
<table class="table table-striped table-hover">
<tr>
    <th>Name</th>
    <th>Peek Date</th>
    <th>Type</th>
    <th>Other</th>
    <th>Recommend</th>
    <th>Action</th>
</tr>
<tr>
    <td><a href="#">Derek G - Contact Info</a></td>
    <td>05/22/12</td>
    <td>vCard</td>
    <td></td>
    <td>
        <nav id="main-nav">
            <ul id="social-menu" class="social-menu unstyled float">
                <li id="menu-item-14541"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                        target="_blank" href="http://twitter.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                </li>
                <li id="menu-item-14542"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                        target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                </li>
                <li id="menu-item-14543"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                        target="_blank" href="http://facebook.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                </li>
                <li id="menu-item-14545"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                        target="_blank" href="http://www.youtube.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                </li>
                <li id="menu-item-14840"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                        target="_blank" href="http://www.slideshare.net/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                </li>
                <li id="menu-item-14546"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                        target="_blank" href="http://feeds.feedburner.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                    Feed</a></li>
            </ul>
        </nav>
    </td>
    <td align="center">
        <a href="#" class="icon-comment" title="Leave Feedback"></a>
        <a href="#" class="icon-share" title="Share"></a>
        <a href="#" class="icon-trash" title="Delete"></a>
    </td>
</tr>
<tr>
    <td><a href="#">Dave Conrad - Contact Info</a></td>
    <td>03/11/12</td>
    <td>vCard</td>
    <td></td>
    <td>
        <nav id="main-nav">
            <ul id="social-menu" class="social-menu unstyled float">
                <li id="menu-item-14541"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                        target="_blank" href="http://twitter.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                </li>
                <li id="menu-item-14542"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                        target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                </li>
                <li id="menu-item-14543"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                        target="_blank" href="http://facebook.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                </li>
                <li id="menu-item-14545"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                        target="_blank" href="http://www.youtube.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                </li>
                <li id="menu-item-14840"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                        target="_blank" href="http://www.slideshare.net/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                </li>
                <li id="menu-item-14546"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                        target="_blank" href="http://feeds.feedburner.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                    Feed</a></li>
            </ul>
        </nav>
    </td>
    <td align="center">
        <a href="#" class="icon-comment" title="Leave Feedback"></a>
        <a href="#" class="icon-share" title="Share"></a>
        <a href="#" class="icon-trash" title="Delete"></a>
    </td>
</tr>
<tr>
    <td><a href="#">43 21th St Unit D</a></td>
    <td>09/11/12</td>
    <td>Listing</td>
    <td>Map</td>
    <td>
        <nav id="main-nav">
            <ul id="social-menu" class="social-menu unstyled float">
                <li id="menu-item-14541"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                        target="_blank" href="http://twitter.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                </li>
                <li id="menu-item-14542"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                        target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                </li>
                <li id="menu-item-14543"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                        target="_blank" href="http://facebook.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                </li>
                <li id="menu-item-14545"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                        target="_blank" href="http://www.youtube.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                </li>
                <li id="menu-item-14840"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                        target="_blank" href="http://www.slideshare.net/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                </li>
                <li id="menu-item-14546"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                        target="_blank" href="http://feeds.feedburner.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                    Feed</a></li>
            </ul>
        </nav>
    </td>
    <td align="center">
        <a href="#" class="icon-comment" title="Leave Feedback"></a>
        <a href="#" class="icon-envelope" title="Contact Seller"></a>
        <a href="#" class="icon-share" title="Share"></a>
        <a href="#" class="icon-trash" title="Delete"></a>
    </td>
</tr>
<tr>
    <td><a href="#">55 20th St Penthouse</a></td>
    <td>09/11/12</td>
    <td>Listing</td>
    <td>Map</td>
    <td>
        <nav id="main-nav">
            <ul id="social-menu" class="social-menu unstyled float">
                <li id="menu-item-14541"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                        target="_blank" href="http://twitter.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                </li>
                <li id="menu-item-14542"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                        target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                </li>
                <li id="menu-item-14543"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                        target="_blank" href="http://facebook.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                </li>
                <li id="menu-item-14545"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                        target="_blank" href="http://www.youtube.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                </li>
                <li id="menu-item-14840"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                        target="_blank" href="http://www.slideshare.net/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                </li>
                <li id="menu-item-14546"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                        target="_blank" href="http://feeds.feedburner.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                    Feed</a></li>
            </ul>
        </nav>
    </td>
    <td align="center">
        <a href="#" class="icon-comment" title="Leave Feedback"></a>
        <a href="#" class="icon-envelope" title="Contact Seller"></a>
        <a href="#" class="icon-share" title="Share"></a>
        <a href="#" class="icon-trash" title="Delete"></a>
    </td>
</tr>
<tr>
    <td><a href="#">65 19th St Floor 12</a></td>
    <td>09/11/12</td>
    <td>Listing</td>
    <td>Map</td>
    <td>
        <nav id="main-nav">
            <ul id="social-menu" class="social-menu unstyled float">
                <li id="menu-item-14541"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14541"><a
                        target="_blank" href="http://twitter.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://twitter.com']);">Twitter</a>
                </li>
                <li id="menu-item-14542"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14542"><a
                        target="_blank" href="http://www.linkedin.com/company/monetate-inc./products"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.linkedin.com']);">LinkedIn</a>
                </li>
                <li id="menu-item-14543"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14543"><a
                        target="_blank" href="http://facebook.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://facebook.com']);">Facebook</a>
                </li>
                <li id="menu-item-14545"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14545"><a
                        target="_blank" href="http://www.youtube.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.youtube.com']);">YouTube</a>
                </li>
                <li id="menu-item-14840"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14840"><a
                        target="_blank" href="http://www.slideshare.net/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://www.slideshare.net']);">SlideShare</a>
                </li>
                <li id="menu-item-14546"
                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-14546"><a
                        target="_blank" href="http://feeds.feedburner.com/monetate"
                        onclick="javascript:_gaq.push(['_trackEvent','outbound-menu','http://feeds.feedburner.com']);">RSS
                    Feed</a></li>
            </ul>
        </nav>
    </td>
    <td align="center">
        <a href="#" class="icon-comment" title="Leave Feedback"></a>
        <a href="#" class="icon-envelope" title="Contact Seller"></a>
        <a href="#" class="icon-share" title="Share"></a>
        <a href="#" class="icon-trash" title="Delete"></a>
    </td>
</tr>
</table>
</div-->

