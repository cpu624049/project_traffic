package com.tech.traffic01.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.traffic01.dto.XmlData1;
import com.tech.traffic01.service.XmlParsingService1;

@Controller
public class ApiController {
	
	@Autowired
	private XmlParsingService1 xmlParsingService1;
	
	@RequestMapping(value = "/side_right", method = RequestMethod.GET)
	public String cat1(HttpServletRequest request, Model model) {
		
		List<XmlData1> xmlDataList1 = xmlParsingService1.parseXmlData();
		model.addAttribute("xmlDataList1", xmlDataList1);
		
		return "side_right";
	}

}
