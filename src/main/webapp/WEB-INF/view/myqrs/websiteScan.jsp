<div id="websitePage" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle">
        <h2 style="display: none;">Enter Content</h2>
    </div>
    <div id="websitePage-section1" class="formSection formSectionAnonymous">
        <div id="website-wrapper" class="formComponent formComponentSingleLineText">
            <label id="website-label" for="website" class="formComponentLabel">
                Enter the URL you would like your code to direct to:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <input type="text" id="website" name="website" onkeyup="$(&#39;.previewLayer.edit .website&#39;).html($(this).val());">
        </div>
    </div>
</div>