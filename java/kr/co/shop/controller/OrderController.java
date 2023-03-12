package kr.co.shop.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.OrderService;
import kr.co.shop.vo.OrderVo;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderservice;
	
	@RequestMapping("/order/order")
	public String order(OrderVo ovo, Model model, HttpSession session) {
		return orderservice.order(ovo, model, session);
	}
	
	@PostMapping("/order/orderAction")
	public String orderAction(OrderVo ovo) {
		return orderservice.orderAction(ovo);
	}
	
	@GetMapping("/order/list")
	public String list(Model model, HttpServletRequest request) {
		return orderservice.list(model, request);
	}
}
