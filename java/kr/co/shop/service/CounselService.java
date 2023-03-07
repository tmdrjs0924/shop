package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.CounselVo;

public interface CounselService {
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model);
	public String counsel_list(HttpSession session, Model model);
	public String counsel_update(CounselVo cvo);
}
