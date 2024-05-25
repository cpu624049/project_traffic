package com.tech.traffic01.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.traffic01.dao.Cat3Dao;
import com.tech.traffic01.dto.Cat2Dto1;
import com.tech.traffic01.dto.Cat2Dto2;
import com.tech.traffic01.dto.Cat3Dto1;
import com.tech.traffic01.dto.Cat3Dto2;
import com.tech.traffic01.dto.Cat3Dto3;
import com.tech.traffic01.dto.Cat3Dto4;

public class Cat3Service implements DataService{
	
	private SqlSession sqlSession;

	public Cat3Service(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		Cat3Dao dao = sqlSession.getMapper(Cat3Dao.class);

		ArrayList<Cat3Dto1> cat3Data1 = dao.cat3Data1();
		ArrayList<Cat3Dto2> cat3Data2 = dao.cat3Data2();
		ArrayList<Cat3Dto3> cat3Data3 = dao.cat3Data3();
		ArrayList<Cat3Dto4> cat3Data4 = dao.cat3Data4();

		model.addAttribute("cat3Data1", cat3Data1);
		model.addAttribute("cat3Data2", cat3Data2);
		model.addAttribute("cat3Data3", cat3Data3);
		model.addAttribute("cat3Data4", cat3Data4);

	}
}
