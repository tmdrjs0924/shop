package kr.co.shop.controller;

import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.shop.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@RequestMapping("/")
	public String home() {
		return "redirect:/main/main";
	}
	@RequestMapping("/main/main")
	public String main(HttpServletRequest request, HttpSession session, Model model) {
		return service.main(request, session, model);
	}
	
	@RequestMapping("/product/cart_add2")
	public void cart_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		service.cart_add2(session, request, out);
	}
	
	@RequestMapping("/product/wish_add2")
	public void wish_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		service.wish_add2(session, request, out);
	}
	
	@RequestMapping("/product/list")
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		return service.list(request, model, session);
	}
	
	@RequestMapping("/product/display_list")
	public String display_list(HttpServletRequest request, Model model, HttpSession session) {
		return service.display_list(request, model, session);
	}
	
	@RequestMapping("/product/dc_list")
	public String dc_list(HttpServletRequest request, Model model, HttpSession session) {
		return service.dc_list(request, model, session);
	}
	
	@GetMapping("/product/content")
	public String content(HttpServletRequest request, Model model,HttpSession session) {
		return service.content(request, model,session);
	}
	
	@RequestMapping("/product/wish_add")
	public void wish_add(HttpSession session,HttpServletRequest request,PrintWriter out) {
		service.wish_add(request,session,out);
	}
	
	@RequestMapping("/product/product_search")
	public String product_search(HttpServletRequest request, Model model, HttpSession session) {
		return service.product_search(request, model, session);
	}
}
