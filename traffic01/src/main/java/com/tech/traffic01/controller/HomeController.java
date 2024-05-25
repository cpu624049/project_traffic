package com.tech.traffic01.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.traffic01.dto.XmlData1;
import com.tech.traffic01.dto.XmlData2;
import com.tech.traffic01.service.Cat2Service;
import com.tech.traffic01.service.Cat3Service;
import com.tech.traffic01.service.DataService;
import com.tech.traffic01.service.XmlParsingService1;
import com.tech.traffic01.service.XmlParsingService2;

@Controller
public class HomeController {

	@Autowired
	private XmlParsingService1 xmlParsingService1;
	@Autowired
	private XmlParsingService2 xmlParsingService2;
	
	@Autowired
	private SqlSession sqlSession;
	
	private DataService cat2service;
	private DataService cat3service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {

		return "home";
	}

	@RequestMapping(value = "/cat1", method = RequestMethod.GET)
	public String cat1(HttpServletRequest request, Model model) {

		List<XmlData1> xmlDataList1 = xmlParsingService1.parseXmlData();
		model.addAttribute("xmlDataList1", xmlDataList1);

		return "cat1";
	}
	
	@RequestMapping(value = "/side_right", method = RequestMethod.GET)
	public String side_right(HttpServletRequest request, Model model) {
		
		List<XmlData1> xmlDataList1 = xmlParsingService1.parseXmlData();
		model.addAttribute("xmlDataList1", xmlDataList1);
		
		List<XmlData2> xmlDataList2 = xmlParsingService2.parseXmlData();
		model.addAttribute("xmlDataList2", xmlDataList2);
		
		return "side_right";
	}
	
	@RequestMapping(value = "/cat2", method = RequestMethod.GET)
	public String cat2(HttpServletRequest request, Model model) {
	
		model.addAttribute("request", request);
		
		cat2service = new Cat2Service(sqlSession);
		cat2service.execute(model);

		System.out.println(model);
		
		return "cat2";
	
	}
	
	@RequestMapping(value = "/side_right_2", method = RequestMethod.GET)
	public String side_right2(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		return "side_right_2";
	}

	@RequestMapping(value = "/cat3", method = RequestMethod.GET)
	public String cat3(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		cat3service = new Cat3Service(sqlSession);
		cat3service.execute(model);

		System.out.println(model);
		
		return "cat3";
	}

	@RequestMapping(value = "/cat4", method = RequestMethod.GET)
	public String cat4(HttpServletRequest request, Model model) {

		return "cat4";
	}
}
