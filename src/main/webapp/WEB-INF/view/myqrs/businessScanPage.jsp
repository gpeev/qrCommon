<div id="businessScanPage" class="formPage formPageInactive" style="width: 580px; display: block; ">
<div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
<div id="businessScanPage-section1" class="formSection formSectionAnonymous">
    <div id="businessScanPageProfilePicture-wrapper" class="formComponent formComponentDropDown" style="display: none;">
        <label id="businessScanPageProfilePicture-label" for="businessScanPageProfilePicture" class="formComponentLabel">
            Profile picture:<span class="formComponentLabelRequiredStar"> *</span>
        </label>

        <select id="businessScanPageProfilePicture" name="businessScanPageProfilePicture" class="formComponentDropDown">
            <option value="uploadFromComputer">Upload from Computer</option>
        </select>
    </div>
    <div id="businessScanPageProfilePictureFile-wrapper" class="formComponent formComponentFile" style="">
        <label id="businessScanPageProfilePictureFile-label" for="businessScanPageProfilePictureFile" class="formComponentLabel">
            Select an image file:<span class="formComponentLabelRequiredStar"> *</span>
        </label>

        <div class="pseudoFile">
            <input type="text" disabled="disabled">
            <button onclick="return false;" disabled="disabled">Browse...</button>
            <span class="pseudoFileAjaxStatus"></span>
        </div>
        <input type="file" id="businessScanPageProfilePictureFile" name="businessScanPageProfilePictureFile" class="file  hidden" size="15">
    </div>
    <div id="businessScanPageBlurredProfilePictureUrl-wrapper" class="formComponent formComponentHidden" style="display: none;">
        <input type="hidden" id="businessScanPageBlurredProfilePictureUrl" name="businessScanPageBlurredProfilePictureUrl" value="">
    </div>
    <div id="businessScanPageProfilePictureUrl-wrapper" class="formComponent formComponentHidden" style="display: none;">
        <input type="hidden" id="businessScanPageProfilePictureUrl" name="businessScanPageProfilePictureUrl" value="">
    </div>
    <div id="businessScanPageProfilePictureCropCoordinates-wrapper" class="formComponent formComponentHidden" style="display: none;">
        <input type="hidden" id="businessScanPageProfilePictureCropCoordinates" name="businessScanPageProfilePictureCropCoordinates" value="">
    </div>
    <div id="businessScanPageProfilePictureUuid-wrapper" class="formComponent formComponentHidden" style="display: none;">
        <input type="hidden" id="businessScanPageProfilePictureUuid" name="businessScanPageProfilePictureUuid" value="">
    </div>
    <div id="businessScanPagePictureOriginalUuid-wrapper" class="formComponent formComponentHidden" style="display: none;">
        <input type="hidden" id="businessScanPagePictureOriginalUuid" name="businessScanPagePictureOriginalUuid" value="">
    </div>
    <div id="businessScanPageBackground-wrapper" class="formComponent formComponentDropDown">
        <label id="businessScanPageBackground-label" for="businessScanPageBackground" class="formComponentLabel">
            Background:<span class="formComponentLabelRequiredStar"> *</span></label>

        <select id="businessScanPageBackground" name="businessScanPageBackground" class="formComponentDropDown">
            <option value="softGrain">Soft Grain</option>
            <option value="stripes">Stripes</option>
            <option value="linen">Linen</option>
            <option value="scanGrey">Scan Grey</option>
            <option value="profilePictureBlurredAndFaded" disabled="disabled">Profile Picture Blurred and Faded</option>
        </select>
    </div>
    <div id="businessScanPageName-wrapper" class="formComponent formComponentSingleLineText">
        <label id="businessScanPageName-label" for="businessScanPageName" class="formComponentLabel">
            Name:<span class="formComponentLabelRequiredStar"> *</span>
        </label>

        <input type="text" id="businessScanPageName" name="businessScanPageName" onkeyup="
            $(&#39;.previewLayer.edit.businessScanPage .title&#39;).html($(this).val());
            $(&#39;.previewLayer.edit.businessScanPage .name&#39;).html($(this).val());
            $(&#39;.previewLayer.edit.businessScanPage .sendContactName&#39;).html($(this).val().split(&#39; &#39;)[0]);">
    </div>
    <div id="businessScanPageBio-wrapper" class="formComponent formComponentTextArea">
        <label id="businessScanPageBio-label" for="businessScanPageBio" class="formComponentLabel">Bio:
        </label>
        <textarea id="businessScanPageBio" name="businessScanPageBio" class="textArea" onkeyup="
            $(&#39;.previewLayer.edit.businessScanPage .bio&#39;).html($(this).val().newLinesToBreakTags());
        " maxlength="64"></textarea></div>
    <div id="businessScanPageWebsite-wrapper" class="formComponent formComponentSingleLineText">
        <label id="businessScanPageWebsite-label" for="businessScanPageWebsite" class="formComponentLabel">Website:
        </label>

        <input type="text" id="businessScanPageWebsite" name="businessScanPageWebsite" onkeyup="
            var newValue = $(this).val()
                .replace(&#39;http://&#39;, &#39;&#39;)
                .replace(&#39;https://&#39;, &#39;&#39;)
                .replace(/\/$/, &#39;&#39;);
            $(&#39;.previewLayer.edit.businessScanPage .website a&#39;).html(newValue);">
    </div>
</div>
<div id="businessScanPageCustomButtons" class="formSection customButtonSection">
    <div class="formSectionTitle"><h3>Custom Buttons</h3></div>
    <div id="businessScanPageCustomButtonType-wrapper" class="formComponent formComponentDropDown">
        <label id="businessScanPageCustomButtonType-label" for="businessScanPageCustomButtonType" class="formComponentLabel">
            Type:
        </label>

        <select id="businessScanPageCustomButtonType" name="businessScanPageCustomButtonType" class="formComponentDropDown">
            <option value="website">Website</option>
            <option value="phone">Phone</option>
            <option value="sms">Text message</option>
            <option value="email">E-Mail</option>
        </select>
    </div>
    <div id="businessScanPageCustomButtonText-wrapper" class="formComponent formComponentSingleLineText">
        <label id="businessScanPageCustomButtonText-label" for="businessScanPageCustomButtonText" class="formComponentLabel">
            Button text:
        </label>

        <input type="text" id="businessScanPageCustomButtonText" name="businessScanPageCustomButtonText" value="visit us" onkeyup="QrCodeGenerator.updateBusinessScanPage();">
    </div>
    <div id="businessScanPageCustomButtonValue-wrapper" class="formComponent formComponentSingleLineText">
        <label id="businessScanPageCustomButtonValue-label" for="businessScanPageCustomButtonValue" class="formComponentLabel">
            URL:
        </label>

        <input type="text" id="businessScanPageCustomButtonValue" name="businessScanPageCustomButtonValue">
    </div>
</div>
<button id="businessScanPageCustomButtons-addInstance" class="formSectionAddInstanceButton">Add
    Another
</button>
<div id="businessScanPage-section3" class="formSection formSectionAnonymous">
    <div id="businessScanPageSocialButtons-wrapper" class="formComponent formComponentMultipleChoice">
        <label id="businessScanPageSocialButtons-label" for="businessScanPageSocialButtons" class="formComponentLabel">
            Social media buttons: <span style="font-style: italic; font-size: 12px;">(pick up to three)</span>
        </label>

        <div id="businessScanPageSocialButtons-choice1-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice1" name="businessScanPageSocialButtons" value="facebook" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice1" class="socialButtonChoice facebookBackground" style="display: inline;">
                <span>Facebook</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice2-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice2" name="businessScanPageSocialButtons" value="twitter" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice2" class="socialButtonChoice twitterBackground" style="display: inline;">
                <span>Twitter</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice3-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice3" name="businessScanPageSocialButtons" value="pinterest" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice3" class="socialButtonChoice pinterestBackground" style="display: inline;">
                <span>Pinterest</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice4-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice4" name="businessScanPageSocialButtons" value="googlePlus" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice4" class="socialButtonChoice googlePlusBackground" style="display: inline;">
                <span>Google+</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice5-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice5" name="businessScanPageSocialButtons" value="vimeo" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice5" class="socialButtonChoice vimeoBackground" style="display: inline;">
                <span>Vimeo</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice6-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice6" name="businessScanPageSocialButtons" value="angelList" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice6" class="socialButtonChoice angelListBackground" style="display: inline;">
                <span>AngelList</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice7-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice7" name="businessScanPageSocialButtons" value="flickr" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice7" class="socialButtonChoice flickrBackground" style="display: inline;">
                <span>Flickr</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice8-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice8" name="businessScanPageSocialButtons" value="yelp" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice8" class="socialButtonChoice yelpBackground" style="display: inline;">
                <span>Yelp</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice9-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice9" name="businessScanPageSocialButtons" value="youTube" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice9" class="socialButtonChoice youTubeBackground" style="display: inline;">
                <span>YouTube</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice10-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice10" name="businessScanPageSocialButtons" value="linkedIn" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice10" class="socialButtonChoice linkedInBackground" style="display: inline;">
                <span>LinkedIn</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice11-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice11" name="businessScanPageSocialButtons" value="foursquare" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice11" class="socialButtonChoice foursquareBackground" style="display: inline;">
                <span>Foursquare</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice12-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice12" name="businessScanPageSocialButtons" value="dribbble" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice12" class="socialButtonChoice dribbbleBackground" style="display: inline;">
                <span>Dribbble</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice13-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice13" name="businessScanPageSocialButtons" value="tumblr" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice13" class="socialButtonChoice tumblrBackground" style="display: inline;">
                <span>Tumblr</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice14-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice14" name="businessScanPageSocialButtons" value="instagram" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice14" class="socialButtonChoice instagramBackground" style="display: inline;">
                <span>Instagram</span></label>
        </div>
        <div id="businessScanPageSocialButtons-choice15-wrapper" class="choiceWrapper">
            <input type="checkbox" id="businessScanPageSocialButtons-choice15" name="businessScanPageSocialButtons" value="github" class="choice" style="display: inline;">
            <label for="businessScanPageSocialButtons-choice15" class="socialButtonChoice githubBackground" style="display: inline;">
                <span>Github</span></label>
        </div>
    </div>
    <div id="businessScanPageSocialButtonFacebook-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonFacebook-label" for="businessScanPageSocialButtonFacebook" class="formComponentLabel">
            Facebook URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonFacebook-prependLabel" class="formPrependLabel">http://www.facebook.com/</span>

        <input type="text" id="businessScanPageSocialButtonFacebook" name="businessScanPageSocialButtonFacebook" style="width: 157px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonTwitter-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonTwitter-label" for="businessScanPageSocialButtonTwitter" class="formComponentLabel">
            Twitter username:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonTwitter-prependLabel" class="formPrependLabel">@</span>

        <input type="text" id="businessScanPageSocialButtonTwitter" name="businessScanPageSocialButtonTwitter" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonPinterest-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonPinterest-label" for="businessScanPageSocialButtonPinterest" class="formComponentLabel">
            Pinterest username:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonPinterest-prependLabel" class="formPrependLabel">http://pinterest.com/</span>

        <input type="text" id="businessScanPageSocialButtonPinterest" name="businessScanPageSocialButtonPinterest" style="width: 191px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonGooglePlus-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonGooglePlus-label" for="businessScanPageSocialButtonGooglePlus" class="formComponentLabel">
            Google+ URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonGooglePlus-prependLabel" class="formPrependLabel">https://plus.google.com/</span>

        <input type="text" id="businessScanPageSocialButtonGooglePlus" name="businessScanPageSocialButtonGooglePlus" style="width: 167px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonVimeo-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonVimeo-label" for="businessScanPageSocialButtonVimeo" class="formComponentLabel">
            Vimeo URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonVimeo-prependLabel" class="formPrependLabel">http://vimeo.com/</span>

        <input type="text" id="businessScanPageSocialButtonVimeo" name="businessScanPageSocialButtonVimeo" style="width: 209px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonAngelList-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonAngelList-label" for="businessScanPageSocialButtonAngelList" class="formComponentLabel">
            AngelList URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonAngelList-prependLabel" class="formPrependLabel">http://angel.co/</span>

        <input type="text" id="businessScanPageSocialButtonAngelList" name="businessScanPageSocialButtonAngelList" style="width: 222px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonFlickr-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonFlickr-label" for="businessScanPageSocialButtonFlickr" class="formComponentLabel">
            Flickr URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonFlickr-prependLabel" class="formPrependLabel">http://www.flickr.com/photos/</span>

        <input type="text" id="businessScanPageSocialButtonFlickr" name="businessScanPageSocialButtonFlickr" style="width: 140px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonYelp-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonYelp-label" for="businessScanPageSocialButtonYelp" class="formComponentLabel">
            Yelp URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonYelp-prependLabel" class="formPrependLabel">..user_details?userid=</span>

        <input type="text" id="businessScanPageSocialButtonYelp" name="businessScanPageSocialButtonYelp" style="width: 178px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonYouTube-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonYouTube-label" for="businessScanPageSocialButtonYouTube" class="formComponentLabel">
            YouTube URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonYouTube-prependLabel" class="formPrependLabel">http://www.youtube.com/user/</span>

        <input type="text" id="businessScanPageSocialButtonYouTube" name="businessScanPageSocialButtonYouTube" style="width: 134px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonLinkedIn-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonLinkedIn-label" for="businessScanPageSocialButtonLinkedIn" class="formComponentLabel">
            LinkedIn URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonLinkedIn-prependLabel" class="formPrependLabel">http://www.linkedin.com/</span>

        <input type="text" id="businessScanPageSocialButtonLinkedIn" name="businessScanPageSocialButtonLinkedIn" style="width: 109px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonFoursquare-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonFoursquare-label" for="businessScanPageSocialButtonFoursquare" class="formComponentLabel">
            Foursquare URL:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonFoursquare-prependLabel" class="formPrependLabel">https://foursquare.com/</span>

        <input type="text" id="businessScanPageSocialButtonFoursquare" name="businessScanPageSocialButtonFoursquare" style="width: 172px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonDribbble-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonDribbble-label" for="businessScanPageSocialButtonDribbble" class="formComponentLabel">
            Dribbble username:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonDribbble-prependLabel" class="formPrependLabel">http://dribbble.com/</span>

        <input type="text" id="businessScanPageSocialButtonDribbble" name="businessScanPageSocialButtonDribbble" style="width: 198px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonTumblr-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonTumblr-label" for="businessScanPageSocialButtonTumblr" class="formComponentLabel">
            Tumblr URL:<span class="formComponentLabelRequiredStar"> *</span></label>

        <input type="text" id="businessScanPageSocialButtonTumblr" name="businessScanPageSocialButtonTumblr" style="width: 245px;" class="formAppendLabel defaultValue">
        <span id="businessScanPageSocialButtonTumblr-appendLabel" class="formAppendLabel">.tumblr.com</span>
    </div>
    <div id="businessScanPageSocialButtonInstagram-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonInstagram-label" for="businessScanPageSocialButtonInstagram" class="formComponentLabel">
            Instagram Username:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonInstagram-prependLabel" class="formPrependLabel">http://gramfeed.com/</span>

        <input type="text" id="businessScanPageSocialButtonInstagram" name="businessScanPageSocialButtonInstagram" style="width: 189px;" class="defaultValue">
    </div>
    <div id="businessScanPageSocialButtonGithub-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
        <label id="businessScanPageSocialButtonGithub-label" for="businessScanPageSocialButtonGithub" class="formComponentLabel">
            Github username:<span class="formComponentLabelRequiredStar"> *</span>
        </label>
        <span id="businessScanPageSocialButtonGithub-prependLabel" class="formPrependLabel">http://github.com/</span>

        <input type="text" id="businessScanPageSocialButtonGithub" name="businessScanPageSocialButtonGithub" style="width: 211px;" class="defaultValue">
    </div>
</div>
</div>