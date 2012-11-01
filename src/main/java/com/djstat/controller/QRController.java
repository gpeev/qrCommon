package com.djstat.controller;


import com.djstat.form.QrData;
import com.djstat.form.vCard;
import com.djstat.model.QrArtifact;
import com.djstat.model.vCardEntity;
import com.djstat.service.QRCodeServices;
import com.djstat.util.Common;
import gui.ava.html.image.generator.HtmlImageGenerator;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.LocaleResolver;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import javax.validation.Valid;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.*;
import java.util.List;


@Controller
@RequestMapping("/myqrs")
public class QRController
{
	protected static final String QRDATA = "qrdata";
	protected static final String VCARD = "vcard";

	private LocaleResolver localeResolver;
	private MessageSource messageSource;
	private QRCodeServices qrServices;


	@RequestMapping(value = "/generate", method = RequestMethod.POST)
	public final String submit(@ModelAttribute(QRDATA) @Valid final QrData qrData, final BindingResult binding, final HttpServletRequest req, final HttpServletResponse res)
	{
		System.out.println("JUST POSTED TO GENERATE");
		String qrText = qrData.getQrText();
		String id = qrServices.addQrContent(qrText);
		return "redirect:render/" + id; //preserves the key in the url. - goes to renderGet()...
	}


	@RequestMapping(value = "/render/{key}", method = RequestMethod.GET)
	public final String renderGet(@PathVariable("key") final String key, final ModelMap model)
	{
		System.out.println("RENDER GET");

		model.addAttribute(QRDATA, qrServices.getQrArtifiact(key));
		return "myqrs/render";
	}

	@RequestMapping(value = "/action/{key}", method = RequestMethod.GET)
	public final void qrAction(@PathVariable("key") final String key, final ModelMap model, final HttpServletResponse res)
	{
		//this will get the underlying content -
		// could be a url, email, phone, vCard, etc


		PrintWriter out = null;

		System.out.println("RENDER GET");
		QrArtifact artifact = qrServices.getQrArtifiact(key);

		try
		{
			out = res.getWriter();
			if(Common.isPhoneNumber(artifact.getQrText()))
			{
				out.print("<script>window.location='tel:" + artifact.getQrText() + "';</script>");
			}
			else
			{

				String qrText = artifact.getQrText();
				if(qrText != null && (!qrText.equals("http"))) qrText = "http://" + qrText;
				out.print("<script>window.location='" + qrText + "';</script>");
			}
			out.flush();

		}
		catch (IOException e)
		{
			e.printStackTrace();
		}


		//	model.addAttribute(QRDATA, null);
		//	return "qr/render";
	}


