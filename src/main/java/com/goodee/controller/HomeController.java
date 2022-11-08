package com.goodee.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goodee.service.ListService;

@Controller
public class HomeController {
	public ListService service;
	
	public HomeController(ListService service) {
		this.service = service;
	}

	@RequestMapping(value="/") 
	public String home(Model model, HttpServletRequest request) {
		service.selectTotalBest(model);
		service.selectBestReview(model);
		return "main";
	}
	
}
