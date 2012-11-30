package com.djstat.controller;


import com.djstat.form.qr.BusinessCardForm;
import com.djstat.model.qr.BusinessCard;
import com.djstat.service.QRCodeServices;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
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
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

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

	@RequestMapping(value = "/page/b/{shortCode}", method = RequestMethod.GET)
	public final String page(@PathVariable(
			"shortCode") final String shortCode, final ModelMap model, final HttpServletRequest req)
	{

		BusinessCard bc = (BusinessCard) qrServices.getQrCommon(shortCode.substring(1));
		model.addAttribute(BUSINESSCARD, bc);
		model.addAttribute("directUrl", getUrl(req));
		return "qr/page/b";
	}

	@RequestMapping(value = "/addToContacts/{shortCode}", method = RequestMethod.GET)
	public void addToContacts(@PathVariable(
			"shortCode") final String shortCode, final ModelMap model, final HttpServletRequest req, final HttpServletResponse res)
	{
		BusinessCard bc = (BusinessCard) qrServices.getQrCommon(shortCode.substring(1));
		model.addAttribute(BUSINESSCARD, bc);
		model.addAttribute("directUrl", getUrl(req));
		PrintWriter out = null;

		try
		{
			out = res.getWriter();
		}
		catch (IOException e)
		{
			e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
		}

		if(out!=null)
		{
			out.print(bc);
			out.flush();
			return;
		}


		//return "qr/page/b";
	}

	@RequestMapping(value = "/prepFinal/{key}", method = RequestMethod.GET)
	public final String renderGet(@PathVariable("key") final String key, final ModelMap model)
	{
		String type = key.charAt(0) + "";
		if (type != null && type.equals("b"))
		{
			String shortCode = key.substring(1);
			BusinessCard qrCommon = qrServices.getQrCommon(shortCode);
			model.addAttribute("qrdata", qrCommon);
			model.addAttribute("shortCode", shortCode);
		}

		return "qr/prepFinal";
	}


	public String getUrl(HttpServletRequest req)
	{
		String url = null;

		try
		{
			url = req.getScheme() + "://" + InetAddress.getLocalHost().getHostAddress();

		}
		catch (UnknownHostException e)
		{
			e.printStackTrace();
		}
		String port = req.getServerPort() + "";
		if (port != null && !port.equals("80")) { url += ":" + port; }

		return url;

	}

	@RequestMapping(value = "/businessCard/submit", method = RequestMethod.POST)
	public final String submitBusinessCard(@ModelAttribute(
			BUSINESSCARD) @Valid final BusinessCardForm bcf, final BindingResult binding, final HttpServletRequest req, final HttpServletResponse res)
	{
		//final Locale locale = localeResolver.resolveLocale(req);

		if (binding.hasErrors())
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
		System.out.println("ShortCode being entered: " + shortCode);

		return "redirect:/qr/prepFinal/b" + shortCode;

	}

	@RequestMapping(value = "/qrList", method = RequestMethod.GET)
	public final String getList(final HttpServletRequest req, final HttpServletResponse res, final ModelMap model)
	{
		String uname = req.getUserPrincipal().getName();
		List<BusinessCard> list = qrServices.getQrCodeList2(uname);
		System.out.println("Cnt [" + uname + "] = " + list.size());
		model.addAttribute("qrListBusinessCard", list);
		model.addAttribute("directUrl", getUrl(req));
		return "qr/list";
	}

	@RequestMapping(value = "/deleteAll", method = RequestMethod.GET)
	public final String delAll(final HttpServletRequest req, final HttpServletResponse res, final ModelMap model)
	{
		qrServices.deleteAll();
		//System.out.println("Cnt ["+uname+"] = "+list.size());
		//model.addAttribute("qrListBusinessCard", list);

		return "redirect:/qr/qrList";
	}

	@RequestMapping(value = "/img/{type}/{key}", method = RequestMethod.GET)
	public final void getQrCodeImg(@PathVariable("type") final String type, @PathVariable(
			"key") final String key, final HttpServletRequest req, final HttpServletResponse res)
	{
		//String id = qrServices.getVCard(key).getId();
		String url = null;

		try
		{
			url = req.getScheme() + "://" + InetAddress.getLocalHost().getHostAddress();
			System.out.println("HostAddress:" + InetAddress.getLocalHost().getHostAddress());
			System.out.println("ConAddress:" + InetAddress.getLocalHost().getCanonicalHostName());
			System.out.println("HostName:" + InetAddress.getLocalHost().getHostName());

		}
		catch (UnknownHostException e)
		{
			e.printStackTrace();
		}
		String port = req.getServerPort() + "";
		if (port != null && !port.equals("80")) { url += ":" + port; }

		url += "/qr/action/" + type + key;

		System.out.println("Create QR Code with URL: " + url);
		ByteArrayOutputStream out = QRCode.from(url).to(ImageType.PNG).stream();
		res.setContentType("image/png");
		res.setContentLength(out.size());


		try
		{
			OutputStream outStream = res.getOutputStream();
			outStream.write(out.toByteArray());
			outStream.flush();
			outStream.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}


	//========================================================================

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