	@RequestMapping(value = "/qrimg/{type}/{key}", method = RequestMethod.GET)
	public final void getQrCodeImg(@PathVariable("type") final String type, @PathVariable("key") final String key, final HttpServletRequest req, final HttpServletResponse res)
	{
		String id = qrServices.getVCard(key).getId();
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
		if(port != null && !port.equals("80")) url += ":" + port;

		url += "/myqrs/action/" + type + "/" + id;

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


	@RequestMapping(value = "/testQr/{img}", method = RequestMethod.GET)
	public final void getTestQr(@PathVariable("img") final String img, final HttpServletRequest req, final HttpServletResponse res)
	{
		String id = "qrServices.getVCard(key).getId()";
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
		if(port != null && !port.equals("80")) url += ":" + port;

		url += "/myqrs/action/" + img + "/" + id;

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

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public final String create(final ModelMap model)
	{
		List<QrArtifact> l = qrServices.getQrCodeList();
		model.addAttribute("qrdata", new QrData());
		model.addAttribute("qrlist", l);
		return "myqrs/create";
	}


	//todo - doing now
	@RequestMapping(value = "/dash", method = RequestMethod.GET)
	public final String populateDash(final ModelMap model, final HttpServletRequest req)
	{
		List<vCardEntity> l = qrServices.getVCards(req.getUserPrincipal().getName());
		System.out.println("vCardEntity.size:" + l.size());
		//model.addAttribute("qrdata", new QrData());
		model.addAttribute(VCARD, l);
		return "/dashboard";
	}


	@RequestMapping(value = "/vcardcreate", method = RequestMethod.GET)
	public final String createVCard(final ModelMap model)
	{
		model.addAttribute(VCARD, new vCard());
		return "myqrs/vCardCreate";
	}


	@RequestMapping(value = "/submitvcard", method = RequestMethod.POST)
	public final String submit(@ModelAttribute(VCARD) @Valid final vCard vcard, final BindingResult binding, final HttpServletRequest req)
	{
		final Locale locale = localeResolver.resolveLocale(req);

		if(binding.hasErrors())
		{
			return "myqrs/vCardCreate";
		}

		System.out.println("Principle: " + req.getUserPrincipal().getName());

		Enumeration en = req.getAttributeNames();
		//	System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~ ATTRIBUTES ~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		while (en.hasMoreElements())
		{
			String key = (String) en.nextElement();
			Object val = req.getAttribute(key);
			//		System.out.println(key+" = "+val);
		}


		//String uid = qrServices.createUid(req.getUserPrincipal().getName(),VCARD);


		String uid = qrServices.addVCard(req.getUserPrincipal().getName(), vcard);


		// http:// servername/vcard/uid


		//- est the username
		//- add username to qrData
		//- add TYPE to qrData
		//- create a UID for qrData - this will be part of target URL that is encoded in QR Code
		//
		// create a vCardEntity object
		// load the data from model object
		// save the entity
		// redirect to ideas page - offer ideas for TYPE


		//	final UserAccount user = new UserAccount(register.getUsername());
		//	user.setDisplayName(register.getDisplayName());
//		user.setEmail(register.getEmail());
//		user.setPassword(passwordEncoder.encodePassword(register.getPassword(), user.getSalt()));

//		try
//		{
//			userDetailsService.addUser(user, locale);
//		}
//		catch (DuplicateException e)
//		{
//			binding.addError(new FieldError(VCARD, "username", messageSource.getMessage("create.error.username", null, locale)));
//			return "myqrs/vCardCreate";
//		}

		return "redirect:/myqrs/ideas/VCARD/" + uid;
	}

	@RequestMapping(value = "/ideas/{type}/{key}", method = RequestMethod.GET)
	public final String renderIdeas(@PathVariable("type") final String type, @PathVariable("key") final String key, final ModelMap model)
	{
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>ideas - type:" + type + " key:" + key);
		if(type != null && type.equalsIgnoreCase("vcard"))
		{
			model.addAttribute(VCARD, qrServices.getVCard(key));
			return "myqrs/render";

		}

		model.addAttribute(QRDATA, qrServices.getQrArtifiact(key));
		return "myqrs/render";
	}

	//----------- todo =============
	@RequestMapping(value = "/createOrUpdateScannableFromFormValues", method = RequestMethod.POST)
	@ResponseBody
	public String generatePost(final HttpServletRequest req)
	{
		System.out.println("================== /createOrUpdateScannableFromFormValues - POST ==========================");
		Map<String, String> gen = gen(req);
		System.out.println("Size:" + gen.size());
		//return gen;
		return "{\"status\":\"success\",\"response\":{\"id\":\"scn-012ab121-9f3f-4552-a46d-a0f9b85d9883\",\"shortReference\":\"x9pdz9\",\"optionsString\":\"W10=\",\"croppedPictureUrl\":null}}";
	}


	public Map<String, String> gen(HttpServletRequest req)
	{
		Enumeration en = req.getAttributeNames();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~ ATTRIBUTES ~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		while (en.hasMoreElements())
		{
			String key = (String) en.nextElement();
			Object val = req.getAttribute(key);
			//	System.out.println(key+" = "+val);
		}

		Enumeration hen = req.getHeaderNames();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~ HEADERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		while (hen.hasMoreElements())
		{
			String key = (String) hen.nextElement();
			Object val = req.getHeader(key);
			//	System.out.println(key+" = "+val);
		}


		Enumeration pen = req.getParameterNames();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~ PARAMS ~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		while (pen.hasMoreElements())
		{
			String key = (String) pen.nextElement();
			Object val = req.getParameter(key);
			System.out.println(key + " = " + val);
		}

		System.out.println("========================OOOOOOOOOOOOOOOOOOOO===============================");

		Map<String, String> ret = new HashMap<String, String>();
		Map<String, String> response = new HashMap<String, String>();
		ret.put("status", "success");

		response.put("id", "scn-012ab121-9f3f-4552-a46d-a0f9b85d9883");
		response.put("shortReference", "x9pdz9");
		response.put("optionsString", "W10=");
		response.put("croppedPictureUrl", "null");


		String s = "{\"id\":\"scn-012ab121-9f3f-4552-a46d-a0f9b85d9883\",\"shortReference\":\"x9pdz9\",\"optionsString\":\"W10=\",\"croppedPictureUrl\":null}";
		ret.put("response", s);

		return response;
	}

	@RequestMapping(value = "/qrimggen2/{name}/{key}", method = RequestMethod.GET)
	public final void getImgFromHtml2(@PathVariable("name") final String name, @PathVariable("key") final String key, final HttpServletRequest req, final HttpServletResponse res)
	{
		HtmlImageGenerator imageGenerator = new HtmlImageGenerator();
		imageGenerator.setSize(new Dimension(300,500));
		imageGenerator.loadHtml(getHTML());
		BufferedImage image = imageGenerator.getBufferedImage();

		try
		{
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(image, "jpg", baos);
			byte[] bytes = baos.toByteArray();
			res.setContentType("image/jpg");
			res.setContentLength(bytes.length);
			OutputStream outStream = res.getOutputStream();
			outStream.write(bytes);
			outStream.flush();
			outStream.close();
		}
		catch (UnknownHostException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/qrimggen/{name}/{key}", method = RequestMethod.GET)
	public final void getImgFromHtml(@PathVariable("name") final String name, @PathVariable("key") final String key, final HttpServletRequest req, final HttpServletResponse res)
	{
		try
		{

			String html = "<html>" +
					"<h1>:)</h1>" +
					"Hello World!<br>" +
					"Name:" + name + "<br>" +
					"Key:" + key + "<br>" +
					"<img src=\"http://img0.gmodules.com/ig/images/igoogle_logo_sm.png\"><br>" +
					"<img src=\"http://localhost:8080/qimg/testQr/g.png\">" +
					"</html>";

			JLabel label = new JLabel(getHTML());
			label.setSize(300, 500);
			BufferedImage image = new BufferedImage(label.getWidth(), label.getHeight(), BufferedImage.TYPE_INT_ARGB);
			// paint the html to an image
			Graphics g = image.getGraphics();
			g.setColor(Color.WHITE);
			//g.
			label.paint(g);
			g.dispose();

			// get the byte array of the image (as jpeg)
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(image, "jpg", baos);
			byte[] bytes = baos.toByteArray();
			res.setContentType("image/jpg");
			res.setContentLength(bytes.length);
			OutputStream outStream = res.getOutputStream();
			outStream.write(bytes);
			outStream.flush();
			outStream.close();
		}
		catch (UnknownHostException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}


	private String getHTML()
	{
		String h = "";
		try
		{
			URL url = new URL("http://localhost:8080/js/qr.html.js");

			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));

			String inputLine;
			while ((inputLine = in.readLine()) != null)
			{

				h += inputLine;
				//System.out.println(inputLine);
			}
			in.close();

		}
		catch (MalformedURLException e)
		{
			e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
		}
		catch (IOException e)
		{
			e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
		}
		return h;
	}

//=============================================================================================
//=============================================================================================
//=============================================================================================
//=============================================================================================


	/**
	 * Gets the locale resolver.
	 *
	 * @return the locale resolver
	 */
	public final LocaleResolver getLocaleResolver()
	{
		return localeResolver;
	}

	/**
	 * Sets the locale resolver.
	 *
	 * @param localeResolver the locale resolver
	 */
	@Autowired
	public final void setLocaleResolver(final LocaleResolver localeResolver)
	{
		this.localeResolver = localeResolver;
	}


	/**
	 * Gets the message source.
	 *
	 * @return the message source
	 */
	public final MessageSource getMessageSource()
	{
		return messageSource;
	}

	/**
	 * Sets the message source.
	 *
	 * @param messageSource the message source
	 */
	@Autowired
	public final void setMessageSource(final MessageSource messageSource)
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
