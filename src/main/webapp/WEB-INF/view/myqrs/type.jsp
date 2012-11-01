<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%String n = "654";%>

<link href="/css/s/project.css" rel="stylesheet" type="text/css">
<link href="/css/s/forms.css" rel="stylesheet" type="text/css">
<link href="/css/s/site.css" rel="stylesheet" type="text/css">
<link href="/css/s/networks.css" rel="stylesheet" type="text/css">
<link href="/css/s/qr-code-generator.css" rel="stylesheet" type="text/css">
<link href="/css/s/social-buttons.css" rel="stylesheet" type="text/css">
<link href="/css/s/colorpicker.css" rel="stylesheet" type="text/css">

<!--script src="/js/s/jQuery." type="text/javascript" language="javascript"></script-->
<script src="/js/s/Class.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Json.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Form.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Dialog.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Security.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Scroll.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/ScrollableArea.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Slider.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Utility.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/Scan.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/CropSlider.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/js" type="text/javascript" language="javascript"></script>
<script src="/js/s/main.js" type="text/javascript"></script>
<script src="/js/s/colorpicker.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/jquery.address.js" type="text/javascript" language="javascript"></script>
<script src="/js/s/QrCodeGenerator.js" type="text/javascript" language="javascript"></script>

<sec:authorize access="isAuthenticated()">
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            Scan.loggedIn = true;
        });</script>
</sec:authorize>

<form id="qrCodeGenerator" target="qrCodeGenerator-iframe" enctype="multipart/form-data" class="form" method="post" action="/api/forms/processForm/" style="height: 750px;">
<div class="formAlertWrapper" style="display: none;">
    <div class="formAlert"></div>
</div>

<%@include file="previews.jsp" %>
<%@include file="pageNav.jsp" %>

<div class="formWrapperContainer" style="width: 580px; ">
<div class="formPageWrapper" style="height: 609px; ">
    <div class="formPageScroller" style="width: 7540px; ">
        <div id="codeTypePage" class="formPage" style="width: 580px; ">
            <div class="formPageTitle"><h2 style="display: none;">Select Type</h2></div>

            <%@include file="mainCategories.jsp" %>
            <%@include file="subCategory-social.jsp" %>
            <%@include file="personalScanPage.jsp" %>
            <%@include file="realEstateSaleListingPage.jsp" %>
            <%@include file="socailScanTypes.jsp" %>
            <%@include file="websiteScan.jsp" %>
            <%@include file="textScan.jsp" %>
            <%@include file="wifiScan.jsp" %>
            <%@include file="signInOrSignUp.jsp" %>
            <%@include file="finalStep.jsp" %>

        </div>
    </div>
    <ul class="formControl">
        <li class="previousLi" style="display: none; ">
            <button class="blueButton previousButton" disabled="disabled">Back</button>
        </li> <li class="nextLi" style="">
        <button class="blueButton nextButton" style="display: none; ">Next</button>
    </li>
    </ul>
