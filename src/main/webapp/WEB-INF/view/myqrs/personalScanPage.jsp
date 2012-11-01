<div id="personalScanPage" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
    <div id="personalScanPage-section1" class="formSection formSectionAnonymous">
        <div id="personalScanPageProfilePicture-wrapper" class="formComponent formComponentDropDown">
            <label id="personalScanPageProfilePicture-label" for="personalScanPageProfilePicture" class="formComponentLabel">
                Profile picture:<span class="formComponentLabelRequiredStar"> *</span></label>
            <select id="personalScanPageProfilePicture" name="personalScanPageProfilePicture" class="formComponentDropDown">
                <option value="gravatar">Use My Gravatar</option>
                <option value="uploadFromComputer">Upload from Computer</option>
            </select>
        </div>
        <div id="personalScanPageProfilePictureFile-wrapper" class="formComponent formComponentFile formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageProfilePictureFile-label" for="personalScanPageProfilePictureFile" class="formComponentLabel">
                Select an image file- ooooooooo:<span class="formComponentLabelRequiredStar"> *</span></label>

            <div class="pseudoFile">
                <input type="text" disabled="disabled">
                <button onclick="return false;" disabled="disabled">Browse...</button>
                <span class="pseudoFileAjaxStatus"></span></div>
            <input type="file" id="personalScanPageProfilePictureFile" name="personalScanPageProfilePictureFile" class="file  hidden" size="15">
        </div>
        <div id="personalScanPageBlurredProfilePictureUrl-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="personalScanPageBlurredProfilePictureUrl" name="personalScanPageBlurredProfilePictureUrl" value="">
        </div>
        <div id="personalScanPageProfilePictureUrl-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="personalScanPageProfilePictureUrl" name="personalScanPageProfilePictureUrl" value="">
        </div>
        <div id="personalScanPageProfilePictureCropCoordinates-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="personalScanPageProfilePictureCropCoordinates" name="personalScanPageProfilePictureCropCoordinates" value="">
        </div>
        <div id="personalScanPageProfilePictureUuid-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="personalScanPageProfilePictureUuid" name="personalScanPageProfilePictureUuid" value="">
        </div>
        <div id="personalScanPagePictureOriginalUuid-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="personalScanPagePictureOriginalUuid" name="personalScanPagePictureOriginalUuid" value="">
        </div>
        <div id="personalScanPageBackground-wrapper" class="formComponent formComponentDropDown">
            <label id="personalScanPageBackground-label" for="personalScanPageBackground" class="formComponentLabel">
                Background:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <select id="personalScanPageBackground" name="personalScanPageBackground" class="formComponentDropDown">
                <option value="softGrain">Soft Grain</option>
                <option value="stripes">Stripes</option>
                <option value="linen">Linen</option>
                <option value="scanGrey">Scan Grey</option>
                <option value="profilePictureBlurredAndFaded" disabled="disabled">Profile Picture Blurred and
                    Faded
                </option>
            </select>
        </div>
        <div id="personalScanPageName-wrapper" class="formComponent formComponentSingleLineText">
            <label id="personalScanPageName-label" for="personalScanPageName" class="formComponentLabel">
                Name:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="personalScanPageName" name="personalScanPageName" onkeyup="
            $(&#39;.previewLayer.edit.personalScanPage .title&#39;).html($(this).val());
            $(&#39;.previewLayer.edit.personalScanPage .name&#39;).html($(this).val());
            $(&#39;.previewLayer.edit.personalScanPage .sendContactName&#39;).html($(this).val().split(&#39; &#39;)[0]);
        ">
        </div>
        <div id="personalScanPageBio-wrapper" class="formComponent formComponentTextArea">
            <label id="personalScanPageBio-label" for="personalScanPageBio" class="formComponentLabel">Bio:</label>
            <textarea id="personalScanPageBio" name="personalScanPageBio" class="textArea" onkeyup="
            $(&#39;.previewLayer.edit.personalScanPage .bio&#39;).html($(this).val().newLinesToBreakTags());
        " maxlength="64"></textarea></div>
        <div id="personalScanPageWebsite-wrapper" class="formComponent formComponentSingleLineText">
            <label id="personalScanPageWebsite-label" for="personalScanPageWebsite" class="formComponentLabel">
                Website:
            </label>
            <input type="text" id="personalScanPageWebsite" name="personalScanPageWebsite" onkeyup="
            var newValue = $(this).val()
                .replace(&#39;http://&#39;, &#39;&#39;)
                .replace(&#39;https://&#39;, &#39;&#39;)
                .replace(/\/$/, &#39;&#39;);

            $(&#39;.previewLayer.edit.personalScanPage .website a&#39;).html(newValue);
        ">
        </div>
        <div id="personalScanPagePhonePrimary-wrapper" class="formComponent formComponentSingleLineText">
            <label id="personalScanPagePhonePrimary-label" for="personalScanPagePhonePrimary" class="formComponentLabel">
                Phone
                (primary):
            </label>
            <input type="text" id="personalScanPagePhonePrimary" name="personalScanPagePhonePrimary" onkeyup="QrCodeGenerator.updatePersonalScanPageContactButtons();">
        </div>
        <div id="personalScanPagePhoneMobile-wrapper" class="formComponent formComponentSingleLineText">
            <label id="personalScanPagePhoneMobile-label" for="personalScanPagePhoneMobile" class="formComponentLabel">
                Phone
                (mobile):
            </label>
            <input type="text" id="personalScanPagePhoneMobile" name="personalScanPagePhoneMobile" onkeyup="QrCodeGenerator.updatePersonalScanPageContactButtons();">
        </div>
        <div id="personalScanPageEmail-wrapper" class="formComponent formComponentSingleLineText">
            <label id="personalScanPageEmail-label" for="personalScanPageEmail" class="formComponentLabel">
                E-mail:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="personalScanPageEmail" name="personalScanPageEmail" onkeyup="QrCodeGenerator.updatePersonalScanPageContactButtons();">

            <div id="personalScanPageEmail-description" class="formComponentDescription">
                <p>Visit
                    <a href="http://gravatar.com/" target="_blank">Gravatar</a>
                    to setup an image for your
                    e-mail address.
                </p>
            </div>
        </div>
        <div id="personalScanPageSocialButtons-wrapper" class="formComponent formComponentMultipleChoice">
            <label id="personalScanPageSocialButtons-label" for="personalScanPageSocialButtons" class="formComponentLabel">
                Social media buttons: <span style="font-style: italic; font-size: 12px;">(pick up to three)</span>
            </label>

            <div id="personalScanPageSocialButtons-choice1-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice1" name="personalScanPageSocialButtons" value="facebook" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice1" class="socialButtonChoice facebookBackground" style="display: inline;">
                    <span>Facebook</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice2-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice2" name="personalScanPageSocialButtons" value="twitter" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice2" class="socialButtonChoice twitterBackground" style="display: inline;">
                    <span>Twitter</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice3-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice3" name="personalScanPageSocialButtons" value="pinterest" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice3" class="socialButtonChoice pinterestBackground" style="display: inline;">
                    <span>Pinterest</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice4-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice4" name="personalScanPageSocialButtons" value="googlePlus" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice4" class="socialButtonChoice googlePlusBackground" style="display: inline;">
                    <span>Google+</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice5-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice5" name="personalScanPageSocialButtons" value="vimeo" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice5" class="socialButtonChoice vimeoBackground" style="display: inline;">
                    <span>Vimeo</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice6-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice6" name="personalScanPageSocialButtons" value="angelList" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice6" class="socialButtonChoice angelListBackground" style="display: inline;">
                    <span>AngelList</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice7-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice7" name="personalScanPageSocialButtons" value="flickr" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice7" class="socialButtonChoice flickrBackground" style="display: inline;">
                    <span>Flickr</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice8-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice8" name="personalScanPageSocialButtons" value="yelp" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice8" class="socialButtonChoice yelpBackground" style="display: inline;">
                    <span>Yelp</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice9-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice9" name="personalScanPageSocialButtons" value="youTube" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice9" class="socialButtonChoice youTubeBackground" style="display: inline;">
                    <span>YouTube</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice10-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice10" name="personalScanPageSocialButtons" value="linkedIn" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice10" class="socialButtonChoice linkedInBackground" style="display: inline;">
                    <span>LinkedIn</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice11-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice11" name="personalScanPageSocialButtons" value="foursquare" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice11" class="socialButtonChoice foursquareBackground" style="display: inline;">
                    <span>Foursquare</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice12-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice12" name="personalScanPageSocialButtons" value="dribbble" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice12" class="socialButtonChoice dribbbleBackground" style="display: inline;">
                    <span>Dribbble</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice13-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice13" name="personalScanPageSocialButtons" value="tumblr" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice13" class="socialButtonChoice tumblrBackground" style="display: inline;">
                    <span>Tumblr</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice14-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice14" name="personalScanPageSocialButtons" value="instagram" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice14" class="socialButtonChoice instagramBackground" style="display: inline;">
                    <span>Instagram</span></label>
            </div>
            <div id="personalScanPageSocialButtons-choice15-wrapper" class="choiceWrapper">
                <input type="checkbox" id="personalScanPageSocialButtons-choice15" name="personalScanPageSocialButtons" value="github" class="choice" style="display: inline;">
                <label for="personalScanPageSocialButtons-choice15" class="socialButtonChoice githubBackground" style="display: inline;">
                    <span>Github</span></label>
            </div>
        </div>
        <div id="personalScanPageSocialButtonFacebook-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonFacebook-label" for="personalScanPageSocialButtonFacebook" class="formComponentLabel">
                Facebook URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonFacebook-prependLabel" class="formPrependLabel">http://www.facebook.com/</span>
            <input type="text" id="personalScanPageSocialButtonFacebook" name="personalScanPageSocialButtonFacebook" style="width: 157px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonTwitter-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonTwitter-label" for="personalScanPageSocialButtonTwitter" class="formComponentLabel">
                Twitter username:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonTwitter-prependLabel" class="formPrependLabel">@</span>
            <input type="text" id="personalScanPageSocialButtonTwitter" name="personalScanPageSocialButtonTwitter" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonPinterest-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonPinterest-label" for="personalScanPageSocialButtonPinterest" class="formComponentLabel">
                Pinterest username:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonPinterest-prependLabel" class="formPrependLabel">http://pinterest.com/</span>
            <input type="text" id="personalScanPageSocialButtonPinterest" name="personalScanPageSocialButtonPinterest" style="width: 191px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonGooglePlus-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonGooglePlus-label" for="personalScanPageSocialButtonGooglePlus" class="formComponentLabel">
                Google+ URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonGooglePlus-prependLabel" class="formPrependLabel">https://plus.google.com/</span>
            <input type="text" id="personalScanPageSocialButtonGooglePlus" name="personalScanPageSocialButtonGooglePlus" style="width: 167px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonVimeo-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonVimeo-label" for="personalScanPageSocialButtonVimeo" class="formComponentLabel">
                Vimeo URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonVimeo-prependLabel" class="formPrependLabel">http://vimeo.com/</span>
            <input type="text" id="personalScanPageSocialButtonVimeo" name="personalScanPageSocialButtonVimeo" style="width: 209px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonAngelList-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonAngelList-label" for="personalScanPageSocialButtonAngelList" class="formComponentLabel">
                AngelList URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonAngelList-prependLabel" class="formPrependLabel">http://angel.co/</span>
            <input type="text" id="personalScanPageSocialButtonAngelList" name="personalScanPageSocialButtonAngelList" style="width: 222px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonFlickr-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonFlickr-label" for="personalScanPageSocialButtonFlickr" class="formComponentLabel">
                Flickr URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonFlickr-prependLabel" class="formPrependLabel">http://www.flickr.com/photos/</span>
            <input type="text" id="personalScanPageSocialButtonFlickr" name="personalScanPageSocialButtonFlickr" style="width: 140px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonYelp-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonYelp-label" for="personalScanPageSocialButtonYelp" class="formComponentLabel">
                Yelp URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonYelp-prependLabel" class="formPrependLabel">..user_details?userid=</span>
            <input type="text" id="personalScanPageSocialButtonYelp" name="personalScanPageSocialButtonYelp" style="width: 178px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonYouTube-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonYouTube-label" for="personalScanPageSocialButtonYouTube" class="formComponentLabel">
                YouTube URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonYouTube-prependLabel" class="formPrependLabel">http://www.youtube.com/user/</span>
            <input type="text" id="personalScanPageSocialButtonYouTube" name="personalScanPageSocialButtonYouTube" style="width: 134px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonLinkedIn-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonLinkedIn-label" for="personalScanPageSocialButtonLinkedIn" class="formComponentLabel">
                LinkedIn URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonLinkedIn-prependLabel" class="formPrependLabel">http://www.linkedin.com/</span>
            <input type="text" id="personalScanPageSocialButtonLinkedIn" name="personalScanPageSocialButtonLinkedIn" style="width: 155px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonFoursquare-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonFoursquare-label" for="personalScanPageSocialButtonFoursquare" class="formComponentLabel">
                Foursquare URL:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonFoursquare-prependLabel" class="formPrependLabel">https://foursquare.com/</span>
            <input type="text" id="personalScanPageSocialButtonFoursquare" name="personalScanPageSocialButtonFoursquare" style="width: 172px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonDribbble-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonDribbble-label" for="personalScanPageSocialButtonDribbble" class="formComponentLabel">
                Dribbble username:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonDribbble-prependLabel" class="formPrependLabel">http://dribbble.com/</span>
            <input type="text" id="personalScanPageSocialButtonDribbble" name="personalScanPageSocialButtonDribbble" style="width: 198px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonTumblr-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonTumblr-label" for="personalScanPageSocialButtonTumblr" class="formComponentLabel">
                Tumblr URL:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="personalScanPageSocialButtonTumblr" name="personalScanPageSocialButtonTumblr" style="width: 245px;" class="formAppendLabel defaultValue">
            <span id="personalScanPageSocialButtonTumblr-appendLabel" class="formAppendLabel">.tumblr.com</span>
        </div>
        <div id="personalScanPageSocialButtonInstagram-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonInstagram-label" for="personalScanPageSocialButtonInstagram" class="formComponentLabel">
                Instagram Username:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonInstagram-prependLabel" class="formPrependLabel">http://gramfeed.com/</span>
            <input type="text" id="personalScanPageSocialButtonInstagram" name="personalScanPageSocialButtonInstagram" style="width: 189px;" class="defaultValue">
        </div>
        <div id="personalScanPageSocialButtonGithub-wrapper" class="formComponent formComponentSingleLineText formComponentValidationPassed" style="display: none; ">
            <label id="personalScanPageSocialButtonGithub-label" for="personalScanPageSocialButtonGithub" class="formComponentLabel">
                Github username:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <span id="personalScanPageSocialButtonGithub-prependLabel" class="formPrependLabel">http://github.com/</span>
            <input type="text" id="personalScanPageSocialButtonGithub" name="personalScanPageSocialButtonGithub" style="width: 211px;" class="defaultValue">
        </div>
    </div>
</div>
