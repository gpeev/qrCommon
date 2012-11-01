<div id="customizeCodePage" class="formPage formPageInactive" style="width: 580px; ">
    <div class="formPageTitle"><h2 style="display: none;">Customize Code</h2></div>
    <div class="formPageDescription" style="background-color: #FFFFFF">
        <div class="customizeCodePreview" style="background-color: #FFFFFF">
            <div class="customizeCodePreviewCode" style="background-color: #FFFFFF">
                <img src="" alt="" style="background-color: #FFFFFF">
            </div>
            <div class="customizeCodePreviewCodeLoader"></div>
        </div>
    </div>
    <div id="customizeCodePage-section1" class="formSection formSectionAnonymous">
        <div id="customizeCodeStyle-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="customizeCodeStyle" name="customizeCodeStyle" value="">
        </div>
        <div id="customizeCodeUserToken-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="customizeCodeUserToken" name="customizeCodeUserToken" value="wuXc3R1ZuZlLV28tMG1V4vjj37o3MU3G">
        </div>
        <div id="customizeCodeShortReference-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="customizeCodeShortReference" name="customizeCodeShortReference" value="">
        </div>
        <div id="customizeCodeScannableId-wrapper" class="formComponent formComponentHidden" style="display: none;">
            <input type="hidden" id="customizeCodeScannableId" name="customizeCodeScannableId" value="">
        </div>
        <div id="title-wrapper" class="formComponent formComponentSingleLineText">
            <label id="title-label" for="title" class="formComponentLabel">Please
                enter a title for your code:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="title" name="title">
        </div>
        <div id="customizeCodeHeaderText-wrapper" class="formComponent formComponentSingleLineText">
            <label id="customizeCodeHeaderText-label" for="customizeCodeHeaderText" class="formComponentLabel">Header
                text:
            </label>
            <input type="text" id="customizeCodeHeaderText" name="customizeCodeHeaderText">

            <div class="formComponentSubLabel">
                <p>
                    <a onclick="$(&#39;#customizeCodeHeaderText&#39;).data(&#39;previousValue&#39;, $(&#39;#customizeCodeHeaderText&#39;).val()).val(&#39;&#39;).trigger(&#39;change&#39;);">
                        Clear
                    </a>
                    /
                    <a onclick="$(&#39;#customizeCodeHeaderText&#39;).val($(&#39;#customizeCodeHeaderText&#39;).data(&#39;previousValue&#39;)).trigger(&#39;change&#39;);">
                        Undo
                        Clear
                    </a>
                </p>
            </div>
        </div>
        <div id="customizeCodeFooterText-wrapper" class="formComponent formComponentSingleLineText">
            <label id="customizeCodeFooterText-label" for="customizeCodeFooterText" class="formComponentLabel">Footer
                text:
            </label>
            <input type="text" id="customizeCodeFooterText" name="customizeCodeFooterText" value="download free app at get.scan.me">

            <div class="formComponentSubLabel">
                <p>
                    <a onclick="$(&#39;#customizeCodeFooterText&#39;).data(&#39;previousValue&#39;, $(&#39;#customizeCodeFooterText&#39;).val()).val(&#39;&#39;).trigger(&#39;change&#39;);">
                        Clear
                    </a>
                    /
                    <a onclick="$(&#39;#customizeCodeFooterText&#39;).val($(&#39;#customizeCodeFooterText&#39;).data(&#39;previousValue&#39;)).trigger(&#39;change&#39;);">
                        Undo
                        Clear
                    </a>
                </p>
            </div>
        </div>
        <div id="customizeCodeBorder-wrapper" class="formComponent formComponentMultipleChoice" style="clear: left; padding-right: 0;">
            <div id="customizeCodeBorder-choice1-wrapper" class="choiceWrapper">
                <input type="checkbox" id="customizeCodeBorder-choice1" name="customizeCodeBorder" value="true" class="choice" style="display: inline;" checked="checked">
                <label for="customizeCodeBorder-choice1" class="choiceLabel" style="display: inline;">Border</label>
            </div>
        </div>
        <div id="customizeCodeLogo-wrapper" class="formComponent formComponentMultipleChoice" style="clear: none; padding-right: 0;">
            <div id="customizeCodeLogo-choice1-wrapper" class="choiceWrapper">
                <input type="checkbox" id="customizeCodeLogo-choice1" name="customizeCodeLogo" value="true" class="choice" style="display: inline;" checked="checked">
                <label for="customizeCodeLogo-choice1" class="choiceLabel" style="display: inline;">Scan
                    badge
                </label>
            </div>
        </div>
        <div id="customizeCodeCaption-wrapper" class="formComponent formComponentMultipleChoice" style="clear: none; padding-right: 0;">
            <div id="customizeCodeCaption-choice1-wrapper" class="choiceWrapper">
                <input type="checkbox" id="customizeCodeCaption-choice1" name="customizeCodeCaption" value="true" class="choice" style="display: inline;" checked="checked">
                <label for="customizeCodeCaption-choice1" class="choiceLabel" style="display: inline;">URL</label>
            </div>
        </div>
        <div id="customizeCodeBadgeType-wrapper" class="formComponent formComponentDropDown formComponentValidationPassed" style="display: none; ">
            <label id="customizeCodeBadgeType-label" for="customizeCodeBadgeType" class="formComponentLabel">Badge Type:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <select id="customizeCodeBadgeType" name="customizeCodeBadgeType" class="formComponentDropDown">
                <option value="scan" selected="selected">Scan</option>
                <option value="social">Social Circles</option>
            </select>
        </div>
        <div id="customizeCodeBlockColor-wrapper" class="formComponent formComponentSingleLineText">
            <label id="customizeCodeBlockColor-label" for="customizeCodeBlockColor" class="formComponentLabel">Block
                color:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBlockColor" name="customizeCodeBlockColor" value="60666D">

            <div id="customizeCodeBlockColor-description" class="formComponentDescription">
                <div id="qrCodeGeneratorColorPicker"></div>
            </div>
        </div>
        <div id="customizeCodeBlockShape-wrapper" class="formComponent formComponentDropDown">
            <label id="customizeCodeBlockShape-label" for="customizeCodeBlockShape" class="formComponentLabel">Block
                shape:<span class="formComponentLabelRequiredStar"> *</span></label>
            <select id="customizeCodeBlockShape" name="customizeCodeBlockShape" class="formComponentDropDown">
                <option value="square" selected="selected">Square</option>
                <option value="circle">Circle</option>
                <option value="rounded">Rounded</option>
            </select>
        </div>
        <div id="customizeCodeBlockPadding-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeBlockPadding-label" for="customizeCodeBlockPadding" class="formComponentLabel">Block
                padding:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBlockPadding" name="customizeCodeBlockPadding" value="0">
        </div>
        <div id="customizeCodeBlockStroke-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeBlockStroke-label" for="customizeCodeBlockStroke" class="formComponentLabel">Block
                stroke:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBlockStroke" name="customizeCodeBlockStroke" value="0">
        </div>
        <div id="customizeCodeBlockCornerRadius-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeBlockCornerRadius-label" for="customizeCodeBlockCornerRadius" class="formComponentLabel">
                Block
                corner radius:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBlockCornerRadius" name="customizeCodeBlockCornerRadius" value="0">
        </div>
        <div id="customizeCodeBlockCurveStrength-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeBlockCurveStrength-label" for="customizeCodeBlockCurveStrength" class="formComponentLabel">
                Block
                curve strength:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBlockCurveStrength" name="customizeCodeBlockCurveStrength" value="1">
        </div>
        <div id="customizeCodeBlockCurveLength-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeBlockCurveLength-label" for="customizeCodeBlockCurveLength" class="formComponentLabel">
                Block
                curve length:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBlockCurveLength" name="customizeCodeBlockCurveLength" value=".5">
        </div>
        <div id="customizeCodeBlockCurveSkew-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeBlockCurveSkew-label" for="customizeCodeBlockCurveSkew" class="formComponentLabel">
                Block
                curve skew:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBlockCurveSkew" name="customizeCodeBlockCurveSkew" value="0">
        </div>
        <div id="customizeCodeBorderColor-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeBorderColor-label" for="customizeCodeBorderColor" class="formComponentLabel">Border
                Color:<span class="formComponentLabelRequiredStar"> *</span></label>
            <input type="text" id="customizeCodeBorderColor" name="customizeCodeBorderColor" value="7C7F84">
        </div>
        <div id="customizeCodeEdgeColor-wrapper" class="formComponent formComponentSingleLineText" style="display: none;">
            <label id="customizeCodeEdgeColor-label" for="customizeCodeEdgeColor" class="formComponentLabel">Edge Color:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <input type="text" id="customizeCodeEdgeColor" name="customizeCodeEdgeColor" value="EAEBEC">
        </div>
        <div id="customizeCodeGroupBlockCorners-wrapper" class="formComponent formComponentMultipleChoice" style="display: none;">
            <div id="customizeCodeGroupBlockCorners-choice1-wrapper" class="choiceWrapper">
                <input type="checkbox" id="customizeCodeGroupBlockCorners-choice1" name="customizeCodeGroupBlockCorners" value="true" class="choice" style="display: inline;" checked="checked">
                <label for="customizeCodeGroupBlockCorners-choice1" class="choiceLabel" style="display: inline;">Group
                    block corners
                </label>
            </div>
        </div>
    </div>
</div>