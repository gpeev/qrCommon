package com.djstat.controller;


import com.djstat.model.qr.BusinessCard;
import com.djstat.service.QRCodeServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class QrCodeEntryPointController
{
	private LocaleResolver localeResolver;
	private MessageSource messageSource;
	private QRCodeServices qrServices;

	@RequestMapping(value = "/{shortCode}", method = RequestMethod.GET)
	public final String getQrCodeImg(
			@PathVariable("shortCode") final String shortCode, final HttpServletRequest req,final ModelMap model)
	{
		String type = shortCode.charAt(0) + "";
		if (type != null && type.equals("b"))
		{
			String sCode = shortCode.substring(1);
			BusinessCard qrCommon = qrServices.getQrCommon(sCode);
			if (qrCommon != null)
			{
				req.getSession().setAttribute(shortCode,qrCommon);
				System.out.println("Found the QR:"+qrCommon);
				//QrController2 controller2 = new QrController2();
				//controller2.page(shortCode,model,req);
				//return "forward:/qr/page/businessCard/"+shortCode;
				//BusinessCard bc = (BusinessCard)req.getSession().getAttribute("shortCode");
				model.addAttribute("businesscard", qrCommon);
				//return "qr/page/b";
				return "redirect:/qr/page/b/"+shortCode;
			}
		}
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$ Redirecting>>> "+req.getServletPath());
		return req.getServletPath();
	}


	//===========================================


	public LocaleResolver getLocaleResolver()
	{
		return localeResolver;
	}

	@Autowired
	public void setLocaleResolver(LocaleResolver localeResolver)
	{
		this.localeResolver = localeResolver;
	}

	public MessageSource getMessageSource()
	{
		return messageSource;
	}

	@Autowired
	public void setMessageSource(MessageSource messageSource)
	{
		this.messageSource = messageSource;
	}

	public QRCodeServices getQrServices()
	{
		return qrServices;
	}

	@Autowired
	public void setQrServices(QRCodeServices qrServices)
	{
		this.qrServices = qrServices;
	}
}
