<div id="textPage" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle"><h2 style="display: none;">Enter Content</h2></div>
    <div id="textPage-section1" class="formSection formSectionAnonymous">
        <div id="text-wrapper" class="formComponent formComponentTextArea">
            <label id="text-label" for="text" class="formComponentLabel">Enter
                your message:<span class="formComponentLabelRequiredStar"> *</span></label>
            <textarea id="text" name="text" class="textArea" onkeyup="
            $(&#39;.previewLayer.edit .text .scrollableAreaContent&#39;).html($(this).val().newLinesToParagraphTags());
            $(&#39;.shadowDiv&#39;).html($(this).val().newLinesToParagraphTags());
        " onscroll="
            if(scrollableAreaObject === undefined || scrollableAreaObject.scrollableAreaScroller.data(&#39;mouseOver&#39;) === undefined || scrollableAreaObject.scrollableAreaScroller.data(&#39;mouseOver&#39;) === false){
                $(&#39;.previewLayer.edit .text .scrollableAreaViewport&#39;).scrollTop($(&#39;textarea#text&#39;).scrollTop() * 0.86);
            }
        "></textarea></div>
    </div>
</div>