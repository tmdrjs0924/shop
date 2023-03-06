package kr.co.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.shop.vo.BoardVo;

public interface BoardService {
	public String write_ok(BoardVo bvo, HttpServletRequest request) throws Exception;
	public String list(Model model, HttpServletRequest request);
	public String update(Model model, BoardVo bvo);
	public String update_ok(HttpServletRequest request, BoardVo bvo) throws Exception;
	public String delete(BoardVo bvo);
}
