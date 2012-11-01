<div id="facebookCheckInPage" class="formPage formPageInactive" style="width: 580px; display: none; ">
<div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
<div class="formPageDescription">
    <div style="overflow:visible; position:relative">
        <div class="mapCanvasWrapper">
            <div id="facebookMapCanvas"></div>
        </div>
        <button class="blueButton" style="display:inline;" onclick="QrCodeGenerator.geolocateFromForm(); return false;">
            Geolocate
        </button>
    </div>
</div>
<div id="facebookCheckInPage-section1" class="formSection formSectionAnonymous">
<div id="facebookCheckInPlaceName-wrapper" class="formComponent formComponentSingleLineText">
    <label id="facebookCheckInPlaceName-label" for="facebookCheckInPlaceName" class="formComponentLabel">Place
        name:<span class="formComponentLabelRequiredStar"> *</span></label>
    <input type="text" id="facebookCheckInPlaceName" name="facebookCheckInPlaceName" onkeyup="QrCodeGenerator.submitAjaxData(event, this);">

    <div id="facebookCheckInPlaceName-description" class="formComponentDescription">
        <button class="blueButton" style="display:inline;" onclick="QrCodeGenerator.getFacebookGraphDataByName(); return false;">
            Find By Name
        </button>
        <span class="response"></span></div>
</div>
<div id="facebookCheckInPlaceId-wrapper" class="formComponent formComponentSingleLineText">
    <label id="facebookCheckInPlaceId-label" for="facebookCheckInPlaceId" class="formComponentLabel">Facebook
        place ID:<span class="formComponentLabelRequiredStar"> *</span></label>
    <input type="text" id="facebookCheckInPlaceId" name="facebookCheckInPlaceId">

    <div id="facebookCheckInPlaceId-description" class="formComponentDescription">
        <button class="blueButton" style="display:inline;" onclick="QrCodeGenerator.getFacebookGraphDataById(); return false;">
            Find By ID
        </button>
        <span class="response"></span></div>
