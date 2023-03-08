package kr.co.shop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.CounselService;
import kr.co.shop.vo.CounselVo;

@Controller
public class CounselController {

	@Autowired
	@Qualifier("cm")
	private CounselService service;
	
	@RequestMapping("/mypage/counsel_input")
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model) {
		service.counsel_input(session, cvo, out, model);;
	}
	
	@RequestMapping("/mypage/counsel_list")
	public String counsel_list(Model model, HttpServletRequest request) {
		return service.counsel_list(model, request);
	}
	
	@RequestMapping("/mypage/counsel_update")
	public String counsel_update(CounselVo cvo) {
		return service.counsel_update(cvo);
	}
}
