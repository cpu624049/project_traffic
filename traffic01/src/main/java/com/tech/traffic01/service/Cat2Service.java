package com.tech.traffic01.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.traffic01.dao.Cat2Dao;
import com.tech.traffic01.dto.Cat2Dto1;
import com.tech.traffic01.dto.Cat2Dto2;

public class Cat2Service implements DataService{
	
	private SqlSession sqlSession;

	public Cat2Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		Cat2Dao dao = sqlSession.getMapper(Cat2Dao.class);

		ArrayList<Cat2Dto1> cat2Data1 = dao.cat2Data1();
		ArrayList<Cat2Dto2> cat2Data2 = dao.cat2Data2();

		model.addAttribute("cat2Data1", cat2Data1);
		model.addAttribute("cat2Data2", cat2Data2);
		
	}
}
