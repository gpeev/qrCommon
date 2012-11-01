package com.peev.controller;


import gui.ava.html.image.generator.HtmlImageGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;

@Controller
public class ImgCreator
{


    @RequestMapping(value = "/api/gen/img/{name}/{key}", method = RequestMethod.GET)
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


    private String getHTML()
    {
        String h = "";
        try
        {
            URL url = new URL("http://localhost:8080/excludes/qrTemplate");

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
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return h;
    }



}
