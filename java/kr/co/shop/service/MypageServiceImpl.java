package kr.co.shop.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.MypageMapper;
import kr.co.shop.mapper.OrderMapper;
import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.OrderVo;

@Service
@Qualifier("cm")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageMapper mapper;
	
	@Override
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model) {
		if(session.getAttribute("userid")==null)
			out.print("0");
		else {
			String userid=session.getAttribute("userid").toString();
			cvo.setUserid(userid);
			mapper.counsel_input(cvo);
			out.print("1");
		}
	}
	
	@Override
	public String order_history(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "../member/login?chk=9";
		else {
			String userid=session.getAttribute("userid").toString();
			ArrayList<OrderVo> imsilist=mapper.order_history(userid);
			String[] imsi=imsilist.get(0).getOrderCode().split(",");
			for(int i=0;i<imsi.length;i++) {
				ArrayList<OrderVo>[] olist=ArrayList[imsi.length];
			}
			model.addAttribute("olist", imsilist);
			return "/mypage/order_history";
		}
	}
	
	@Override
	public String state_change(HttpServletRequest request) {
		String id=request.getParameter("id");
		String state=request.getParameter("state");
		mapper.state_change(id, state);
		
		return "redirect:/mypage/order_history";
	}
}
