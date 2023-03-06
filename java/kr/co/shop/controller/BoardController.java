package kr.co.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.shop.service.BoardService;
import kr.co.shop.vo.BoardVo;

@Controller
public class BoardController {

	@Autowired
	@Qualifier("bs")
	private BoardService service;
	
	@RequestMapping("/board/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping("/board/write_ok")
	public String write_ok(BoardVo bvo, HttpServletRequest request) throws Exception {
		return service.write_ok(bvo, request);
	}
	
	@RequestMapping("/board/list")
	public String list(Model model, HttpServletRequest request) {
		return service.list(model, request);
	}
	
	@RequestMapping("/board/update")
	public String update(HttpServletRequest request, Model model, BoardVo bvo) {
		return service.update(model, bvo);
	}
	
	@RequestMapping("/board/update_ok")
	public String update_ok(HttpServletRequest request, BoardVo bvo) throws Exception {
		return service.update_ok(request, bvo);
	}
	
	@RequestMapping("/board/delete")
	public String delete(BoardVo bvo) {
		return service.delete(bvo);
	}
}