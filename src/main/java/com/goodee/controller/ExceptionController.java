package com.goodee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExceptionController {
	@GetMapping("/error404")
	public String error404() {
		return "error/404";
	}
	@GetMapping("/error500")
	public String error500() {
		return "error/500400";
	}
	@GetMapping("/error400")
	public String error400() {
		return "error/500400";
	}
}
