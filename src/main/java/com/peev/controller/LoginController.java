package com.peev.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;


@Controller
public class LoginController
{
	@RequestMapping(value = "/login/error", method = RequestMethod.GET)
	public final String error(final ModelMap modelMap)
	{
		modelMap.put("error", true);
		return "login";
	}

	@RequestMapping(value = "/login/validate", method = RequestMethod.POST)
	@ResponseBody
	public final Map<String, Boolean> validate(
			@RequestBody final Map<String, String> request)
	{
		final Map<String, Boolean> response = new HashMap<String, Boolean>();

		response.put("found",true);

		return response;
	}


}
