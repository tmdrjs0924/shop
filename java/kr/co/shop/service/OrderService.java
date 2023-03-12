package kr.co.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.OrderVo;

public interface OrderService {
	public String order(OrderVo ovo, Model model, HttpSession session);
	public String orderAction(OrderVo ovo);
	public String list(Model model, HttpServletRequest request);
}
