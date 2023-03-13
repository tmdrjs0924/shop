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
import kr.co.shop.vo.ProductVo;
import kr.co.shop.vo.ReviewVo;

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
			return "redirect:/member/login?chk=9";
		else {
			String userid=session.getAttribute("userid").toString();
			String orderNumber="";
			
			ArrayList<OrderVo> olist=mapper.orderInfo(userid, orderNumber);
			for(int i=0;i<olist.size();i++) {
				String[] code=olist.get(i).getOrderCode().split(",");
				String[] amount=olist.get(i).getOrderAmount().split(",");
				String[] size=olist.get(i).getOrderSize().split(",");
				String[] orderPnumber=olist.get(i).getOrderPnumber().split(",");
				
				ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
				for(int j=0;j<code.length;j++) {
					ProductVo pvo=new ProductVo();
					pvo=mapper.productInfo(code[j]);
					pvo.setAmount(amount[j]);
					pvo.setpSize(size[j]);
					int rchk=mapper.check_review(olist.get(i).getId(), orderPnumber[j]);
					pvo.setRchk(rchk);
					
					plist.add(pvo);
				}
				olist.get(i).setPlist(plist);
			}
			
			model.addAttribute("olist", olist);
			
			return "/mypage/order_history";
		}
	}
	
	@Override
	public String order_detail(HttpServletRequest request, HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "../member/login?chk=9";
		else {
			String userid=session.getAttribute("userid").toString();
			String orderNumber=request.getParameter("orderNumber");
			
			ArrayList<OrderVo> olist=mapper.orderInfo(userid, orderNumber);
			for(int i=0;i<olist.size();i++) {
				String[] code=olist.get(i).getOrderCode().split(",");
				String[] amount=olist.get(i).getOrderAmount().split(",");
				String[] size=olist.get(i).getOrderSize().split(",");
				
				int originPrice=0;
				int originDc=0;
				for(int j=0;j<code.length;j++) {
					int price=mapper.productInfo(code[j]).getpPrice();
					int dc=mapper.productInfo(code[j]).getpDc();
					originPrice=originPrice+price*Integer.parseInt(amount[j]);
					originDc=originDc+(price*dc/100)*Integer.parseInt(amount[j]);
				}
				olist.get(i).setOriginPrice(originPrice);
				olist.get(i).setOriginDc(originDc);
				
				ArrayList<ProductVo> plist=new ArrayList<ProductVo>();
				for(int j=0;j<code.length;j++) {
					ProductVo pvo=new ProductVo();
					pvo=mapper.productInfo(code[j]);
					pvo.setAmount(amount[j]);
					pvo.setpSize(size[j]);
					
					plist.add(pvo);
				}
				olist.get(i).setPlist(plist);
			}
			model.addAttribute("olist", olist);
			
			return "/mypage/order_detail";
		}
	}
	
	@Override
	public String state_change(HttpServletRequest request) {
		String id=request.getParameter("id");
		String orderState=request.getParameter("orderState");
		mapper.state_change(orderState, id);
		
		return "redirect:/mypage/order_history";
	}
	
	@Override
	public String review(HttpServletRequest request, ProductVo pvo, Model model) {
		model.addAttribute("index", request.getParameter("index"));
		model.addAttribute("orderId", request.getParameter("id"));
		model.addAttribute("pvo", pvo);
		return "/mypage/review";
	}
	
	@Override
	public void review_ok(HttpServletRequest request, HttpSession session, ReviewVo rvo, PrintWriter out) {
		int index=Integer.parseInt(request.getParameter("index"));
		int orderId=Integer.parseInt(request.getParameter("orderId"));
		String userid=session.getAttribute("userid").toString();
		String[] orderPnumber=mapper.before_review(orderId).split(",");
		String Pnumber=orderPnumber[index];
		
		rvo.setOrderId(orderId);
		rvo.setUserid(userid);
		rvo.setPnumber(Pnumber);
		mapper.review_ok(rvo);
		
		out.print("1");
	}
	
}