</div>
<script type="text/javascript" language="javascript">
$(document).ready(function () {
    qrCodeGeneratorObject = new Form('qrCodeGenerator',
            {
                "options":{
                    "pageNavigator":true,
                    "previousButtonText":"Back"
                },
                "formPages":{
                    "codeTypePage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":"$('.previewLayer .text .scrollableAreaContent').empty();$('.previewLayer.website .website').empty();$('.previewLayer .content').hide();$('.previewLayer .wiFiSsid').hide();$('.previewLayer .wiFiPassword').hide();$('.previewLayer').removeClass('edit');",
                                "onAfter":"$('#qrCodeGenerator .formControl .nextButton').hide(); "
                            },
                            "onScrollAway":{
                                "onAfter":"if(formPageId !== 'chooseCodeTypeSocialPage'){$('#qrCodeGenerator .formControl .nextButton').show();} else {true;}"
                            }
                        },
                        "formSections":{
                            "codeTypePage-section1":{
                                "formComponents":{
                                    "codeType":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"qrCodeGeneratorObject.checkDependencies(true);qrCodeGeneratorObject.nextPage();",
                                            "multipleChoiceType":"radio"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    },
                                    "qrCodeGenerator-view":{
                                        "type":"FormComponentHidden"
                                    },
                                    "qrCodeGenerator-viewData":{
                                        "type":"FormComponentHidden"
                                    }
                                }
                            }
                        }
                    },
                    "chooseCodeTypeSocialPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":"$('.previewLayer .text .scrollableAreaContent').empty();$('.previewLayer.website .website').empty();$('.previewLayer .content').hide();$('.previewLayer').removeClass('edit');",
                                "onAfter":"$('#qrCodeGenerator .formControl .nextButton').hide(); "
                            },
                            "onScrollAway":{
                                "onAfter":"if(formPageId !== 'chooseCodeTypePage'){$('#qrCodeGenerator .formControl .nextButton').show();}"
                            },
                            "pageNavigator":{
                                "hide":true
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'chooseCodeTypeSocial';"
                            }
                        },
                        "formSections":{
                            "chooseCodeTypeSocialPage-section1":{
                                "formComponents":{
                                    "codeTypeSocial":{
                                        "options":{
                                            "triggerFunction":"qrCodeGeneratorObject.checkDependencies(true);qrCodeGeneratorObject.nextPage();",
                                            "multipleChoiceType":"radio"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    }
                                }
                            }
                        }
                    },
                    "personalScanPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":"$('#personalScanPageSocialButtons-wrapper').trigger('formComponent:changed')",
                                "onAfter":"$('.previewLayer').stop().hide();$('.previewLayer.personalScanPage').addClass('edit').show();$('.previewLayer.personalScanPage .content').show();$('#personalScanPageName').focus();$('#personalScanPageName').trigger('onkeyup');QrCodeGenerator.preparePersonalScanPage();$('#qrCodeGenerator .formPageWrapper').css({'margin-left':'-18px', 'padding-left':'18px'}); if($('#personalScanPageProfilePictureUrl').val() != '') { $('#personalScanPageBackground-wrapper option').attr('disabled', false); };"
                            },
                            "onScrollAway":{
                                "onBefore":" $('#qrCodeGenerator .formPageWrapper').css({'margin-left':'0', 'padding-left':'0'})//$('.previewLayer.personalScanPage .content').hide();"
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'personalScanPage';"
                            }
                        },
                        "formSections":{
                            "personalScanPage-section1":{
                                "formComponents":{
                                    "personalScanPageProfilePicture":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateProfilePic()"
                                        },
                                        "type":"FormComponentDropDown"
                                    },
                                    "personalScanPageProfilePictureFile":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageProfilePicture"
                                                ],
                                                "jsFunction":"$('#personalScanPageProfilePicture').val() == 'uploadFromComputer';"
                                            },
                                            "customStyle":true,
                                            "ajax":{
                                                "data":{
                                                    "view":"forms/qr-code-generator",
                                                    "viewData":[
                                                    ],
                                                    "controller":"forms/Forms",
                                                    "function":"handlePersonalScanPageProfilePictureFileAjax"
                                                },
                                                "javaScriptFunctionContext":"QrCodeGenerator",
                                                "javaScriptFunction":"handlePersonalScanPageProfilePictureFileAjax"
                                            }
                                        },
                                        "type":"FormComponentFile"
                                    },
                                    "personalScanPageBlurredProfilePictureUrl":{
                                        "type":"FormComponentHidden"
                                    },
                                    "personalScanPageProfilePictureUrl":{
                                        "type":"FormComponentHidden"
                                    },
                                    "personalScanPageProfilePictureCropCoordinates":{
                                        "type":"FormComponentHidden"
                                    },
                                    "personalScanPageProfilePictureUuid":{
                                        "type":"FormComponentHidden"
                                    },
                                    "personalScanPagePictureOriginalUuid":{
                                        "type":"FormComponentHidden"
                                    },
                                    "personalScanPageBackground":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateScanPageBackground(\"personal\");"
                                        },
                                        "type":"FormComponentDropDown"
                                    },
                                    "personalScanPageName":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"$(this).find('input').trigger('onkeyup');"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageBio":{
                                        "options":{
                                            "validationOptions":{
                                                "maxLength":64
                                            },
                                            "triggerFunction":"$(this).find('textarea').trigger('onkeyup');"
                                        },
                                        "type":"FormComponentTextArea"
                                    },
                                    "personalScanPageWebsite":{
                                        "options":{
                                            "validationOptions":[
                                                "url"
                                            ],
                                            "triggerFunction":"var input = $(this).find('input');if(!$(input).val().startsWith('http://') && !$(input).val().startsWith('https://') && $(input).val() !== '') {$(input).val('http://'+$(input).val()) }  $('#personalScanPageWebsite').trigger('onkeyup'); "
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPagePhonePrimary":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updatePersonalScanPageContactButtons();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPagePhoneMobile":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updatePersonalScanPageContactButtons();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageEmail":{
                                        "options":{
                                            "validationOptions":[
                                                "required",
                                                "email"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.handlePersonalScanPageProfileEmail();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtons":{
                                        "options":{
                                            "validationOptions":{
                                                "maxOptions":3
                                            },
                                            "triggerFunction":"var socialButtons = $(this).find(':checked');var positionClasses = ['left','center','right'];var sizeClasses = ['full','half','third'];var size;if(socialButtons.length > 3) {    size = sizeClasses[2];}else {    size = sizeClasses[socialButtons.length - 1];    }for(i = 0; i < 3; i++){    if(socialButtons[i] != undefined) {        $('.previewLayer:visible .socialButton'+(i+1)).attr('class', 'button '+size+' '+positionClasses[i]+' socialButton socialButton'+(i+1)+' '+$(socialButtons[i]).val()+'Background').show();    }    else {        $('.previewLayer:visible .socialButton'+(i+1)).attr('class', 'button '+size+' '+positionClasses[i]+' socialButton socialButton'+(i+1)).hide();    }} ",
                                            "multipleChoiceType":"checkbox"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    },
                                    "personalScanPageSocialButtonFacebook":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'facebook.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.facebookBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"example"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonTwitter":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'twitter.com/!#/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.twitterBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonPinterest":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'pinterest.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.pinterestBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonGooglePlus":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'https://plus.google.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.googlePlusBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"000000000000000000000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonVimeo":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'vimeo.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.vimeoBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"user00000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonAngelList":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'angel.co/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.angelListBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonFlickr":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'flickr.com/photos/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.flickrBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"000000000000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonYelp":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'yelp.com/user_details\\\\?userid\\\\='); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.yelpBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"0000000000000000000000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonYouTube":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'youtube.com/user/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.youTubeBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonLinkedIn":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'linkedin.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.linkedInBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonFoursquare":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'https://foursquare.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.foursquareBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonDribbble":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'dribbble.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.dribbbleBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonTumblr":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.formatWebAddress(this); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.tumblrBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonInstagram":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'gramfeed.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.instagramBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "personalScanPageSocialButtonGithub":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'github.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "personalScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#personalScanPageSocialButtons-wrapper .socialButtonChoice.githubBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            }
                        }
                    },
                    "businessScanPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":"$('#businessScanPageSocialButtons-wrapper').trigger('formComponent:changed'); ",
                                "onAfter":"$('.previewLayer').stop().hide(); $('.previewLayer.businessScanPage').addClass('edit').show(); $('.previewLayer.businessScanPage .content').show(); $('#businessScanPageName').focus(); $('#businessScanPageName').trigger('onkeyup'); QrCodeGenerator.prepareBusinessScanPage(); $('#qrCodeGenerator .formPageWrapper').css({'margin-left':'-18px', 'padding-left':'18px'}); if($('#businessScanPageProfilePictureUrl').val() !== '') { $('#businessScanPageBackground-wrapper option').attr('disabled', false); }; "
                            },
                            "onScrollAway":{
                                "onBefore":" $('#qrCodeGenerator .formPageWrapper').css({'margin-left':'0', 'padding-left':'0'}); //$('.previewLayer.businessScanPage .content').hide(); "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'businessScanPage';"
                            }
                        },
                        "formSections":{
                            "businessScanPage-section1":{
                                "formComponents":{
                                    "businessScanPageProfilePicture":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateProfilePic()"
                                        },
                                        "type":"FormComponentDropDown"
                                    },
                                    "businessScanPageProfilePictureFile":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageProfilePicture"
                                                ],
                                                "jsFunction":"$('#businessScanPageProfilePicture').val() == 'uploadFromComputer';"
                                            },
                                            "customStyle":true,
                                            "ajax":{
                                                "data":{
                                                    "view":"forms/qr-code-generator",
                                                    "viewData":[
                                                    ],
                                                    "controller":"forms/Forms",
                                                    "function":"handleBusinessScanPageProfilePictureFileAjax"
                                                },
                                                "javaScriptFunctionContext":"QrCodeGenerator",
                                                "javaScriptFunction":"handleBusinessScanPageProfilePictureFileAjax"
                                            }
                                        },
                                        "type":"FormComponentFile"
                                    },
                                    "businessScanPageBlurredProfilePictureUrl":{
                                        "type":"FormComponentHidden"
                                    },
                                    "businessScanPageProfilePictureUrl":{
                                        "type":"FormComponentHidden"
                                    },
                                    "businessScanPageProfilePictureCropCoordinates":{
                                        "type":"FormComponentHidden"
                                    },
                                    "businessScanPageProfilePictureUuid":{
                                        "type":"FormComponentHidden"
                                    },
                                    "businessScanPagePictureOriginalUuid":{
                                        "type":"FormComponentHidden"
                                    },
                                    "businessScanPageBackground":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateScanPageBackground(\"business\");"
                                        },
                                        "type":"FormComponentDropDown"
                                    },
                                    "businessScanPageName":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"$(this).find('input').trigger('onkeyup');"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageBio":{
                                        "options":{
                                            "validationOptions":{
                                                "maxLength":64
                                            },
                                            "triggerFunction":"$(this).find('textarea').trigger('onkeyup');"
                                        },
                                        "type":"FormComponentTextArea"
                                    },
                                    "businessScanPageWebsite":{
                                        "options":{
                                            "validationOptions":[
                                                "url"
                                            ],
                                            "triggerFunction":" var input = $(this).find('input'); if(!$(input).val().startsWith('http://') && !$(input).val().startsWith('https://') && $(input).val() !== '') {$(input).val('http://'+$(input).val()) }  $('#businessScanPageWebsite').trigger('onkeyup'); "
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            },
                            "businessScanPageCustomButtons":{
                                "options":{
                                    "instanceOptions":{
                                        "max":5,
                                        "callback":"QrCodeGenerator.updateBusinessScanPageInstanceButtons(type)",
                                        "initialValues":null,
                                        "addButtonText":"Add Another",
                                        "removeButtonText":"Remove"
                                    }
                                },
                                "formComponents":{
                                    "businessScanPageCustomButtonType":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.changeCustomButtonType(this);"
                                        },
                                        "type":"FormComponentDropDown"
                                    },
                                    "businessScanPageCustomButtonText":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updateBusinessScanPage();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageCustomButtonValue":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.formatCustomButton(this);"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            },
                            "businessScanPage-section3":{
                                "formComponents":{
                                    "businessScanPageSocialButtons":{
                                        "options":{
                                            "validationOptions":{
                                                "maxOptions":3
                                            },
                                            "triggerFunction":" var socialButtons = $(this).find(':checked');var positionClasses = ['left','center','right'];var sizeClasses = ['full','half','third'];var size;if(socialButtons.length > 3) {    size = sizeClasses[2];}else {    size = sizeClasses[socialButtons.length - 1];    }for(i = 0; i < 3; i++){    if(socialButtons[i] != undefined) {        $('.previewLayer:visible .socialButton'+(i+1)).attr('class', 'button '+size+' '+positionClasses[i]+' socialButton socialButton'+(i+1)+' '+$(socialButtons[i]).val()+'Background').show();    }    else {        $('.previewLayer:visible .socialButton'+(i+1)).attr('class', 'button '+size+' '+positionClasses[i]+' socialButton socialButton'+(i+1)).hide();    }} ",
                                            "multipleChoiceType":"checkbox"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    },
                                    "businessScanPageSocialButtonFacebook":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'facebook.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.facebookBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"example"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonTwitter":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'twitter.com/!#/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.twitterBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonPinterest":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'pinterest.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.pinterestBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonGooglePlus":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'https://plus.google.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.googlePlusBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"000000000000000000000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonVimeo":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'vimeo.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.vimeoBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"user00000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonAngelList":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'angel.co/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.angelListBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonFlickr":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'flickr.com/photos/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.flickrBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"000000000000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonYelp":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'yelp.com/user_details\\\\?userid\\\\='); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.yelpBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"0000000000000000000000"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonYouTube":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'youtube.com/user/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.youTubeBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonLinkedIn":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'linkedin.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.linkedInBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonFoursquare":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'https://foursquare.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.foursquareBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonDribbble":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'dribbble.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.dribbbleBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonTumblr":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.formatWebAddress(this); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.tumblrBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonInstagram":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'gramfeed.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.instagramBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "businessScanPageSocialButtonGithub":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" QrCodeGenerator.getUsernameFromWebAddress(this, 'github.com/'); ",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "businessScanPageSocialButtons"
                                                ],
                                                "jsFunction":"$('#businessScanPageSocialButtons-wrapper .socialButtonChoice.githubBackground').prev().is(':checked');"
                                            },
                                            "emptyValue":"username"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            }
                        }
                    },

                    /**       todo - real estate
                     "realEstateSaleListing":{
                     "options":{
                     "onScrollTo":{
                     "onBefore":"$('#realEstateSaleListingSocialButtons-wrapper').trigger('formComponent:changed'); ",
                     "onAfter":"$('.previewLayer').stop().hide(); $('.previewLayer.realEstateSaleListing').addClass('edit').show(); $('.previewLayer.realEstateSaleListing .content').show(); $('#realEstateSaleListingName').focus(); $('#realEstateSaleListingName').trigger('onkeyup'); QrCodeGenerator.preparerealEstateSaleListing(); $('#qrCodeGenerator .formPageWrapper').css({'margin-left':'-18px', 'padding-left':'18px'}); if($('#realEstateSaleListingProfilePictureUrl').val() !== '') { $('#realEstateSaleListingBackground-wrapper option').attr('disabled', false); }; "
                     },
                     "onScrollAway":{
                     "onBefore":" $('#qrCodeGenerator .formPageWrapper').css({'margin-left':'0', 'padding-left':'0'}); $('.previewLayer.realEstateSaleListing .content').hide(); "
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
                     */

                    "facebookCheckInPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); $('.previewLayer.facebookCheckIn').addClass('edit').show(); $('.previewLayer.facebookCheckIn .content').show(); var latlng = new google.maps.LatLng(40.225962,-111.66153099999997); var myOptions = {   zoom: 7,   center: latlng,   disableDefaultUI: true,   //draggable:false,   //scrollwheel:false,   mapTypeId: google.maps.MapTypeId.ROADMAP } QrCodeGenerator.facebookMap = new google.maps.Map(document.getElementById('facebookMapCanvas'), myOptions); if($('#facebookCheckInPlaceName').val() !== ''){    $('.checkInName').text($('#facebookCheckInPlaceName').val()); } "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'chooseCodeTypeSocial' && $('#codeTypeSocial-wrapper input:checked').val() == 'facebookCheckIn';"
                            }
                        },
                        "formSections":{
                            "facebookCheckInPage-section1":{
                                "formComponents":{
                                    "facebookCheckInPlaceName":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "facebookCheckInPlaceId":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "facebookCheckInPlaceAddress":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentAddress"
                                    },
                                    "facebookCheckInPlaceLatitude":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "facebookCheckInPlaceLongitude":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            }
                        }
                    },
                    "facebookLikePage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); $('.previewLayer.facebookLike').addClass('edit').show(); $('.previewLayer.facebookLike .content').show(); QrCodeGenerator.updateFacebookLikePreview(); "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'chooseCodeTypeSocial' && $('#codeTypeSocial-wrapper input:checked').val() == 'facebookLike';"
                            }
                        },
                        "formSections":{
                            "facebookLikePage-section1":{
                                "formComponents":{
                                    "facebookLikePageName":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "facebookLikePageUrl":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "facebookLikeAutoRedirect":{
                                        "type":"FormComponentMultipleChoice",
                                        "options":{
                                            "multipleChoiceType":"checkbox"
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "twitterFollowPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); $('.previewLayer.twitterFollow').addClass('edit').show(); $('.previewLayer.twitterFollow .content').show(); "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'chooseCodeTypeSocial' && $('#codeTypeSocial-wrapper input:checked').val() == 'twitterFollow';"
                            }
                        },
                        "formSections":{
                            "twitterFollowPage-section1":{
                                "formComponents":{
                                    "twitterFollowUsername":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            }
                        }
                    },
                    "foursquareCheckInPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); $('.previewLayer.foursquareCheckIn').addClass('edit').show(); $('.previewLayer.foursquareCheckIn .content').show(); var latlng = new google.maps.LatLng(40.225962,-111.66153099999997); var myOptions = {   zoom: 7,   center: latlng,   disableDefaultUI: true,   //draggable:false,   //scrollwheel:false,   mapTypeId: google.maps.MapTypeId.ROADMAP } QrCodeGenerator.foursquareMap = new google.maps.Map(document.getElementById('foursquareMapCanvas'), myOptions);  "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'chooseCodeTypeSocial' && $('#codeTypeSocial-wrapper input:checked').val() == 'foursquareCheckIn';"
                            }
                        },
                        "formSections":{
                            "foursquareCheckInPage-section1":{
                                "formComponents":{
                                    "foursquareCheckInVenueId":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "foursquareCheckInVenueName":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "foursquareCheckInAddress":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentAddress"
                                    },
                                    "foursquareCheckInLatitude":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "foursquareCheckInLongitude":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            }
                        }
                    },
                    "textPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); $('.previewLayer.text').addClass('edit').show(); $('#text').focus(); scrollableAreaObject = new ScrollableArea($('.previewLayer.text .text'), {'onlyShowScrollerOnHover': true, 'onscroll' : function(event){ $('textarea#text').scrollTop($('.previewLayer.edit .text .scrollableAreaViewport').scrollTop() / 0.86); } }); $('#text').trigger('onkeyup'); "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'text';"
                            }
                        },
                        "formSections":{
                            "textPage-section1":{
                                "formComponents":{
                                    "text":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentTextArea"
                                    }
                                }
                            }
                        }
                    },


                    "websitePage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); $('.previewLayer.website').addClass('edit').show(); $('#website').focus(); $('#website').trigger('onkeyup'); "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'website';"
                            }
                        },
                        "formSections":{
                            "websitePage-section1":{
                                "formComponents":{
                                    "website":{
                                        "options":{
                                            "validationOptions":[
                                                "required",
                                                "url"
                                            ],
                                            "triggerFunction":" if(!$('#website').val().startsWith('http://') && !$('#website').val().startsWith('https://')) {$('#website').val('http://'+$('#website').val()) } $('#website').trigger('onkeyup'); "
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            }
                        }
                    },



<%
    String componentName="realEstateSaleListing";
    String pageName=componentName+"Page";
%>

                    // todo - new real estate



                    "<%=pageName%>":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); " +
                                        "$('.previewLayer.<%=componentName%> ').addClass('edit').show(); " +
                                        "$('#text').focus(); " +
                                        "scrollableAreaObject = new ScrollableArea($('.previewLayer.<%=componentName%> .<%=componentName%>'), {'onlyShowScrollerOnHover': true, 'onscroll' : function(event){ $('textarea#<%=componentName%>').scrollTop($('.previewLayer.edit .<%=componentName%> .scrollableAreaViewport').scrollTop() / 0.86); } }); " +
                                        "$('#<%=componentName%>').trigger('onkeyup'); "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'text';"
                            }
                        },
                        "formSections":{
                            "<%=pageName%>-section1":{
                                "formComponents":{
                                    "<%=componentName%> ":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentTextArea"
                                    }
                                }
                            }
                        }
                    },





                    "wiFiPage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" ",
                                "onAfter":" $('.previewLayer').stop().hide(); $('.previewLayer.wiFi').addClass('edit').show(); $('.previewLayer .wiFiSsid').show(); $('.previewLayer .wiFiPassword').show(); $('#wiFiSsid').focus(); $('#wiFiSsid').trigger('onkeyup'); $('#wiFiPassword').trigger('onkeyup'); "
                            },
                            "dependencyOptions":{
                                "display":"hide",
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"$('#codeType-wrapper input:checked').val() == 'wiFi';"
                            }
                        },
                        "formSections":{
                            "wiFiPage-section1":{
                                "formComponents":{
                                    "wiFiSsid":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":" $('#wiFiSsid').trigger('onkeyup'); "
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "wiFiPassword":{
                                        "options":{
                                            "triggerFunction":" $('#wiFiPassword').trigger('onkeyup'); "
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "wiFiHiddenNetwork":{
                                        "type":"FormComponentMultipleChoice",
                                        "options":{
                                            "multipleChoiceType":"checkbox"
                                        }
                                    }
                                }
                            }
                        }
                    },

                    "signInOrSignUp":{
                        "options":{
                            "onScrollAway":{
                                "onBefore":"QrCodeGenerator.signInOrSignUp(direction);",
                                "notificationHtml":"Processing..."
                            },
                            "pageNavigator":{
                                "hide":true
                            },
                            "dependencyOptions":{
                                "dependentOn":[
                                    "codeType"
                                ],
                                "jsFunction":"Scan.loggedIn !== true;"
                            }
                        },
                        "formSections":{
                            "signInOrSignUp-section1":{
                                "formComponents":{
                                    "signInOrSignUpEmail":{
                                        "options":{
                                            "validationOptions":[
                                                "required",
                                                "email"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "signInOrSignUpPassword":{
                                        "options":{
                                            "validationOptions":[
                                                "required",
                                                "password"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "signInOrSignUpSignedIn":{
                                        "type":"FormComponentMultipleChoice",
                                        "options":{
                                            "multipleChoiceType":"checkbox"
                                        }
                                    },
                                    "signInOrSignUpPasswordConfirm":{
                                        "options":{
                                            "validationOptions":{
                                                "0":"required",
                                                "1":"password",
                                                "matches":"signInOrSignUpPassword"
                                            },
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "signInOrSignUpSignedIn"
                                                ],
                                                "jsFunction":"$('#signInOrSignUpSignedIn-choice1').is(':checked');"
                                            }
                                        },
                                        "type":"FormComponentSingleLineText"
                                    }
                                }
                            }
                        }
                    },
                    "customizeCodePage":{
                        "options":{
                            "onScrollTo":{
                                "onBefore":" QrCodeGenerator.prepareCustomizeCodePage(); $('#qrCodeGeneratorColorPicker').css('backgroundColor', '#' + $('#customizeCodeBlockColor').val()); ",
                                "onAfter":" qrCodeGeneratorObject.checkDependencies(); qrCodeGeneratorObject.formPageWrapper.scrollTo(qrCodeGeneratorObject.currentFormPage.page, 0); if($('#customizeCodeBlockColor').val().replace('#', '') == '60666D'){$('#qrCodeGeneratorColorPicker').ColorPickerSetColor({'h':210, 's':0, 'b':20}); } else {$('#qrCodeGeneratorColorPicker').ColorPickerSetColor($('#customizeCodeBlockColor').val());}",
                                "notificationHtml":"Provisioning QR code..."
                            }
                        },
                        "formSections":{
                            "customizeCodePage-section1":{
                                "formComponents":{
                                    "customizeCodeStyle":{
                                        "type":"FormComponentHidden"
                                    },
                                    "customizeCodeUserToken":{
                                        "type":"FormComponentHidden"
                                    },
                                    "customizeCodeShortReference":{
                                        "type":"FormComponentHidden"
                                    },
                                    "customizeCodeScannableId":{
                                        "type":"FormComponentHidden"
                                    },
                                    "title":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ]
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeHeaderText":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeFooterText":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBorder":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();",
                                            "multipleChoiceType":"checkbox"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    },
                                    "customizeCodeLogo":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();",
                                            "multipleChoiceType":"checkbox"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    },
                                    "customizeCodeCaption":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();",
                                            "multipleChoiceType":"checkbox"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    },
                                    "customizeCodeBadgeType":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();",
                                            "dependencyOptions":{
                                                "display":"hide",
                                                "dependentOn":[
                                                    "customizeCodeLogo"
                                                ],
                                                "jsFunction":"QrCodeGenerator.showBadgeType();"
                                            }
                                        },
                                        "type":"FormComponentDropDown"
                                    },
                                    "customizeCodeBlockColor":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBlockShape":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentDropDown"
                                    },
                                    "customizeCodeBlockPadding":{
                                        "options":{
                                            "validationOptions":[
                                                "required",
                                                "integerZeroPositive"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBlockStroke":{
                                        "options":{
                                            "validationOptions":{
                                                "0":"required",
                                                "1":"decimalZeroPositive",
                                                "maxValue":0.5
                                            },
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBlockCornerRadius":{
                                        "options":{
                                            "validationOptions":{
                                                "0":"required",
                                                "minValue":-1,
                                                "maxValue":1
                                            },
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBlockCurveStrength":{
                                        "options":{
                                            "validationOptions":{
                                                "0":"required",
                                                "minValue":0.5,
                                                "maxValue":1.5
                                            },
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBlockCurveLength":{
                                        "options":{
                                            "validationOptions":{
                                                "0":"required",
                                                "minValue":0,
                                                "maxValue":1
                                            },
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBlockCurveSkew":{
                                        "options":{
                                            "validationOptions":{
                                                "0":"required",
                                                "minValue":-0.5,
                                                "maxValue":0.5
                                            },
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeBorderColor":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeEdgeColor":{
                                        "options":{
                                            "validationOptions":[
                                                "required"
                                            ],
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();"
                                        },
                                        "type":"FormComponentSingleLineText"
                                    },
                                    "customizeCodeGroupBlockCorners":{
                                        "options":{
                                            "triggerFunction":"QrCodeGenerator.updateCustomizeCodePreview();",
                                            "multipleChoiceType":"checkbox"
                                        },
                                        "type":"FormComponentMultipleChoice"
                                    }
                                }
                            }
                        }
                    }
                }
            }
    );
});
</script>
<iframe id="qrCodeGenerator-iframe" name="qrCodeGenerator-iframe" class="formIFrame" frameborder="0" src="/js/s/saved_resource.html"></iframe>
</form>

<div class="colorpicker" id="collorpicker_214">
    <div class="colorpicker_color" style="background-color: rgb(0, 128, 255); ">
        <div>
            <div style="left: 0px; top: 120px; "></div>
        </div>
    </div>
    <div class="colorpicker_hue">
        <div style="top: 62px; "></div>
    </div>
    <div class="colorpicker_new_color" style="background-color: rgb(51, 51, 51); "></div>
    <div class="colorpicker_current_color" style="background-color: rgb(51, 51, 51); "></div>
    <div class="colorpicker_hex">
        <input type="text" maxlength="6" size="6">
    </div>
    <div class="colorpicker_rgb_r colorpicker_field">
        <input type="text" maxlength="3" size="3"> <span></span></div>
    <div class="colorpicker_rgb_g colorpicker_field">
        <input type="text" maxlength="3" size="3"> <span></span></div>
    <div class="colorpicker_rgb_b colorpicker_field">
        <input type="text" maxlength="3" size="3"> <span></span></div>
    <div class="colorpicker_hsb_h colorpicker_field">
        <input type="text" maxlength="3" size="3"> <span></span></div>
    <div class="colorpicker_hsb_s colorpicker_field">
        <input type="text" maxlength="3" size="3"> <span></span></div>
    <div class="colorpicker_hsb_b colorpicker_field">
        <input type="text" maxlength="3" size="3"> <span></span></div>
    <div class="colorpicker_submit"></div>
</div>

<!--script language="javascript" type="text/javascript" src="/js/s/chartbeat.js">

</script-->