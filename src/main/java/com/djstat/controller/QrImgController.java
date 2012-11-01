package com.djstat.controller;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;


@Controller
@RequestMapping("/qimg")
public class QrImgController
{

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

		url += "/myqrs/action/"+img+"/" + id;

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


}
