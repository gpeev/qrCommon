package com.djstat.controller;


import com.djstat.form.QrData;
import com.djstat.form.qr.BusinessCardForm;
import com.djstat.model.qr.BusinessCard;
import com.djstat.service.QRCodeServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Locale;

@Controller
@RequestMapping("/qr")
public class QrController2
{
	public static final String BUSINESSCARD = "businesscard";

	private LocaleResolver localeResolver;
	private MessageSource messageSource;
	private QRCodeServices qrServices;

	@RequestMapping(value = "/businessCard", method = RequestMethod.GET)
	public final String createBusinessCard(final ModelMap model)
	{
		model.addAttribute(BUSINESSCARD, new BusinessCardForm());
		return "qr/businessCard";
	}

	@RequestMapping(value = "/prepFinal/{key}", method = RequestMethod.GET)
	public final String renderGet(@PathVariable("key") final String key, final ModelMap model)
	{
		String type = new String(""+key.charAt(0));

		if(type!=null && type.equals("b"))
		{
			model.addAttribute("qrdata", qrServices.getQrCommon(key));
		}

			return "qr/prepFinal";
	}


	@RequestMapping(value = "/businessCard/submit", method = RequestMethod.POST)
	public final String submitBusinessCard(@ModelAttribute(BUSINESSCARD) @Valid final BusinessCardForm bcf, final BindingResult binding, final HttpServletRequest req, final HttpServletResponse res)
	{
		//final Locale locale = localeResolver.resolveLocale(req);

		if(binding.hasErrors())
		{
			return "qr/businessCard";
		}


		BusinessCard card = new BusinessCard();
		card.setAddress(bcf.getAddress());
		card.setFirstName(bcf.getFirstName());
		card.setLastName(bcf.getLastName());
		//card.setEmail(bcf.getEmail());
		//card.setPhone(bcf.getPhone());
		//card.setUsername(req.getUserPrincipal().getName());

		String shortCode = qrServices.createBusinessCard(card);
		return "redirect:/qr/prepFinal/b" + shortCode;

	}


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
