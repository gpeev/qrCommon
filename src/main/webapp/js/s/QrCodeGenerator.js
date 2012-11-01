var QrCodeGeneratorClass = Class.extend({
	initialize:function (options)
	{
		var self = this;
		// Update the options object
		this.options = $.extend(true, {
		}, options || {});

		this.customizeCodePreviewImageUrlCache = [];

		this.scanPageProfileImageStatus = {
			ready:0,

			showLoading:function (type)
			{
				var statusSpan = $('#' + type + 'ScanPageProfilePictureFile-wrapper').find('.pseudoFileAjaxStatus');
				if (statusSpan.is(':hidden'))
				{
					statusSpan.addClass('pseudoFileAjaxStatusUploading').show();
				}
			},
			hideLoading:function (type)
			{
				var statusSpan = $('#' + type + 'ScanPageProfilePictureFile-wrapper').find('.pseudoFileAjaxStatus');
				if (self.scanPageProfileImageStatus.ready > 1)
				{
					statusSpan.removeClass('pseudoFileAjaxStatusUploading').hide();
				}

			}
		};


		this.oldColor = '000000';
		this.newColor = '000000';
		$(document).ready(function ()
		{
			self.initializeCodeTypePreviewListeners();
			self.setupQrCodeGenerator();
			self.keepPreviewInSight();
		});

	},

	setupQrCodeGenerator:function ()
	{
		this.colorPicker = $('#qrCodeGeneratorColorPicker').ColorPicker({
			color      :{
				'h':210,
				's':0,
				'b':20
			},
			livePreview:false,
			onShow     :function (colpkr)
			{
				$(colpkr).fadeIn(250);
				return false;
			},
			onSubmit   :function (hsb, hex, rgb, el)
			{
				$('#qrCodeGeneratorColorPicker').css('backgroundColor', '#' + hex);
				$('#customizeCodeBlockColor').val(hex);
				$('#qrCodeGeneratorColorPicker').ColorPickerHide();
				if (QrCodeGenerator !== undefined && QrCodeGenerator.oldColor !== $('#customizeCodeBlockColor').val())
				{
					$('#customizeCodeBlockColor').trigger('change');
				}

			},
			onHide     :function (colpkr)
			{
				if ($(colpkr).is(':visible'))
				{
					$(colpkr).fadeOut(250);
					if (QrCodeGenerator !== undefined && QrCodeGenerator.oldColor !== $('#customizeCodeBlockColor').val())
					{
						$('#customizeCodeBlockColor').trigger('change');
					}
				}
				return false;
			},

			onChange:function (hsb, hex, rgb)
			{
				$('#qrCodeGeneratorColorPicker').css('backgroundColor', '#' + hex);
				$('#customizeCodeBlockColor').val(hex);
			}
		});
		QrCodeGenerator.geocoderApi = new google.maps.Geocoder();
	},

	getFoursquareDataByVenueId:function ()
	{
		var self = this;
		var id = $('#foursquareCheckInVenueId').val();
		var foursquareApiUrl = 'https://api.foursquare.com/v2/venues/';
		id = $.trim(id);
		foursquareApiUrl += id;
		var date = new Date();
		var params = {
			'client_id'    :'KB5HHVPSFVGUE1F5QA41SAK34T0E2QACTVJDEFZNGTYGEN3V',
			'client_secret':'AUFDOQFEGH0QMFCJBJAVEZCYCOKTV30YQWG0YWGT3FLIFAOG',
			'v'            :date.getFullYear() + '' + (date.getMonth() + 1) + '' + date.getDate()
		};
		$('#foursquareCheckInVenueId-description').find('.response').empty().addClass('ajaxLoading');
		$.ajax({
			url          :foursquareApiUrl,
			dataType     :'jsonp',
			jsonpCallback:'QrCodeGenerator.handleFoursquareJSON',
			timeout      :3000,
			data         :params,
			error        :function (XHR, textStatus, errorThrown)
			{
				if (XHR.status !== 200)
				{
					console.log(XHR);
					$('#foursquareCheckInVenueId-description').removeClass('ajaxLoading').html('<p style="color:red;">Venue was not found.</p>');
					qrCodeGeneratorObject.adjustHeight();
				}
			}
		});
	},

	handleFoursquareJSON:function (json)
	{

		var description = $('#foursquareCheckInVenueId-description');
		var response = $('#foursquareCheckInVenueId-description').find('.response');
		response.removeClass('ajaxLoading');
		var foursquareInfoWrapper = $('<div class="fourSquareInfo" />');
		if (json.meta.code !== 200)
		{
			response.text('Venue was not found. Check your ID and try again ');
		} else
		{
			var venue = json.response.venue;
			console.log(json);
			// Populate values about the Venue

			$('#foursquareCheckInVenueName').val(venue.name);
			$('#foursquareCheckInLatitude').val(venue.location.lat);
			$('#foursquareCheckInLongitude').val(venue.location.lng);

			//set an address Values Object to pass to the address field,
			var addressValues = venue.location;
			addressValues.addressLine1 = venue.location.address;
			addressValues.zip = venue.location.postalCode;
			addressValues.country = 'US';
			qrCodeGeneratorObject.select('foursquareCheckInAddress').setValue(addressValues);
			var latlng = new google.maps.LatLng(venue.location.lat, venue.location.lng);
			this.foursquareMap.setCenter(latlng);
			this.foursquareMap.setZoom(13);
			if (QrCodeGenerator.mapMarker !== undefined)
			{
				//remove any old markers;
				QrCodeGenerator.mapMarker.setMap(null);
			}
			QrCodeGenerator.mapMarker = new google.maps.Marker({
				map      :this.foursquareMap,
				clickable:false,
				position :latlng

			});

		}
		this.updateFoursquareInPreview();
		qrCodeGeneratorObject.adjustHeight();
	},

	getTwitterDataByUsername:function ()
	{
		var self = this;
		var name = $('#twitterFollowUsername').val();
		var twitterApiUrl = 'http://api.twitter.com/1/users/lookup.json';
		name = $.trim(name).replace(/\s/g, '.');
		var description = $('#twitterFollowUsername-description');
		description.empty().addClass('ajaxLoading');
		$.ajax({
			url          :twitterApiUrl,
			dataType     :'jsonp',
			jsonpCallback:'QrCodeGenerator.handleTwitterJSON',
			timeout      :3000,
			data         :{
				'screen_name':name
			},
			error        :function (XHR, textStatus, errorThrown)
			{
				if (XHR.status !== 200)
				{
					console.log(XHR);
					$('#twitterFollowUsername-description').removeClass('ajaxLoading').html('<p style="color:red;">User was not found.</p>');
					qrCodeGeneratorObject.adjustHeight();
				}
			}
		});
	},

	handleTwitterJSON:function (json)
	{
		var description = $('#twitterFollowUsername-description');
		description.removeClass('ajaxLoading').empty();
		var twitterInfoWrapper = $('<div class="twitterInfo" />');
		if (json.errors !== undefined)
		{
			console.log(json.errors[0].message);
			description.append('<p style="color:red;">User was not found.</p>');
		} else
		{
			json = json[0];
			var twitterProfileImage = $('<img />').attr('src', json.profile_image_url).css({
				'float':'left'
			});
			var TwitterInfo = $('<div />').css({
				'margin-left':'15px',
				'float'      :'left',
				'width'      :'280px'
			});
			TwitterInfo.append('<p style="font-size:18px; line-height:1.25; color:#333;"><a href="http://twitter.com/#!/' + json.screen_name + '" target="_blank" >' + json.name + '</a> <span style="font-size:12px; color:#999;">@' + json.screen_name + '</span </p>')
				.append('<p style="font-size:11px; line-height:1.25;  color:#999;">' + json.description + '</p>');
			twitterInfoWrapper.append(twitterProfileImage)
				.append(TwitterInfo)
				.append('<div style="clear:both;" />');
			description.append(twitterInfoWrapper);
			$('#twitterFollowUsername-description').append(json);
			twitterProfileImage.one('load', function ()
			{
				qrCodeGeneratorObject.adjustHeight();
			});
		}
	},

	getFacebookGraphDataByName:function ()
	{
		var self = this;
		$('#facebookCheckInPage .response').empty();
		var responseContainer = $('#facebookCheckInPlaceName-description').find('.response');
		responseContainer.empty().removeClass('ajaxLoading');
		var name = $('#facebookCheckInPlaceName').val();
		var graphURL = 'https://graph.facebook.com/';
		name = $.trim(name).replace(/\s/g, '.');
		if (name !== '')
		{
			responseContainer.addClass('ajaxLoading');
			$.getJSON(graphURL + name,function (json)
			{
				responseContainer.removeClass('ajaxLoading');
				self.handleFacebookPlaceJSON(json);
			}).error(function (json)
				{
					responseContainer.removeClass('ajaxLoading');
					self.handleFacebookPlaceJSON(json);
				});
		}
	},

	getFacebookGraphDataById:function ()
	{

		var self = this;
		$('#facebookCheckInPage .response').empty();
		var responseContainer = $('#facebookCheckInPlaceId-description').find('.response');
		responseContainer.empty().removeClass('ajaxLoading');
		var id = $('#facebookCheckInPlaceId').val();
		var graphURL = 'https://graph.facebook.com/';
		id = $.trim(id);
		if (id !== '')
		{
			responseContainer.addClass('ajaxLoading');
			$.getJSON(graphURL + id,function (json)
			{
				responseContainer.removeClass('ajaxLoading');
				self.handleFacebookPlaceJSON(json);
			}).error(function (json)
				{
					responseContainer.removeClass('ajaxLoading');
					self.handleFacebookPlaceJSON(json);
				});
		}

	},

	geolocateFromForm:function ()
	{
		var location = qrCodeGeneratorObject.select('facebookCheckInPlaceAddress').getValue();
		if (location.addressLine1 !== '')
		{
			this.geocodeLocation(location);
		}

	},

	geocodeLocation:function (addressData)
	{
		var addressString = '';
		var self = this;
		$.each(addressData, function (key, value)
		{
			addressString += value + ' ';
		});
		addressString = $.trim(addressString);
		this.geocoderApi.geocode({
			'address':addressString
		}, function (results, status)
		{
			if (status === google.maps.GeocoderStatus.OK)
			{
				var location = results[0].geometry.location;
				self.facebookMap.setCenter(location);
				self.facebookMap.setZoom(13);
				if (QrCodeGenerator.mapMarker !== undefined)
				{
					//remove any old markers;
					QrCodeGenerator.mapMarker.setMap(null);
				}
				QrCodeGenerator.mapMarker = new google.maps.Marker({
					map      :self.facebookMap,
					clickable:false,
					position :location

				});

				$('#facebookCheckInPlaceLatitude').val(location.lat());
				$('#facebookCheckInPlaceLongitude').val(location.lng());

				//} else {
				console.log('Geocode was not successful for the following reason:', status);
			}
		});
	},

	handleFacebookPlaceJSON:function (json)
	{
		if (json.error !== undefined)
		{
			console.log(json.error.message);
			$('#facebookCheckInPlaceId-description').find('.response').text('It seems like that page doesn\'t exist. do you know the ID?').css('color', 'red');
		} else
		{
			$('#facebookCheckInPlaceName').val(json.name);
			$('#facebookCheckInPlaceId').val(json.id);
			if (json.location.latitude === undefined)
			{
				$('#facebookCheckInPlaceName-description .response').html('This Facebook Page is not a "Place", see how you can set it up <a target="_blank" href="https://www.facebook.com/help/?faq=168172433243582#How-do-I-claim-a-Place-to-manage-my-business\'s-presence-on-Facebook?">here</a>').css('color', 'red');
				qrCodeGeneratorObject.adjustHeight();
				return false;
			}
			json.location.addressLine1 = json.location.street;
			qrCodeGeneratorObject.select('facebookCheckInPlaceAddress').setValue(json.location);
			this.geocodeLocation(json.location);

		}
		qrCodeGeneratorObject.adjustHeight();
		$('.facebookCheckInPreviewPageLink').attr('href', json.link);
	},

	handlePersonalScanPageProfileEmail:function ()
	{
		if ($('#personalScanPageProfilePicture').val() === 'gravatar')
		{
			var gravatar = 'http://www.gravatar.com/avatar/' + Security.md5($('#personalScanPageEmail').val().toLowerCase()) + '?d=' + encodeURI('http://peekinsi.de/images/s/scan-page-picture-default-portrait.png') + '&s=100';
			$('.previewLayer.personalScanPage .content .profilePicture').css({
				'background-image':'url(' + gravatar + ')'
			});
		}
		QrCodeGenerator.updatePersonalScanPageContactButtons();
	},


	waitForUrlSuccess:function (type, url, callback)
	{
		var self = this;
		this.scanPageProfileImageStatus.showLoading(type);
		var img = new Image();

		$(img).error(function (evt)
		{
			setTimeout(function ()
			{
				self.waitForUrlSuccess(type, url, callback);
			}, 750);
			$(this).remove();
		}).load(callback);

		img.src = url;

	},

	handleScanPagePictureFileAjax               :function (type, response)
	{

		var self = this;
		$('#' + type + 'ScanPageBlurredProfilePictureUrl').val(response.blurredProfilePictureUrl);
		$('#' + type + 'ScanPageProfilePictureUrl').val(response.profilePictureUrl);
		$('#' + type + 'ScanPageProfilePictureUuid').val(response.profilePictureUuid);
		$('#' + type + 'ScanPagePictureOriginalUuid').val(response.originalUuid);
		self.scanPageProfileImageStatus.showLoading();
		this.waitForUrlSuccess(type, response.blurredProfilePictureUrl, function (event)
		{
			self.scanPageProfileImageStatus.ready++;
			self.scanPageProfileImageStatus.hideLoading(type);
			self.updateScanPageBackground(type, response.blurredProfilePictureUrl);
		});
		this.waitForUrlSuccess(type, response.profilePictureUrl, function (event)
		{
			self.scanPageProfileImageStatus.ready++;
			self.scanPageProfileImageStatus.hideLoading(type);
			//$('.' + type + 'ScanPage .profilePicture').cropBehindDestroy();
			if (self[type + 'CropSlider'])
			{
				self[type + 'CropSlider'].destroy();
			}
			self[type + 'CropSlider'] = new CropSlider($('.' + type + 'ScanPage .profilePicture'), {
				imageUrl            :response.profilePictureUrl,
				cropCoordinatesInput:$('#' + type + 'ScanPageProfilePictureCropCoordinates'),
				notifyCrossHairUrl  :"/images/s/icons/drag-cursor.png"
			});

		});
		$('#' + type + 'ScanPageBackground-wrapper option').attr('disabled', false);
	},
	handlePersonalScanPageProfilePictureFileAjax:function (response, formComponent)
	{
		this.handleScanPagePictureFileAjax('personal', response);

	},

	handleBusinessScanPageProfilePictureFileAjax:function (response, formComponent)
	{
		console.log('handlePersonalScanPageBackgroundFileAjax', response, formComponent);

		this.handleScanPagePictureFileAjax('business', response);
	},

	prepareCustomizeCodePage:function ()
	{
		var self = this;
		var suggestedTitle = this.getTitleByType();
		$('#title').val(suggestedTitle);

		// If they don't have a code provisioned already
		if ($('#customizeCodeShortReference').val() === '')
		{
			$.ajax({
				//'url': '/api/scan/createOrUpdateScannableFromFormValues/',
				url        :'/myqrs/createOrUpdateScannableFromFormValues',
				type       :'POST',
				method     :'POST',
				contentType:'application/json',
				dataType   :'json',
				data       :{
					'formValues':qrCodeGeneratorObject.getData()
				},
				success    :function (data)
				{
					console.log(data);
					$('#customizeCodeShortReference').val(data.response.shortReference);
					$('#customizeCodeScannableId').val(data.response.id);
					$('#customizeCodeStyle').val(data.response.optionsString);
					var type = $('#codeType-wrapper :checked').val();
					//  alert("type:"+type);

					if (data.response.croppedPictureUrl != null && (type === 'personalScanPage' || type === 'businessScanPage'))
					{
						if ($('#' + type + 'ProfilePictureUrl').val() !== data.response.croppedPictureUrl)
						{
							$('#' + type + 'ProfilePictureUrl').val(data.response.croppedPictureUrl);
						}
					}
					self.updateCustomizeCodePreview();
				},
				async      :false
			});
		}
		else
		{
			$('.formScrollToNotification').remove();
			this.updateCustomizeCodePreview();
		}
	},

	getTitleByType:function ()
	{
		var title = 'Qr Code';

		var xx = $('#title').val();
		alert("XX:" + xx);

		if (xx !== '')
		{
			title = $('#title').val();
		}
		else
		{
			var type = $('#codeType-wrapper :checked').val();
			alert("Type:" + type);

			if (type === 'personalScanPage')
			{
				title = $('#personalScanPageName').val();
			}
			else if (type === 'businessScanPage')
			{
				title = $('#businessScanPageName').val();
			}
			else if (type === 'website')
			{
				var url = $('#website').val().replace(/^(((ht|f)tp(s)?:\/\/)?(www\.)|http:\/\/|www\.)?/, '');
				url = url.replace(/\/$/, '');
				title = url;
			}
			else if (type === 'text')
			{
				var text = $.trim($('#text').val());
				text = text.split(/\n/)[0];
				if (text.length > 15)
				{
					title = '';
					var words = text.split(' ');
					$.each(words, function (index, word)
					{
						title += word + ' ';
						if ($.trim(title).length > 15)
						{
							title = $.trim(title);
							return false;
						}
					});
					title += '...';
				}
				else
				{
					title = text;
				}
			}
			else if (type === 'realEstateSaleListingPage')
			{
				title = $('#realEstateSaleListingPage').val();
				alert("YYYYYYYY:" + title);
				var text = $.trim($('#text').val());
				text = text.split(/\n/)[0];
				if (text.length > 15)
				{
					title = '';
					var words = text.split(' ');
					$.each(words, function (index, word)
					{
						title += word + ' ';
						if ($.trim(title).length > 15)
						{
							title = $.trim(title);
							return false;
						}
					});
					title += '...';
				}
				else
				{
					title = text;
				}
			}
			else if (type === 'chooseCodeTypeSocial')
			{
				var socialType = $('#codeTypeSocial-wrapper :checked').val();

				if (socialType === 'facebookCheckIn')
				{
					title = $('#facebookCheckInPlaceName').val() + ' Check in';
				}
				else if (socialType === 'foursquareCheckIn')
				{
					title = $('#foursquareCheckInVenueName').val() + ' Check in';
				}
				else if (socialType === 'twitterFollow')
				{
					title = 'Follow ' + $('#twitterFollowUsername').val();
				}
			}
			else
			{
				title = 'Qr Code';
			}
		}

		return title;
	},

	signInOrSignUp:function (direction)
	{
		var nextPage = true;

		$('.signInOrSignUpResponse').text('').hide();

		if (direction === 'forwards')
		{
			var url;
			if ($('#signInOrSignUpSignedIn-choice1').is(':checked'))
			{
				url = '/api/scan/register/';
			}
			else
			{
				url = '/api/scan/login/';
			}

			$.ajax({
				'url'     :url,
				'dataType':'json',
				'data'    :{
					'email'   :$('#signInOrSignUpEmail').val(),
					'password':$('#signInOrSignUpPassword').val()
				},
				success   :function (data)
				{
					// If they login request fails
					if (data.status === 'failure')
					{
						var error = '';
						if (data.errorHtml !== undefined)
						{
							error = data.errorHtml;
						}
						else
						{
							error = data.response;
						}
						$('.signInOrSignUpResponse').text(error).show();
						nextPage = false;
					}
					// If they login request succeeds
					else
					{
						if (!data.response.user)
						{
							data.response.user = {};
						}

						Scan.login({
							sessionToken:data.response.user.token
						});

						$('#customizeCodeUserToken').val(data.response.user.token);

						$('.previousButton').html($('.previousButton').text());
						$('.signInOrSignUpResponse').text('').hide();

						nextPage = true;
					}
					qrCodeGeneratorObject.adjustHeight();
				},
				'async'   :false
			});
		}

		return nextPage;
	},

	generateScannableImageUrl:function (optionsObject, userToken, format)
	{
		// set environment URL
		//var urlBase = document.location.host.replace(/^www\./i, '');
		var urlBase = "scan.me";//document.location.host.replace(/^www\./i, '');
		var isDev = (urlBase.indexOf('scan.me') < 0 || urlBase.indexOf('dev.') >= 0 || urlBase.indexOf('sandbox.') >= 0);
		if (isDev)
		{
			urlBase += ':8082';
		}
		else
		{
			urlBase = 'images.' + urlBase;
		}
		urlBase = 'http://' + urlBase + '/qr_codes/';
		// alert("urlBase:"+urlBase);

		var imageUrl = '';
		format = !format ? 'jpg' : format;

		var encodedOptionsString = Json.encode(optionsObject)// create a JSON string from the object
			.base64Encode()// base64 encode the string
			.replace(/\+/g, '-')// make url safe
			.replace(/\//g, '_')// make url safe
			.replace(/\=+$/, '');   // strip off trailing padding

		imageUrl = urlBase               // environmentURL
			+ encodedOptionsString // OPTIONS STRING
			+ '.' + format           //Format
			+ '?n=' + userToken;     //Session Token


		// alert("imgUrl:"+imageUrl);

		//http://images.scan.me/qr_codes/(options string).(format)?n=(internal session token)
		//return imageUrl;
		// return "http://images.scan.me/qr_codes/eyJ1dWlkIjoic2NuLTAxMmFiMTIxLTlmM2YtNDU1Mi1hNDZkLWEwZjliODVkOTg4MyIsImxldmVsIjoibSIsInBhZGRpbmciOjAsInNpemUiOjMwMCwic2hhcGUiOiJzcXVhcmUiLCJ0ZW1wbGF0ZSI6eyJuYW1lIjoic2NhbiIsImJvcmRlciI6MSwiaGVhZGVyIjoiIiwibG9nbyI6InNjYW4iLCJmb290ZXIiOiJkb3dubG9hZCBmcmVlIGFwcCBhdCBnZXQuc2Nhbi5tZSJ9LCJjb2xvcnMiOnsiZm9yZWdyb3VuZCI6IjYwNjY2RCIsImJhY2tncm91bmQiOiJmZmZmZmZmZiIsInN0cm9rZSI6IjAwMDAwMCIsInFyX2NvZGUiOiI2MDY2NkQiLCJlZGdlIjoiRUFFQkVDIiwiYm9yZGVyIjoiN0M3Rjg0In0sInN0cm9rZSI6MCwiZ3JvdXBfY29ybmVycyI6MSwiY29ybmVyX3JhZGl1cyI6MCwiY3VydmUiOnsic3RyZW5ndGgiOjEsImxlbmd0aCI6MC41LCJza2V3IjowfX0.png?n=IfajZkwVxBU0Z2m6X6pKyoeMzsuKcgjf";
		return "http://localhost:8080/myqrs/qrimggen2/test/asdfasfasdf";
	},

	updateCustomizeCodePreview:function ()
	{
		// Get all the values putting into an object
		var customizeCodeValues = qrCodeGeneratorObject.formPages.customizeCodePage.formSections['customizeCodePage-section1'].getData();
		var customizeCodeBlockShape = customizeCodeValues.customizeCodeBlockShape === 'rounded' ? 'square' : customizeCodeValues.customizeCodeBlockShape;
		var color = customizeCodeValues.customizeCodeBlockColor.replace(/[^\d\w]/g, '');
		$('#qrCodeGeneratorColorPicker').css('backgroundColor', '#' + color);
		this.colorPicker.ColorPickerSetColor(color);
		// If there is no optionsObject create one with default settings
		var optionsObject = {
			'uuid'         :customizeCodeValues.customizeCodeScannableId,
			'level'        :'m',
			'padding'      :parseInt(customizeCodeValues.customizeCodeBlockPadding, 10),
			'size'         :300,
			'shape'        :customizeCodeBlockShape,
			'effect'       :customizeCodeValues.customizeCodeBlockEffect,
			'template'     :{
				'name'  :'scan',
				'border':customizeCodeValues.customizeCodeBorder.length,
				'header':customizeCodeValues.customizeCodeHeaderText,
				'logo'  :(customizeCodeValues.customizeCodeLogo.length === 1) ? 'scan' : '',
				'footer':customizeCodeValues.customizeCodeFooterText
			},
			'colors'       :{
				'foreground':'60666D',
				'background':'ffffffff',
				'stroke'    :'000000',
				'qr_code'   :customizeCodeValues.customizeCodeBlockColor.replace(/[^\d\w]/g, ''),
				'edge'      :customizeCodeValues.customizeCodeEdgeColor,
				'border'    :customizeCodeValues.customizeCodeBorderColor
			},
			'stroke'       :parseFloat(customizeCodeValues.customizeCodeBlockStroke),
			'group_corners':customizeCodeValues.customizeCodeGroupBlockCorners.length,
			'corner_radius':customizeCodeValues.customizeCodeBlockShape === 'rounded' ? 1 : parseFloat(customizeCodeValues.customizeCodeBlockCornerRadius),
			'curve'        :{
				'strength':parseFloat(customizeCodeValues.customizeCodeBlockCurveStrength),
				'length'  :parseFloat(customizeCodeValues.customizeCodeBlockCurveLength),
				'skew'    :parseFloat(customizeCodeValues.customizeCodeBlockCurveSkew)
			}
		};
		if (customizeCodeValues.customizeCodeCaption.length !== 1) optionsObject['template']['caption'] = '';

		var type = $('#codeType-wrapper :checked').val();
		if (type === 'personalScanPage' || type === 'businessScanPage')
		{
			var buttons = qrCodeGeneratorObject.select(type + 'SocialButtons').getValue().join(' ').toLowerCase().split(' ');

			if (buttons.length > 2 && $('#customizeCodeBadgeType').val() === 'social')
			{
				optionsObject.template.icons = buttons;
			} else
			{
				optionsObject.template.icons = '';
			}
		}

		$('#customizeCodeStyle').val(Json.encode(optionsObject));

		// Create the path to get the new image
		var imageUrl = this.generateScannableImageUrl(optionsObject, customizeCodeValues.customizeCodeUserToken, 'png');


		// And replace old image with new and display it

		var currentImageSrc = $('.customizeCodePreviewCode').find('img').attr('src');

		// only load the image if there is an actual change
		if (imageUrl !== currentImageSrc)
		{
			var image;
			//check to see if we have cached the URL
			if ($.inArray(imageUrl, this.customizeCodePreviewImageUrlCache) === -1)
			{
				// its not cached so we need to add the image url to the cache
				this.customizeCodePreviewImageUrlCache.push(imageUrl);
				// Then create image object and set its source
				image = new Image();
				image.src = imageUrl;
				// fade in the imageloader so the user knows something is happening
				$('.customizeCodePreviewCodeLoader').fadeIn(150);
				$('.customizeCodePreviewCode').hide().empty(); // hide and empty empty the container
				$('.customizeCodePreviewCode').append(image); // place the new image in the container

				// after the http request for the image completes make the image visible, and have it "fadein" by fading out the loading gif
				$(image).load(function ()
				{
					$('.customizeCodePreviewCode').show();
					$('.customizeCodePreviewCodeLoader').fadeOut(250);
					$(image).unbind(); // remove the listener to prevent memory leaks
				});
			}
			else
			{
				// image is cached, so just change the source of the image, as the change is immediate
				image = $('.customizeCodePreviewCode').find('img').attr('src', imageUrl);
			}


			this.oldColor = color;

			return true;
		}
		else
		{
			return false;
		}
	},
	prepareBusinessScanPage   :function ()
	{

		// Set the profile picture if it is already populated
		if ($('#businessScanPageProfilePictureUrl').val() !== '')
		{
			$('.businessScanPage .profilePicture').css({
				'background-image':'url(' + $('#businessScanPageProfilePictureUrl').val() + ')'
			});
		}
		if (this.businessCropSlider !== undefined)
		{
			this.businessCropSlider.destroy();

			this.businessCropSlider = new CropSlider($('.businessScanPage .profilePicture'), {
				imageUrl            :$('#businessScanPageProfilePictureUrl').val(),
				cropCoordinatesInput:$('#businessScanPageProfilePictureCropCoordinates'),
				notifyCrossHairUrl  :"/images/s/icons/drag-cursor.png"
			});
		}

		// Trigger each component's trigger function
		//if($('#customizeCodeShortReference').val() !== '') {
		//$('#businessScanPage').find('.formComponent').trigger('formComponent:changed');
		//}
		this.updateBusinessScanPageInstanceButtons();
		if ($('#customizeCodeShortReference').val() !== '')
		{
			$('#businessScanPage').find('.formComponent:visible').trigger('formComponent:changed');
		}
	},

	preparePersonalScanPage:function ()
	{
		// Set the profile picture if it is already populated
		if ($('#personalScanPageProfilePictureUrl').val() !== '')
		{
			$('.personalScanPage .profilePicture').css({
				'background-image':'url(' + $('#personalScanPageProfilePictureUrl').val() + ')'
			});
		}

		// Trigger each component's trigger function
		if ($('#customizeCodeShortReference').val() !== '')
		{
			$('#personalScanPage').find('.formComponent:visible').trigger('formComponent:changed');
		}


	},

	updateScanPageBackground:function (type, url)
	{
		var backgroundType = $('#' + type + 'ScanPageBackground').val();
		if (!url)
		{
			url = $('#' + type + 'ScanPageBlurredProfilePictureUrl').val();
		}

		var extension = (backgroundType == 'stripes') ? '.gif' : '.jpg';
		console.log(extension, backgroundType.camelCaseToDashes() + extension);

		var oldBackground = $('.content:visible .background:visible');
		var newBackground = $('.content:visible .background:hidden');

		if (backgroundType == 'profilePictureBlurredAndFaded')
		{
			$(newBackground).css({
				'background-image'       :'url(' + url + ')',
				'background-position'    :'50% 0',
				'background-size'        :'365px auto',
				'-webkit-background-size':'365px auto'
			});

		} else
		{
			newBackground.css({'background':'url(/images/mobile/backgrounds/' + backgroundType.camelCaseToDashes() + extension + ')'})
		}
		oldBackground.fadeOut(250, function ()
		{
			oldBackground.css({'z-index':98});
		});
		newBackground.fadeIn(250, function ()
		{
			newBackground.css({'z-index':99});
		});


		//$("#"+type+"ScanPageBackground option[value='profilePictureBlurredAndFaded']").removeAttr('disabled');
	},


	updatePersonalScanPageBackground:function (url)
	{
		var background = $('#personalScanPageBackground').val();
		if (!url)
		{
			url = $('#personalScanPageBlurredProfilePictureUrl').val();
		}
		$('.previewLayer.personalScanPage .frame').attr('style', '').attr('class', 'frame ' + background);
		if ($('.previewLayer.personalScanPage .frame').is('.profilePictureBlurredAndFaded'))
		{
			$('.previewLayer.personalScanPage .frame').css({
				'background-image'       :'url(' + url + ')',
				'background-position'    :'50% 0',
				'background-size'        :'365px auto',
				'-webkit-background-size':'365px auto'
			});
		}
	},

	updateBusinessScanPageInstanceButtons:function (type)
	{
		if (window.qrCodeGeneratorObject === undefined)
		{
			//setTimeout(QrCodeGenerator.updateBusinessScanPageInstanceButtons(type), 1000)
			return false;
		}
		var buttonInstances = qrCodeGeneratorObject.formPages.businessScanPage.formSections.businessScanPageCustomButtons.instanceArray;
		$('.previewLayer.businessScanPage .frame .button').not('.socialButton').hide();
		$('.previewLayer.businessScanPage .frame .contactButtons .button').removeClass('full').removeClass('half').removeClass('third');
		var className = getBusinessMobileButtonClass(buttonInstances.length);
		$.each(buttonInstances, function (buttonIndex, buttonInstance)
		{
			var button = $('.previewLayer.businessScanPage .frame .customButton' + (buttonIndex + 1));
			var componentId = 'businessScanPageCustomButtonText';

			var sectionKey = buttonInstance.id.match(/-section\d+/);
			if (sectionKey)
			{
				componentId += sectionKey;
			}
			var label = buttonInstance.formComponents[componentId].getValue();
			button.show().find('span').text(label);

			if (buttonIndex >= 2)
			{
				button.addClass(className);
			}
		});

		function getBusinessMobileButtonClass(length)
		{
			var className = 'full';
			switch (length)
			{
				case 3 :
					break;
				case 4 :
					className = 'half';
					break;
				case 5:
					className = 'third';
					break;

			}
			return className;
		}

	},

	changeCustomButtonType:function (wrapper)
	{
		var type = $(wrapper).find('select').val();
		var label = $(wrapper).parent().find('label:last');
		if (type === 'website')
		{
			label.text('URL:');
		} else if (type === 'email')
		{
			label.text('Email:');
		} else
		{
			label.text('Number:');
		}
	},

	updateBusinessScanPage:function ()
	{
		var buttonInstances = qrCodeGeneratorObject.formPages.businessScanPage.formSections.businessScanPageCustomButtons.instanceArray;
		$.each(buttonInstances, function (buttonIndex, buttonInstance)
		{
			var button = $('.previewLayer.businessScanPage .frame .customButton' + (buttonIndex + 1));
			var componentId = 'businessScanPageCustomButtonText';

			var sectionKey = buttonInstance.id.match(/-section\d+/);
			if (sectionKey)
			{
				componentId += sectionKey;
			}

			var label = buttonInstance.formComponents[componentId].getValue();
			button.show().find('span').text(label);
		});
	},

	updateInstanceButtonText:function (context)
	{
		console.log(context);
	},

	updatePersonalScanPageContactButtons:function ()
	{
		var contactButtonsArray = [];
		if ($('#personalScanPageEmail').val() !== '')
		{
			contactButtonsArray.push('emailIcon');
		}
		if ($('#personalScanPagePhonePrimary').val() !== '')
		{
			contactButtonsArray.push('phoneIcon');
		}
		if ($('#personalScanPagePhoneMobile').val() !== '')
		{
			contactButtonsArray.push('textIcon');
		}

		var positionClasses = ['left', 'center', 'right'];
		var sizeClasses = ['full', 'half', 'third'];
		var size = sizeClasses[contactButtonsArray.length - 1];

		//<a class="button white third left phoneIcon"

		$('.previewLayer.personalScanPage .contactButtons .button').hide();
		for (var i = 0; i < contactButtonsArray.length; i++)
		{
			$('.previewLayer.personalScanPage .contactButtons .button.' + contactButtonsArray[i])
				.removeClass('full')
				.removeClass('half')
				.removeClass('third')
				.addClass(size)
				.show();
		}
	},

	initializeCodeTypePreviewListeners:function ()
	{
		// Bind the event listener
		$('.codeType label').hover(
			// Mouse over
			function (event)
			{
				if (qrCodeGeneratorObject.scrollingPage)
				{
					return false;
				}

				var self = this;
				var label = $(event.target).closest('label');
				var previewLayer = $('.previewLayer.' + $(self).attr('class')
					.replace('choiceLabel ', '')
					.replace('active', '')
					.split(' ')[0]
				);

				console.log('Mouse in ' + self);

				if (!label.hasClass('active'))
				{
					// Strip active class from all labels
					label.parent().parent().find('label').removeClass('active');

					// Make this label the only active one
					label.addClass('active');

					// Make the checkbox active for this label
					label.parent().find('input').attr('checked', true);
					qrCodeGeneratorObject.checkDependencies(true);

					$('.previewLayer.active').stop().css({
						"opacity":"1"
					}).animate({
							"opacity":"0"
						});
					// Strip active class from all preview layers
					$('.previewLayer').removeClass('active');

					// Add the active class to the current preview layer
					previewLayer.addClass('active');
					previewLayer.stop().css({
						'display':'block',
						'opacity':'0'
					}).animate({
							'opacity':'1'
						});
				}


				/*/ Website label
				 if($(event.target).is('.website')) {
				 console.log('we have a website');
				 }
				 */
			},
			// Mouse out
			function ()
			{
				//var self = this;
			});
		$('.codeType label.active:visible').parent().find('input').attr('checked', 'checked');
	},

	formatCustomButton:function (component)
	{
		var input = $(component),
			type = input.siblings().find('select').val();

		if (type === 'website')
		{
			input.val(this.formatWebAddress(input));
		}
	},

	formatWebAddress:function (component)
	{
		var input = $(component).find('input');
		if ($(input).val() !== '' && !$(input).val().startsWith('http://') && !$(input).val().startsWith('https://'))
		{
			$(input).val('http://' + $(input).val());
		}
	},

	getUsernameFromWebAddress:function (component, baseUrl)
	{
		var input = $(component).find('input');
		if ($(input).val().match(baseUrl))
		{
			var value = $(input).val();
			value = value.replace(/\/$/, '');
			value = value.replace(/^(((ht|f)tp(s)?:\/\/)?(www\.)|http:\/\/|www\.)?/, '');
			var expression = new RegExp(baseUrl);
			value = value.replace(expression, '');
			$(input).val(value);
		}
	},

	submitAjaxData:function (event, element)
	{
		//normalize for browser compatability.
		element = $(element);
		if (event.which === 13)
		{
			if (element.attr('id') === 'twitterFollowUsername')
			{
				this.getTwitterDataByUsername();
			} else
			{
				$(element).parent().find('button').trigger('click');
			}
		} else
		{
			if (element.attr('id') === 'twitterFollowUsername')
			{
				this.updateTwitterFollowPreview();
			} else if (element.attr('id') === 'foursquareCheckInVenueId')
			{
				this.updateFoursquareInPreview();
			} else
			{
				this.updateFacebookCheckInPreview();
			}
		}

	},

	updateFacebookCheckInPreview:function ()
	{
		$('.facebookCheckIn .checkInName').text($('#facebookCheckInPlaceName').val());
	},

	updateFacebookLikePreview:function ()
	{
		console.log('Updating!');
		$('.pageName').text($('#facebookLikePageName').val());
		$('.facebookLikePreviewPageLink').attr('href', $('#facebookLikePageUrl').val());
	},

	updateFoursquareInPreview:function ()
	{
		$('.foursquareCheckIn .checkInName').text($('#foursquareCheckInVenueName').val());
	},

	updateTwitterFollowPreview:function ()
	{
		$('.followName').text($('#twitterFollowUsername').val());
		$('.twitterFollowPreviewPageLink').attr('href', 'http://twitter.com/' + $('#twitterFollowUsername').val());
	},

	keepPreviewInSight:function ()
	{

		if ($.browser.msie && parseFloat($.browser.version) < 9)
		{
			return true;
		} else if ($(window).width() == 980)
		{
			return true;
		}
		var originalTop = $('.previewContainer').position().top;
		var originalRight = $('.previewContainer').css('right');
		var left = $('.previewContainer').offset().left;
		var offsetTop = $('.previewContainer').offset().top - originalTop + (originalTop * 0.5);
		var offsetRight = $(window).width() - $('.bodyBox').offset().left + 31 - $('.bodyBox').outerWidth();
		//var containerBottom, formBottom;
		$(window).resize(function ()
		{
			//left = $('.previewContainer').offset().left;
			offsetRight = $(window).width() - $('.bodyBox').offset().left + 31 - $('.bodyBox').outerWidth();
			if ($('.previewContainer').css('position') === 'fixed')
			{
				$('.previewContainer').css({
					'right':offsetRight
				});
			}
		});

		$(window).scroll(function ()
		{
			if ($(window).height() > $('.previewContainer').outerHeight() + (originalTop))
			{
				if ($(window).scrollTop() >= offsetTop && $('.previewContainer').css('position') !== 'fixed')
				{
					$('.previewContainer').css({
						'position':'fixed',
						'right'   :offsetRight + 'px',
						'top'     :(originalTop / 2)
					});
				} else if ($(window).scrollTop() < offsetTop && $('.previewContainer').css('position') === 'fixed')
				{
					$('.previewContainer').removeAttr('style');
				}
			} else if ($('.previewContainer').css('position') === 'fixed')
			{
				$('.previewContainer').removeAttr('style');
			}


		});
	},

	updateProfilePic:function ()
	{
		var type = $('#codeType-wrapper :checked').val();
		var profilePicUrl = $('#' + type + 'ProfilePictureUrl').val();
		var value = $('#' + type + 'ProfilePicture').val();
		var sliderType = (type === 'personalScanPage' ? 'personal' : 'business');
		if (profilePicUrl !== '' && value === 'uploadFromComputer')
		{
			this[sliderType + 'CropSlider'] = new CropSlider($('.' + type + ' .profilePicture'), {
				imageUrl            :profilePicUrl,
				cropCoordinatesInput:$('#' + type + 'ProfilePictureCropCoordinates'),
				notifyCrossHairUrl  :"/images/s/icons/drag-cursor.png"
			});
			$('.' + type + ' .profilePicture').css({
				'background-image':'url(' + $('#' + type + 'ProfilePictureUrl').val() + ')'
			});
			$("#" + type + "Background option[value='profilePictureBlurredAndFaded']").removeAttr('disabled');
		} else
		{
			if (this[sliderType + 'CropSlider'] !== undefined)
			{
				this[sliderType + 'CropSlider'].destroy();
			}
			this.handlePersonalScanPageProfileEmail();
			$("#" + type + "PageBackground option[value='profilePictureBlurredAndFaded']").attr('disabled', 'disabled');
		}
	},

	showBadgeType:function ()
	{
		if (!$('#customizeCodeLogo-choice1').is(':checked'))
		{
			return false;
		}
		var type = $('#codeType-wrapper :checked').val();
		if (type === 'personalScanPage' || type === 'businessScanPage')
		{
			var buttons = $('#' + type + 'SocialButtons-wrapper :checked').length;
			return buttons > 2;
		} else
		{
			return false;
		}
		return false;
	}

});
var QrCodeGenerator = new QrCodeGeneratorClass();