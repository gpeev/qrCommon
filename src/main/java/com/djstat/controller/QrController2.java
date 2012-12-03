package com.djstat.controller;

import com.djstat.form.PreviewUpdate;
import com.djstat.form.qr.BusinessCardForm;
import com.djstat.model.QrArtifact;
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

public class QrController2
{
	/**
	 * This is the entry into the app - all url reqs are first processed here so we can pull up the qr it need be.
	 *
	 * @param shortCode
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/{shortCode}", method = RequestMethod.GET)
	public final String getQrCodeImg(
			@PathVariable("shortCode") final String shortCode, final HttpServletRequest req, final ModelMap model)
	{
		QrArtifact qr = qrServices.getQrCommon(shortCode);

		if (qr != null)
		{
			model.addAttribute(QRDATA, qr);

			// todo - pull this out and make general since it will be required in most renderings
			model.addAttribute("directUrl", getUrl(req));

			String renderPage = "qr/page/default";
			switch (qr.getType())
			{
				case CONTACTCARD:
					renderPage = "qr/page/b";
					break;
			}
			return renderPage;
		}
		//	req.getSession().setAttribute(shortCode, qr);
//			System.out.println("Found the QR:" + qrCommon);
//			model.addAttribute("businesscard", qrCommon);
		//return "qr/page/b";
//			return "redirect:/qr/page/b/" + shortCode;

		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$ Redirecting>>> " + req.getServletPath());
		return req.getServletPath();
	}


	public static final String QRDATA = "qrdata";

	private LocaleResolver localeResolver;
	private MessageSource messageSource;
	private QRCodeServices qrServices;

	// ==================== Input Forms : Start
	@RequestMapping(value = "/qr/businessCard", method = RequestMethod.GET)
	public final String createBusinessCard(final ModelMap model)
	{
		model.addAttribute("bcard", new BusinessCardForm());
		return "qr/businessCard";
	}
	// ==================== Input Forms : End


	// ==================== Form Processing : Start
	@RequestMapping(value = "/qr/businessCard/submit", method = RequestMethod.POST)
	public final String submitBusinessCard(@ModelAttribute(
			QRDATA) @Valid final BusinessCardForm bcf, final BindingResult binding, final HttpServletRequest req)
	{
		//final Locale locale = localeResolver.resolveLocale(req);

		if (binding.hasErrors())
		{
			return "qr/businessCard";
		}

		QrArtifact card = new QrArtifact();
		card.setAddress(bcf.getAddress());
		card.setFirstName(bcf.getFirstName());
		card.setLastName(bcf.getLastName());
		card.setEmail(bcf.getEmail());
		card.setPhone(bcf.getPhone());
		card.setUsername(req.getUserPrincipal().getName());
		card.setType(QrArtifact.QrType.CONTACTCARD);
		String shortCode = qrServices.createBusinessCard(card);

		return "redirect:/qr/prepFinal/" + shortCode;
	}


	@RequestMapping(value = "/qr/previewUpdate/submit", method = RequestMethod.POST)
	public final String submitPreviewUpdate(
			@ModelAttribute(QRDATA) @Valid final PreviewUpdate pre, final BindingResult binding, final HttpServletRequest req)
	{
		if (binding.hasErrors())
		{
			return "qr/businessCard";
		}
		return "redirect:/qr/prepFinal/" + pre.getShortCode();
	}

		// ==================== Form Processing : End


	@RequestMapping(value = "/qr/prepFinal/{shortCode}", method = RequestMethod.GET)
	public final String renderGet(@PathVariable("shortCode") final String shortCode, final ModelMap model, final HttpServletRequest req)
	{
		QrArtifact qr = qrServices.getQrCommon(shortCode);
		//todo - put qr into PreviewUpdate

		PreviewUpdate up = new PreviewUpdate(qr);


		model.addAttribute("qrdata", qr);
		model.addAttribute("preUpdate", up);
		model.addAttribute("directUrl", getUrl(req));
		return "qr/prepFinal";
	}


	///########################################################################################

	/**
	 * Used to show a sample page of qr type
	 *
	 * @param shortCode
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/qr/page/{shortCode}", method = RequestMethod.GET)
	public final String page(@PathVariable(
			"shortCode") final String shortCode, final ModelMap model, final HttpServletRequest req)
	{

		QrArtifact qr = qrServices.getQrCommon(shortCode.substring(1));
		model.addAttribute(QRDATA, qr);

		// todo - pull this out and make general since it will be required in most renderings
		model.addAttribute("directUrl", getUrl(req));

		String renderPage = "qr/page/default";
		switch (qr.getType())
		{
			case CONTACTCARD:
				renderPage = "qr/page/b";
				break;
		}
		return renderPage;
	}

	/**
	 * Used to trigger the generation of a v-card in the v-card format.
	 *
	 * @param shortCode
	 * @param model
	 * @param req
	 * @param res
	 */
	@RequestMapping(value = "/qr/addToContacts/{shortCode}", method = RequestMethod.GET)
	public void addToContacts(@PathVariable(
			"shortCode") final String shortCode, final ModelMap model, final HttpServletRequest req,
			final HttpServletResponse res)
	{
		QrArtifact bc = qrServices.getQrCommon(shortCode);
		//model.addAttribute(QRDATA, bc);
		//model.addAttribute("directUrl", getUrl(req));
		PrintWriter out = null;

		try
		{
			out = res.getWriter();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}

		if (out != null)
		{
			out.print(bc);
			out.flush();
		}
	}


	private String getUrl(HttpServletRequest req)
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


	@RequestMapping(value = "/qr/qrList", method = RequestMethod.GET)
	public final String getList(final HttpServletRequest req, final ModelMap model)
	{
		String uname = req.getUserPrincipal().getName();
		List<QrArtifact> list = qrServices.getQrCodeList2(uname);
		System.out.println("Cnt [" + uname + "] = " + list.size());
		model.addAttribute("qrListBusinessCard", list);
		model.addAttribute("directUrl", getUrl(req));
		return "qr/list";
	}

	@RequestMapping(value = "/qr/deleteAllBusinessCards", method = RequestMethod.GET)
	public final String delAllBusinessCards()
	{
		qrServices.deleteAllBusinessCards();
		return "redirect:/qr/qrList";
	}

	@RequestMapping(value = "/qr/deleteAllQrArtifacts", method = RequestMethod.GET)
	public final String delAllQrArtifacts()
	{
		qrServices.deleteAllBusinessCards();
		return "redirect:/qr/qrList";
	}


	@RequestMapping(value = "/qr/img/{shortCode}/{size}", method = RequestMethod.GET)
	public final void getQrCodeImg(@PathVariable(
			"shortCode") final String shortCode,@PathVariable(
			"size")  String size, final HttpServletRequest req, final HttpServletResponse res)
	{

		if(size==null||size.equals(""))
			size=450+"";
		String url = getUrl(req) + "/"+shortCode;
		System.out.println("Create QR Code with URL["+size+"]: " + url);
		ByteArrayOutputStream out = QRCode.from(url).withSize(Integer.parseInt(size),Integer.parseInt(size)).to(
				ImageType.GIF).stream();
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