</div>
<div id="facebookCheckInPlaceAddress-wrapper" class="formComponent formComponentAddress">
    <label id="facebookCheckInPlaceAddress-label" for="facebookCheckInPlaceAddress" class="formComponentLabel">Facebook
        place Address:<span class="formComponentLabelRequiredStar"> *</span></label>

    <div class="addressLine1Div">
        <input type="text" id="facebookCheckInPlaceAddress-addressLine1" name="facebookCheckInPlaceAddress-addressLine1" class="addressLine1" value="" maxlength="">

        <div class="formComponentSublabel"><p>Street Address</p></div>
    </div>
    <div class="addressLine2Div" style="display: none;">
        <input type="text" id="facebookCheckInPlaceAddress-addressLine2" name="facebookCheckInPlaceAddress-addressLine2" class="addressLine2" value="" maxlength="">

        <div class="formComponentSublabel"><p>Address Line 2</p></div>
    </div>
    <div class="cityDiv">
        <input type="text" id="facebookCheckInPlaceAddress-city" name="facebookCheckInPlaceAddress-city" class="city" maxlength="15" value="">

        <div class="formComponentSublabel"><p>City</p></div>
    </div>
    <div class="stateDiv">
        <input type="text" id="facebookCheckInPlaceAddress-state" name="facebookCheckInPlaceAddress-state" class="state">

        <div class="formComponentSublabel"><p>State / Province / Region</p></div>
    </div>
    <div class="zipDiv">
        <input type="text" id="facebookCheckInPlaceAddress-zip" name="facebookCheckInPlaceAddress-zip" class="zip" value="">

        <div class="formComponentSublabel"><p>Postal / Zip Code</p></div>
    </div>
    <div class="countryDiv">
        <select id="facebookCheckInPlaceAddress-country" name="facebookCheckInPlaceAddress-country" class="country">
            <option value="" selected="1" disabled="disabled">Select a Country</option>
            <option value="US">United States of America</option>
            <option value="AF">Afghanistan</option>
            <option value="AL">Albania</option>
            <option value="DZ">Algeria</option>
            <option value="AS">American Samoa</option>
            <option value="AD">Andorra</option>
            <option value="AO">Angola</option>
            <option value="AI">Anguilla</option>
            <option value="AQ">Antarctica</option>
            <option value="AG">Antigua and Barbuda</option>
            <option value="AR">Argentina</option>
            <option value="AM">Armenia</option>
            <option value="AW">Aruba</option>
            <option value="AU">Australia</option>
            <option value="AT">Austria</option>
            <option value="AZ">Azerbaijan</option>
            <option value="BS">Bahamas</option>
            <option value="BH">Bahrain</option>
            <option value="BD">Bangladesh</option>
            <option value="BB">Barbados</option>
            <option value="BY">Belarus</option>
            <option value="BE">Belgium</option>
            <option value="BZ">Belize</option>
            <option value="BJ">Benin</option>
            <option value="BM">Bermuda</option>
            <option value="BT">Bhutan</option>
            <option value="BO">Bolivia</option>
            <option value="BA">Bosnia and Herzegovina</option>
            <option value="BW">Botswana</option>
            <option value="BV">Bouvet Island</option>
            <option value="BR">Brazil</option>
            <option value="IO">British Indian Ocean Territory</option>
            <option value="BN">Brunei</option>
            <option value="BG">Bulgaria</option>
            <option value="BF">Burkina Faso</option>
            <option value="BI">Burundi</option>
            <option value="KH">Cambodia</option>
            <option value="CM">Cameroon</option>
            <option value="CA">Canada</option>
            <option value="CV">Cape Verde</option>
            <option value="KY">Cayman Islands</option>
            <option value="CF">Central African Republic</option>
            <option value="TD">Chad</option>
            <option value="CL">Chile</option>
            <option value="CN">China</option>
            <option value="CX">Christmas Island</option>
            <option value="CC">Cocos (Keeling) Islands</option>
            <option value="CO">Columbia</option>
            <option value="KM">Comoros</option>
            <option value="CG">Congo</option>
            <option value="CK">Cook Islands</option>
            <option value="CR">Costa Rica</option>
            <option value="CI">Cote D'Ivorie (Ivory Coast)</option>
            <option value="HR">Croatia (Hrvatska)</option>
            <option value="CU">Cuba</option>
            <option value="CY">Cyprus</option>
            <option value="CZ">Czech Republic</option>
            <option value="CD">Democratic Republic of Congo (Zaire)</option>
            <option value="DK">Denmark</option>
            <option value="DJ">Djibouti</option>
            <option value="DM">Dominica</option>
            <option value="DO">Dominican Republic</option>
            <option value="TP">East Timor</option>
            <option value="EC">Ecuador</option>
            <option value="EG">Egypt</option>
            <option value="SV">El Salvador</option>
            <option value="GQ">Equatorial Guinea</option>
            <option value="ER">Eritrea</option>
            <option value="EE">Estonia</option>
            <option value="ET">Ethiopia</option>
            <option value="FK">Falkland Islands (Malvinas)</option>
            <option value="FO">Faroe Islands</option>
            <option value="FJ">Fiji</option>
            <option value="FI">Finland</option>
            <option value="FR">France</option>
            <option value="FX">France), Metropolitanarray(</option>
            <option value="GF">French Guinea</option>
            <option value="PF">French Polynesia</option>
            <option value="TF">French Southern Territories</option>
            <option value="GA">Gabon</option>
            <option value="GM">Gambia</option>
            <option value="GE">Georgia</option>
            <option value="DE">Germany</option>
            <option value="GH">Ghana</option>
            <option value="GI">Gibraltar</option>
            <option value="GR">Greece</option>
            <option value="GL">Greenland</option>
            <option value="GD">Grenada</option>
            <option value="GP">Guadeloupe</option>
            <option value="GU">Guam</option>
            <option value="GT">Guatemala</option>
            <option value="GN">Guinea</option>
            <option value="GW">Guinea-Bissau</option>
            <option value="GY">Guyana</option>
            <option value="HT">Haiti</option>
            <option value="HM">Heard and McDonald Islands</option>
            <option value="HN">Honduras</option>
            <option value="HK">Hong Kong</option>
            <option value="HU">Hungary</option>
            <option value="IS">Iceland</option>
            <option value="IN">India</option>
            <option value="ID">Indonesia</option>
            <option value="IR">Iran</option>
            <option value="IQ">Iraq</option>
            <option value="IE">Ireland</option>
            <option value="IL">Israel</option>
            <option value="IT">Italy</option>
            <option value="JM">Jamaica</option>
            <option value="JP">Japan</option>
            <option value="JO">Jordan</option>
            <option value="KZ">Kazakhstan</option>
            <option value="KE">Kenya</option>
            <option value="KI">Kiribati</option>
            <option value="KW">Kuwait</option>
            <option value="KG">Kyrgyzstan</option>
            <option value="LA">Laos</option>
            <option value="LV">Latvia</option>
            <option value="LB">Lebanon</option>
            <option value="LS">Lesotho</option>
            <option value="LR">Liberia</option>
            <option value="LY">Libya</option>
            <option value="LI">Liechtenstein</option>
            <option value="LT">Lithuania</option>
            <option value="LU">Luxembourg</option>
            <option value="MO">Macau</option>
            <option value="MK">Macedonia</option>
            <option value="MG">Madagascar</option>
            <option value="MW">Malawi</option>
            <option value="MY">Malaysia</option>
            <option value="MV">Maldives</option>
            <option value="ML">Mali</option>
            <option value="MT">Malta</option>
            <option value="MH">Marshall Islands</option>
            <option value="MQ">Martinique</option>
            <option value="MR">Mauritania</option>
            <option value="MU">Mauritius</option>
            <option value="YT">Mayotte</option>
            <option value="MX">Mexico</option>
            <option value="FM">Micronesia</option>
            <option value="MD">Moldova</option>
            <option value="MC">Monaco</option>
            <option value="MN">Mongolia</option>
            <option value="MS">Montserrat</option>
            <option value="MA">Morocco</option>
            <option value="MZ">Mozambique</option>
            <option value="MM">Myanmar (Burma)</option>
            <option value="NA">Namibia</option>
            <option value="NR">Nauru</option>
            <option value="NP">Nepal</option>
            <option value="NL">Netherlands</option>
            <option value="AN">Netherlands Antilles</option>
            <option value="NC">New Caledonia</option>
            <option value="NZ">New Zealand</option>
            <option value="NI">Nicaragua</option>
            <option value="NE">Niger</option>
            <option value="NG">Nigeria</option>
            <option value="NU">Niue</option>
            <option value="NF">Norfolk Island</option>
            <option value="KP">North Korea</option>
            <option value="MP">Northern Mariana Islands</option>
            <option value="NO">Norway</option>
            <option value="OM">Oman</option>
            <option value="PK">Pakistan</option>
            <option value="PW">Palau</option>
            <option value="PA">Panama</option>
            <option value="PG">Papua New Guinea</option>
            <option value="PY">Paraguay</option>
            <option value="PE">Peru</option>
            <option value="PH">Philippines</option>
            <option value="PN">Pitcairn</option>
            <option value="PL">Poland</option>
            <option value="PT">Portugal</option>
            <option value="PR">Puerto Rico</option>
            <option value="QA">Qatar</option>
            <option value="RE">Reunion</option>
            <option value="RO">Romania</option>
            <option value="RU">Russia</option>
            <option value="RW">Rwanda</option>
            <option value="SH">Saint Helena</option>
            <option value="KN">Saint Kitts and Nevis</option>
            <option value="LC">Saint Lucia</option>
            <option value="PM">Saint Pierre and Miquelon</option>
            <option value="VC">Saint Vincent and The Grenadines</option>
            <option value="SM">San Marino</option>
            <option value="ST">Sao Tome and Principe</option>
            <option value="SA">Saudi Arabia</option>
            <option value="SN">Senegal</option>
            <option value="SC">Seychelles</option>
            <option value="SL">Sierra Leone</option>
            <option value="SG">Singapore</option>
            <option value="SK">Slovak Republic</option>
            <option value="SI">Slovenia</option>
            <option value="SB">Solomon Islands</option>
            <option value="SO">Somalia</option>
            <option value="ZA">South Africa</option>
            <option value="GS">South Georgia</option>
            <option value="KR">South Korea</option>
            <option value="ES">Spain</option>
            <option value="LK">Sri Lanka</option>
            <option value="SD">Sudan</option>
            <option value="SR">Suriname</option>
            <option value="SJ">Svalbard and Jan Mayen</option>
            <option value="SZ">Swaziland</option>
            <option value="SE">Sweden</option>
            <option value="CH">Switzerland</option>
            <option value="SY">Syria</option>
            <option value="TW">Taiwan</option>
            <option value="TJ">Tajikistan</option>
            <option value="TZ">Tanzania</option>
            <option value="TH">Thailand</option>
            <option value="TG">Togo</option>
            <option value="TK">Tokelau</option>
            <option value="TO">Tonga</option>
            <option value="TT">Trinidad and Tobago</option>
            <option value="TN">Tunisia</option>
            <option value="TR">Turkey</option>
            <option value="TM">Turkmenistan</option>
            <option value="TC">Turks and Caicos Islands</option>
            <option value="TV">Tuvalu</option>
            <option value="UG">Uganda</option>
            <option value="UA">Ukraine</option>
            <option value="AE">United Arab Emirates</option>
            <option value="UK">United Kingdom</option>
            <option value="US">United States of America</option>
            <option value="UM">United States Minor Outlying Islands</option>
            <option value="UY">Uruguay</option>
            <option value="UZ">Uzbekistan</option>
            <option value="VU">Vanuatu</option>
            <option value="VA">Vatican City (Holy See)</option>
            <option value="VE">Venezuela</option>
            <option value="VN">Vietnam</option>
            <option value="VG">Virgin Islands (British)</option>
            <option value="VI">Virgin Islands (US)</option>
            <option value="WF">Wallis and Futuna Islands</option>
            <option value="EH">Western Sahara</option>
            <option value="WS">Western Samoa</option>
            <option value="YE">Yemen</option>
            <option value="YU">Yugoslavia</option>
            <option value="ZM">Zambia</option>
            <option value="ZW">Zimbabwe</option>
        </select>

        <div class="formComponentSublabel"><p>Country</p></div>
    </div>
</div>
<div id="facebookCheckInPlaceLatitude-wrapper" class="formComponent formComponentSingleLineText">
    <label id="facebookCheckInPlaceLatitude-label" for="facebookCheckInPlaceLatitude" class="formComponentLabel">Place
        latitude:<span class="formComponentLabelRequiredStar"> *</span></label>
    <input type="text" id="facebookCheckInPlaceLatitude" name="facebookCheckInPlaceLatitude">
</div>
<div id="facebookCheckInPlaceLongitude-wrapper" class="formComponent formComponentSingleLineText">
    <label id="facebookCheckInPlaceLongitude-label" for="facebookCheckInPlaceLongitude" class="formComponentLabel">Place
        longitude:<span class="formComponentLabelRequiredStar"> *</span></label>
    <input type="text" id="facebookCheckInPlaceLongitude" name="facebookCheckInPlaceLongitude">
</div>
</div>
</div>
<div id="facebookLikePage" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
    <div id="facebookLikePage-section1" class="formSection formSectionAnonymous">
        <div id="facebookLikePageName-wrapper" class="formComponent formComponentSingleLineText">
            <label id="facebookLikePageName-label" for="facebookLikePageName" class="formComponentLabel">Facebook
                Page name:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="facebookLikePageName" name="facebookLikePageName" onkeyup="QrCodeGenerator.updateFacebookLikePreview();">
        </div>
        <div id="facebookLikePageUrl-wrapper" class="formComponent formComponentSingleLineText">
            <label id="facebookLikePageUrl-label" for="facebookLikePageUrl" class="formComponentLabel">Facebook
                Page URL:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="facebookLikePageUrl" name="facebookLikePageUrl" style="width: 18em;" onkeyup="QrCodeGenerator.updateFacebookLikePreview();">
        </div>
        <div id="facebookLikeAutoRedirect-wrapper" class="formComponent formComponentMultipleChoice">
            <div id="facebookLikeAutoRedirect-choice1-wrapper" class="choiceWrapper">
                <input type="checkbox" id="facebookLikeAutoRedirect-choice1" name="facebookLikeAutoRedirect" value="autoRedirect" class="choice" style="display: inline;">
                <label for="facebookLikeAutoRedirect-choice1" class="choiceLabel" style="display: inline;">Go
                    straight to Facebook Page
                </label>
            </div>
        </div>
    </div>
</div>
<div id="twitterFollowPage" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
    <div id="twitterFollowPage-section1" class="formSection formSectionAnonymous">
        <div id="twitterFollowUsername-wrapper" class="formComponent formComponentSingleLineText">
            <label id="twitterFollowUsername-label" for="twitterFollowUsername" class="formComponentLabel">Twitter
                username:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="twitterFollowUsername-prependLabel" class="formPrependLabel">@</span>
            <input type="text" id="twitterFollowUsername" name="twitterFollowUsername" onkeyup="QrCodeGenerator.submitAjaxData(event, this); QrCodeGenerator.updateTwitterFollowPreview">

            <div id="twitterFollowUsername-description" class="formComponentDescription">
                <div></div>
            </div>
        </div>
    </div>
</div>
<div id="foursquareCheckInPage" class="formPage formPageInactive" style="width: 580px; display: none; ">
<div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
<div class="formPageDescription">
    <div style="overflow:visible; position:relative">
        <div class="mapCanvasWrapper">
            <div id="foursquareMapCanvas"></div>
        </div>
    </div>
</div>
<div id="foursquareCheckInPage-section1" class="formSection formSectionAnonymous">
<div id="foursquareCheckInVenueId-wrapper" class="formComponent formComponentSingleLineText">
    <label id="foursquareCheckInVenueId-label" for="foursquareCheckInVenueId" class="formComponentLabel">Foursquare
        Venue ID:<span class="formComponentLabelRequiredStar"> *</span></label>
    <input type="text" id="foursquareCheckInVenueId" name="foursquareCheckInVenueId" onkeyup="QrCodeGenerator.submitAjaxData(event, this);">

    <div id="foursquareCheckInVenueId-description" class="formComponentDescription">
        <button class="blueButton" style="display:inline;" onclick="QrCodeGenerator.getFoursquareDataByVenueId(); return false;">
            Populate By ID
        </button>
        <span class="response"></span></div>
</div>
<div id="foursquareCheckInVenueName-wrapper" class="formComponent formComponentSingleLineText">
    <label id="foursquareCheckInVenueName-label" for="foursquareCheckInVenueName" class="formComponentLabel">Venue name:<span class="formComponentLabelRequiredStar"> *</span>
    </label>
    <input type="text" id="foursquareCheckInVenueName" name="foursquareCheckInVenueName">
</div>
<div id="foursquareCheckInAddress-wrapper" class="formComponent formComponentAddress">
    <label id="foursquareCheckInAddress-label" for="foursquareCheckInAddress" class="formComponentLabel">Foursquare
        Venue Address:<span class="formComponentLabelRequiredStar"> *</span></label>

    <div class="addressLine1Div">
        <input type="text" id="foursquareCheckInAddress-addressLine1" name="foursquareCheckInAddress-addressLine1" class="addressLine1" value="" maxlength="">

        <div class="formComponentSublabel"><p>Street Address</p></div>
    </div>
    <div class="addressLine2Div" style="display: none;">
        <input type="text" id="foursquareCheckInAddress-addressLine2" name="foursquareCheckInAddress-addressLine2" class="addressLine2" value="" maxlength="">

        <div class="formComponentSublabel"><p>Address Line 2</p></div>
    </div>
    <div class="cityDiv">
        <input type="text" id="foursquareCheckInAddress-city" name="foursquareCheckInAddress-city" class="city" maxlength="15" value="">

        <div class="formComponentSublabel"><p>City</p></div>
    </div>
    <div class="stateDiv">
        <input type="text" id="foursquareCheckInAddress-state" name="foursquareCheckInAddress-state" class="state">

        <div class="formComponentSublabel"><p>State / Province / Region</p></div>
    </div>
    <div class="zipDiv">
        <input type="text" id="foursquareCheckInAddress-zip" name="foursquareCheckInAddress-zip" class="zip" value="">

        <div class="formComponentSublabel"><p>Postal / Zip Code</p></div>
    </div>
    <div class="countryDiv">
        <select id="foursquareCheckInAddress-country" name="foursquareCheckInAddress-country" class="country">
            <option value="" selected="1" disabled="disabled">Select a Country</option>
            <option value="US">United States of America</option>
            <option value="AF">Afghanistan</option>
            <option value="AL">Albania</option>
            <option value="DZ">Algeria</option>
            <option value="AS">American Samoa</option>
            <option value="AD">Andorra</option>
            <option value="AO">Angola</option>
            <option value="AI">Anguilla</option>
            <option value="AQ">Antarctica</option>
            <option value="AG">Antigua and Barbuda</option>
            <option value="AR">Argentina</option>
            <option value="AM">Armenia</option>
            <option value="AW">Aruba</option>
            <option value="AU">Australia</option>
            <option value="AT">Austria</option>
            <option value="AZ">Azerbaijan</option>
            <option value="BS">Bahamas</option>
            <option value="BH">Bahrain</option>
            <option value="BD">Bangladesh</option>
            <option value="BB">Barbados</option>
            <option value="BY">Belarus</option>
            <option value="BE">Belgium</option>
            <option value="BZ">Belize</option>
            <option value="BJ">Benin</option>
            <option value="BM">Bermuda</option>
            <option value="BT">Bhutan</option>
            <option value="BO">Bolivia</option>
            <option value="BA">Bosnia and Herzegovina</option>
            <option value="BW">Botswana</option>
            <option value="BV">Bouvet Island</option>
            <option value="BR">Brazil</option>
            <option value="IO">British Indian Ocean Territory</option>
            <option value="BN">Brunei</option>
            <option value="BG">Bulgaria</option>
            <option value="BF">Burkina Faso</option>
            <option value="BI">Burundi</option>
            <option value="KH">Cambodia</option>
            <option value="CM">Cameroon</option>
            <option value="CA">Canada</option>
            <option value="CV">Cape Verde</option>
            <option value="KY">Cayman Islands</option>
            <option value="CF">Central African Republic</option>
            <option value="TD">Chad</option>
            <option value="CL">Chile</option>
            <option value="CN">China</option>
            <option value="CX">Christmas Island</option>
            <option value="CC">Cocos (Keeling) Islands</option>
            <option value="CO">Columbia</option>
            <option value="KM">Comoros</option>
            <option value="CG">Congo</option>
            <option value="CK">Cook Islands</option>
            <option value="CR">Costa Rica</option>
            <option value="CI">Cote D'Ivorie (Ivory Coast)</option>
            <option value="HR">Croatia (Hrvatska)</option>
            <option value="CU">Cuba</option>
            <option value="CY">Cyprus</option>
            <option value="CZ">Czech Republic</option>
            <option value="CD">Democratic Republic of Congo (Zaire)</option>
            <option value="DK">Denmark</option>
            <option value="DJ">Djibouti</option>
            <option value="DM">Dominica</option>
            <option value="DO">Dominican Republic</option>
            <option value="TP">East Timor</option>
            <option value="EC">Ecuador</option>
            <option value="EG">Egypt</option>
            <option value="SV">El Salvador</option>
            <option value="GQ">Equatorial Guinea</option>
            <option value="ER">Eritrea</option>
            <option value="EE">Estonia</option>
            <option value="ET">Ethiopia</option>
            <option value="FK">Falkland Islands (Malvinas)</option>
            <option value="FO">Faroe Islands</option>
            <option value="FJ">Fiji</option>
            <option value="FI">Finland</option>
            <option value="FR">France</option>
            <option value="FX">France), Metropolitanarray(</option>
            <option value="GF">French Guinea</option>
            <option value="PF">French Polynesia</option>
            <option value="TF">French Southern Territories</option>
            <option value="GA">Gabon</option>
            <option value="GM">Gambia</option>
            <option value="GE">Georgia</option>
            <option value="DE">Germany</option>
            <option value="GH">Ghana</option>
            <option value="GI">Gibraltar</option>
            <option value="GR">Greece</option>
            <option value="GL">Greenland</option>
            <option value="GD">Grenada</option>
            <option value="GP">Guadeloupe</option>
            <option value="GU">Guam</option>
            <option value="GT">Guatemala</option>
            <option value="GN">Guinea</option>
            <option value="GW">Guinea-Bissau</option>
            <option value="GY">Guyana</option>
            <option value="HT">Haiti</option>
            <option value="HM">Heard and McDonald Islands</option>
            <option value="HN">Honduras</option>
            <option value="HK">Hong Kong</option>
            <option value="HU">Hungary</option>
            <option value="IS">Iceland</option>
            <option value="IN">India</option>
            <option value="ID">Indonesia</option>
            <option value="IR">Iran</option>
            <option value="IQ">Iraq</option>
            <option value="IE">Ireland</option>
            <option value="IL">Israel</option>
            <option value="IT">Italy</option>
            <option value="JM">Jamaica</option>
            <option value="JP">Japan</option>
            <option value="JO">Jordan</option>
            <option value="KZ">Kazakhstan</option>
            <option value="KE">Kenya</option>
            <option value="KI">Kiribati</option>
            <option value="KW">Kuwait</option>
            <option value="KG">Kyrgyzstan</option>
            <option value="LA">Laos</option>
            <option value="LV">Latvia</option>
            <option value="LB">Lebanon</option>
            <option value="LS">Lesotho</option>
            <option value="LR">Liberia</option>
            <option value="LY">Libya</option>
            <option value="LI">Liechtenstein</option>
            <option value="LT">Lithuania</option>
            <option value="LU">Luxembourg</option>
            <option value="MO">Macau</option>
            <option value="MK">Macedonia</option>
            <option value="MG">Madagascar</option>
            <option value="MW">Malawi</option>
            <option value="MY">Malaysia</option>
            <option value="MV">Maldives</option>
            <option value="ML">Mali</option>
            <option value="MT">Malta</option>
            <option value="MH">Marshall Islands</option>
            <option value="MQ">Martinique</option>
            <option value="MR">Mauritania</option>
            <option value="MU">Mauritius</option>
            <option value="YT">Mayotte</option>
            <option value="MX">Mexico</option>
            <option value="FM">Micronesia</option>
            <option value="MD">Moldova</option>
            <option value="MC">Monaco</option>
            <option value="MN">Mongolia</option>
            <option value="MS">Montserrat</option>
            <option value="MA">Morocco</option>
            <option value="MZ">Mozambique</option>
            <option value="MM">Myanmar (Burma)</option>
            <option value="NA">Namibia</option>
            <option value="NR">Nauru</option>
            <option value="NP">Nepal</option>
            <option value="NL">Netherlands</option>
            <option value="AN">Netherlands Antilles</option>
            <option value="NC">New Caledonia</option>
            <option value="NZ">New Zealand</option>
            <option value="NI">Nicaragua</option>
            <option value="NE">Niger</option>
            <option value="NG">Nigeria</option>
            <option value="NU">Niue</option>
            <option value="NF">Norfolk Island</option>
            <option value="KP">North Korea</option>
            <option value="MP">Northern Mariana Islands</option>
            <option value="NO">Norway</option>
            <option value="OM">Oman</option>
            <option value="PK">Pakistan</option>
            <option value="PW">Palau</option>
            <option value="PA">Panama</option>
            <option value="PG">Papua New Guinea</option>
            <option value="PY">Paraguay</option>
            <option value="PE">Peru</option>
            <option value="PH">Philippines</option>
            <option value="PN">Pitcairn</option>
            <option value="PL">Poland</option>
            <option value="PT">Portugal</option>
            <option value="PR">Puerto Rico</option>
            <option value="QA">Qatar</option>
            <option value="RE">Reunion</option>
            <option value="RO">Romania</option>
            <option value="RU">Russia</option>
            <option value="RW">Rwanda</option>
            <option value="SH">Saint Helena</option>
            <option value="KN">Saint Kitts and Nevis</option>
            <option value="LC">Saint Lucia</option>
            <option value="PM">Saint Pierre and Miquelon</option>
            <option value="VC">Saint Vincent and The Grenadines</option>
            <option value="SM">San Marino</option>
            <option value="ST">Sao Tome and Principe</option>
            <option value="SA">Saudi Arabia</option>
            <option value="SN">Senegal</option>
            <option value="SC">Seychelles</option>
            <option value="SL">Sierra Leone</option>
            <option value="SG">Singapore</option>
            <option value="SK">Slovak Republic</option>
            <option value="SI">Slovenia</option>
            <option value="SB">Solomon Islands</option>
            <option value="SO">Somalia</option>
            <option value="ZA">South Africa</option>
            <option value="GS">South Georgia</option>
            <option value="KR">South Korea</option>
            <option value="ES">Spain</option>
            <option value="LK">Sri Lanka</option>
            <option value="SD">Sudan</option>
            <option value="SR">Suriname</option>
            <option value="SJ">Svalbard and Jan Mayen</option>
            <option value="SZ">Swaziland</option>
            <option value="SE">Sweden</option>
            <option value="CH">Switzerland</option>
            <option value="SY">Syria</option>
            <option value="TW">Taiwan</option>
            <option value="TJ">Tajikistan</option>
            <option value="TZ">Tanzania</option>
            <option value="TH">Thailand</option>
            <option value="TG">Togo</option>
            <option value="TK">Tokelau</option>
            <option value="TO">Tonga</option>
            <option value="TT">Trinidad and Tobago</option>
            <option value="TN">Tunisia</option>
            <option value="TR">Turkey</option>
            <option value="TM">Turkmenistan</option>
            <option value="TC">Turks and Caicos Islands</option>
            <option value="TV">Tuvalu</option>
            <option value="UG">Uganda</option>
            <option value="UA">Ukraine</option>
            <option value="AE">United Arab Emirates</option>
            <option value="UK">United Kingdom</option>
            <option value="US">United States of America</option>
            <option value="UM">United States Minor Outlying Islands</option>
            <option value="UY">Uruguay</option>
            <option value="UZ">Uzbekistan</option>
            <option value="VU">Vanuatu</option>
            <option value="VA">Vatican City (Holy See)</option>
            <option value="VE">Venezuela</option>
            <option value="VN">Vietnam</option>
            <option value="VG">Virgin Islands (British)</option>
            <option value="VI">Virgin Islands (US)</option>
            <option value="WF">Wallis and Futuna Islands</option>
            <option value="EH">Western Sahara</option>
            <option value="WS">Western Samoa</option>
            <option value="YE">Yemen</option>
            <option value="YU">Yugoslavia</option>
            <option value="ZM">Zambia</option>
            <option value="ZW">Zimbabwe</option>
        </select>

        <div class="formComponentSublabel"><p>Country</p></div>
    </div>
</div>
<div id="foursquareCheckInLatitude-wrapper" class="formComponent formComponentSingleLineText">
    <label id="foursquareCheckInLatitude-label" for="foursquareCheckInLatitude" class="formComponentLabel">Venue
        latitude:<span class="formComponentLabelRequiredStar"> *</span></label>
    <input type="text" id="foursquareCheckInLatitude" name="foursquareCheckInLatitude">
</div>
<div id="foursquareCheckInLongitude-wrapper" class="formComponent formComponentSingleLineText">
    <label id="foursquareCheckInLongitude-label" for="foursquareCheckInLongitude" class="formComponentLabel">Venue
        longitude:<span class="formComponentLabelRequiredStar"> *</span></label>
    <input type="text" id="foursquareCheckInLongitude" name="foursquareCheckInLongitude">
</div>
</div>
</div>