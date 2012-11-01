"realEstateSaleListing":{
"options":{
"onScrollTo":{
"onBefore":"$('#realEstateSaleListingSocialButtons-wrapper').trigger('formComponent:changed'); ",
"onAfter":"$('.previewLayer').stop().hide(); $('.previewLayer.realEstateSaleListing').addClass('edit').show(); $('.previewLayer.realEstateSaleListing .content').show(); $('#realEstateSaleListingName').focus(); $('#realEstateSaleListingName').trigger('onkeyup'); QrCodeGenerator.preparerealEstateSaleListing(); $('#qrCodeGenerator .formPageWrapper').css({'margin-left':'-18px', 'padding-left':'18px'}); if($('#realEstateSaleListingProfilePictureUrl').val() !== '') { $('#realEstateSaleListingBackground-wrapper option').attr('disabled', false); }; "
},
"onScrollAway":{
"onBefore":" $('#qrCodeGenerator .formPageWrapper').css({'margin-left':'0', 'padding-left':'0'}); //$('.previewLayer.realEstateSaleListing .content').hide(); "
},
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"codeType"
],
"jsFunction":"$('#codeType-wrapper input:checked').val() == 'realEstateSaleListing';"
}
},
"formSections":{
"realEstateSaleListing-section1":{
"formComponents":{
"realEstateSaleListingProfilePicture":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":"QrCodeGenerator.updateProfilePic()"
},
"type":"FormComponentDropDown"
},
"realEstateSaleListingProfilePictureFile":{
"options":{
"validationOptions":[
"required"
],
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingProfilePicture"
],
"jsFunction":"$('#realEstateSaleListingProfilePicture').val() == 'uploadFromComputer';"
},
"customStyle":true,
"ajax":{
"data":{
"view":"forms/qr-code-generator",
"viewData":[
],
"controller":"forms/Forms",
"function":"handlerealEstateSaleListingProfilePictureFileAjax"
},
"javaScriptFunctionContext":"QrCodeGenerator",
"javaScriptFunction":"handlerealEstateSaleListingProfilePictureFileAjax"
}
},
"type":"FormComponentFile"
},
"realEstateSaleListingBlurredProfilePictureUrl":{
"type":"FormComponentHidden"
},
"realEstateSaleListingProfilePictureUrl":{
"type":"FormComponentHidden"
},
"realEstateSaleListingProfilePictureCropCoordinates":{
"type":"FormComponentHidden"
},
"realEstateSaleListingProfilePictureUuid":{
"type":"FormComponentHidden"
},
"realEstateSaleListingPictureOriginalUuid":{
"type":"FormComponentHidden"
},
"realEstateSaleListingBackground":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":"QrCodeGenerator.updateScanPageBackground(\"business\");"
},
"type":"FormComponentDropDown"
},
"realEstateSaleListingName":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":"$(this).find('input').trigger('onkeyup');"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingBio":{
"options":{
"validationOptions":{
"maxLength":64
},
"triggerFunction":"$(this).find('textarea').trigger('onkeyup');"
},
"type":"FormComponentTextArea"
},
"realEstateSaleListingWebsite":{
"options":{
"validationOptions":[
"url"
],
"triggerFunction":" var input = $(this).find('input'); if(!$(input).val().startsWith('http://') && !$(input).val().startsWith('https://') && $(input).val() !== '') {$(input).val('http://'+$(input).val()) }  $('#realEstateSaleListingWebsite').trigger('onkeyup'); "
},
"type":"FormComponentSingleLineText"
}
}
},
"realEstateSaleListingCustomButtons":{
"options":{
"instanceOptions":{
"max":5,
"callback":"QrCodeGenerator.updaterealEstateSaleListingInstanceButtons(type)",
"initialValues":null,
"addButtonText":"Add Another",
"removeButtonText":"Remove"
}
},
"formComponents":{
"realEstateSaleListingCustomButtonType":{
"options":{
"triggerFunction":"QrCodeGenerator.changeCustomButtonType(this);"
},
"type":"FormComponentDropDown"
},
"realEstateSaleListingCustomButtonText":{
"options":{
"triggerFunction":"QrCodeGenerator.updaterealEstateSaleListing();"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingCustomButtonValue":{
"options":{
"triggerFunction":"QrCodeGenerator.formatCustomButton(this);"
},
"type":"FormComponentSingleLineText"
}
}
},
"realEstateSaleListing-section3":{
"formComponents":{
"realEstateSaleListingSocialButtons":{
"options":{
"validationOptions":{
"maxOptions":3
},
"triggerFunction":" var socialButtons = $(this).find(':checked');var positionClasses = ['left','center','right'];var sizeClasses = ['full','half','third'];var size;if(socialButtons.length > 3) {    size = sizeClasses[2];}else {    size = sizeClasses[socialButtons.length - 1];    }for(i = 0; i < 3; i++){    if(socialButtons[i] != undefined) {        $('.previewLayer:visible .socialButton'+(i+1)).attr('class', 'button '+size+' '+positionClasses[i]+' socialButton socialButton'+(i+1)+' '+$(socialButtons[i]).val()+'Background').show();    }    else {        $('.previewLayer:visible .socialButton'+(i+1)).attr('class', 'button '+size+' '+positionClasses[i]+' socialButton socialButton'+(i+1)).hide();    }} ",
"multipleChoiceType":"checkbox"
},
"type":"FormComponentMultipleChoice"
},
"realEstateSaleListingSocialButtonFacebook":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'facebook.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.facebookBackground').prev().is(':checked');"
},
"emptyValue":"example"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonTwitter":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'twitter.com/!#/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.twitterBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonPinterest":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'pinterest.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.pinterestBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonGooglePlus":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'https://plus.google.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.googlePlusBackground').prev().is(':checked');"
},
"emptyValue":"000000000000000000000"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonVimeo":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'vimeo.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.vimeoBackground').prev().is(':checked');"
},
"emptyValue":"user00000"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonAngelList":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'angel.co/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.angelListBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonFlickr":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'flickr.com/photos/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.flickrBackground').prev().is(':checked');"
},
"emptyValue":"000000000000"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonYelp":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'yelp.com/user_details\\\\?userid\\\\='); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.yelpBackground').prev().is(':checked');"
},
"emptyValue":"0000000000000000000000"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonYouTube":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'youtube.com/user/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.youTubeBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonLinkedIn":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'linkedin.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.linkedInBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonFoursquare":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'https://foursquare.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.foursquareBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonDribbble":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'dribbble.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.dribbbleBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonTumblr":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.formatWebAddress(this); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.tumblrBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonInstagram":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'gramfeed.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.instagramBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
},
"realEstateSaleListingSocialButtonGithub":{
"options":{
"validationOptions":[
"required"
],
"triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'github.com/'); ",
"dependencyOptions":{
"display":"hide",
"dependentOn":[
"realEstateSaleListingSocialButtons"
],
"jsFunction":"$('#realEstateSaleListingSocialButtons-wrapper .socialButtonChoice.githubBackground').prev().is(':checked');"
},
"emptyValue":"username"
},
"type":"FormComponentSingleLineText"
}
}
}
}
},