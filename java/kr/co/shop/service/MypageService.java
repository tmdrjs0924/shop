package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.CounselVo;

public interface MypageService {
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model);
	public String order_history(HttpSession session, Model model);
	public String state_change(HttpServletRequest request);
}
