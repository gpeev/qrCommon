<div id="wiFiPage" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
    <div class="formPageDescription"><p style="margin: 0 0 .5em .5em;">We just rolled out an update to iOS
        (iPhone/iPad) that supports this QR code type. Our update for Android will be coming soon!</p>

        <p></p></div>
    <div id="wiFiPage-section1" class="formSection formSectionAnonymous">
        <div id="wiFiSsid-wrapper" class="formComponent formComponentSingleLineText">
            <label id="wiFiSsid-label" for="wiFiSsid" class="formComponentLabel">Wi-Fi
                SSID:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="wiFiSsid" name="wiFiSsid" onkeyup="
            $(&#39;.previewLayer.edit .wiFiSsid&#39;).text(&#39;Wi-Fi: &#39;+$(this).val());
        ">
        </div>
        <div id="wiFiPassword-wrapper" class="formComponent formComponentSingleLineText">
            <label id="wiFiPassword-label" for="wiFiPassword" class="formComponentLabel">Wi-Fi password
                (optional):
            </label>
            <input type="text" id="wiFiPassword" name="wiFiPassword" onkeyup="
            if($(this).val() != &#39;&#39;) {
                $(&#39;.previewLayer.edit .wiFiPassword&#39;).text(&#39;Password: &#39;+$(this).val());
            }
            else {
                $(&#39;.previewLayer.edit .wiFiPassword&#39;).text(&#39;No password&#39;);
            }
        ">
        </div>
        <div id="wiFiHiddenNetwork-wrapper" class="formComponent formComponentMultipleChoice">
            <div id="wiFiHiddenNetwork-choice1-wrapper" class="choiceWrapper">
                <input type="checkbox" id="wiFiHiddenNetwork-choice1" name="wiFiHiddenNetwork" value="true" class="choice" style="display: inline;">
                <label for="wiFiHiddenNetwork-choice1" class="choiceLabel" style="display: inline;">Hidden
                    network
                </label>
            </div>
        </div>
    </div>
</div>