package kr.co.shop.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.MypageService;
import kr.co.shop.vo.CounselVo;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("cm")
	private MypageService service;
	
	@RequestMapping("/mypage/counsel_input")
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model) {
		service.counsel_input(session, cvo, out, model);
	}
	
	@RequestMapping("/mypage/order_history")
	public String order_history(HttpSession session, Model model) {
		return service.order_history(session, model);
	}
	
	@RequestMapping("/mypage/state_change")
	public String state_change(HttpServletRequest request) {
		return service.state_change(request);
	}
}
