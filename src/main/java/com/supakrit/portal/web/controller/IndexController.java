package com.supakrit.portal.web.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/v1")
public class IndexController {

	@GetMapping("/index")
	public String index(Model model) {
		Date d = new Date();
		model.addAttribute("Date", d);
		return "index";
	}
	
}
