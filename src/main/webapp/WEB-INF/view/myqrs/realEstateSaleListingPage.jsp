<%
    String componentNameA="realEstateSaleListing";
    String pageNameA=componentNameA+"Page";
%>


<!--div id="<%=pageNameA%>" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle">
        <h2 style="display: none;">Enter Content - peev</h2>
    </div>
    <div id="<%=pageNameA%>-section1" class="formSection formSectionAnonymous">
        <div id="<%=componentNameA%>-wrapper" class="formComponent formComponentTextArea">
            <label id="<%=componentNameA%>-label" for="<%=componentNameA%>" class="formComponentLabel">
                Enter your message:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <textarea id="<%=componentNameA%>" name="<%=componentNameA%>" class="textArea" onkeyup="
            $(&#39;.previewLayer.edit .<%=componentNameA%> .scrollableAreaContent&#39;).html($(this).val().newLinesToParagraphTags());
            $(&#39;.shadowDiv&#39;).html($(this).val().newLinesToParagraphTags());
        " onscroll="
            if(scrollableAreaObject === undefined || scrollableAreaObject.scrollableAreaScroller.data(&#39;mouseOver&#39;) === undefined || scrollableAreaObject.scrollableAreaScroller.data(&#39;mouseOver&#39;) === false){
                $(&#39;.previewLayer.edit .<%=componentNameA%> .scrollableAreaViewport&#39;).scrollTop($(&#39;textarea#text&#39;).scrollTop() * 0.86);
            }
        "></textarea></div>
    </div>
</div-->



<div id="<%=pageNameA%>" class="formPage formPageInactive" style="width: 580px; display: none; ">
    <div class="formPageTitle">
        <h2 style="display: none;">Enter Content</h2>
    </div>
    <div id="<%=pageNameA%>-section1" class="formSection formSectionAnonymous">
        <div id="<%=componentNameA%>-wrapper" class="formComponent formComponentSingleLineText">
            <label id="<%=componentNameA%>-label" for="<%=componentNameA%>" class="formComponentLabel">
                Enter the URL you would like your code to direct to:<span class="formComponentLabelRequiredStar"> *</span>
            </label>
            <input type="text" id="<%=componentNameA%>" name="<%=componentNameA%>" onkeyup="$(&#39;.previewLayer.edit .<%=componentNameA%>&#39;).html($(this).val());">
        </div>
    </div>
</div>