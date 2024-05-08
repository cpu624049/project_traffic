package com.tech.traffic.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String main(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		return "body/main";
	}
	
	@RequestMapping("main")
	public String main2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		return "main/main";
	}
}