package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface ProductService {
	public String list(HttpServletRequest request, Model model, HttpSession session);
	public String display_list(HttpServletRequest request, Model model, HttpSession session);
	public String dc_list(HttpServletRequest request, Model model, HttpSession session);
	public String content(HttpServletRequest request, Model model,HttpSession session);
	public void cart_add2(HttpSession session, HttpServletRequest request, PrintWriter out);
	public void wish_add2(HttpSession session, HttpServletRequest request, PrintWriter out);
	public void wish_add(HttpServletRequest request,HttpSession session,PrintWriter out);
	public String main(HttpServletRequest request, HttpSession session, Model model);
	public String product_search(HttpServletRequest request, Model model, HttpSession session);
}