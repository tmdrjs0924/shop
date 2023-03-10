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
			return "redirect:/member/login?chk=9";
		else {
			String userid=session.getAttribute("userid").toString();
			ArrayList<OrderVo> olist=new ArrayList<OrderVo>();
			ArrayList<OrderVo> imsilist=mapper.orderInfo(userid);
			for(int i=0;i<imsilist.size();i++) {
				String[] imsi_code=imsilist.get(i).getOrderCode().split(",");
				String[] imsi_amount=imsilist.get(i).getOrderAmount().split(",");
				String[] imsi_size=imsilist.get(i).getOrderSize().split(",");
				
				ArrayList<OrderVo>[] result=new ArrayList[imsi_code.length];
				for(int j=0;j<imsi_code.length;j++) {
					result[j]=new ArrayList<OrderVo>();
				}
				for(int j=0;j<result.length;j++) {
					OrderVo ovo=new OrderVo();
					if(j<1) {
						ovo.setOrderNumber(imsilist.get(i).getOrderNumber());
					}
					ovo.setId(imsilist.get(i).getId());
					ovo.setOrderState(imsilist.get(i).getOrderState());
					ovo.setOrderDate(imsilist.get(i).getOrderDate());
					ovo.setOrderTotalPrice(Integer.toString(imsilist.get(i).getOrderTotalPrice()));
					ovo.setOrderCode(imsi_code[j]);
					ovo.setOrderAmount(imsi_amount[j]);
					ovo.setOrderSize(imsi_size[j]);
					ovo.setpName(mapper.pInfo(imsi_code[j]).getpName());
					ovo.setpImg1(mapper.pInfo(imsi_code[j]).getpImg1());
					ovo.setpPrice(mapper.pInfo(imsi_code[j]).getpPrice());
					ovo.setpDc(mapper.pInfo(imsi_code[j]).getpDc());
					
					result[j].add(ovo);
				}
				for(int j=0;j<result.length;j++) {
					olist.addAll(result[j]);
				}
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
			
			ArrayList<OrderVo> olist=new ArrayList<OrderVo>();
			ArrayList<OrderVo> imsilist=mapper.orderInfo2(orderNumber, userid);
			String[] imsi_code=imsilist.get(0).getOrderCode().split(",");
			String[] imsi_amount=imsilist.get(0).getOrderAmount().split(",");
			String[] imsi_size=imsilist.get(0).getOrderSize().split(",");
				
			ArrayList<OrderVo>[] result=new ArrayList[imsi_code.length];
			for(int j=0;j<imsi_code.length;j++) {
				result[j]=new ArrayList<OrderVo>();
			}
			for(int j=0;j<result.length;j++) {
				OrderVo ovo=new OrderVo();
				if(j<1) {
					ovo.setOrderNumber(imsilist.get(0).getOrderNumber());
					ovo.setOrderState(imsilist.get(0).getOrderState());
					ovo.setOrderDate(imsilist.get(0).getOrderDate());
					ovo.setOrderTotalPrice(Integer.toString(imsilist.get(0).getOrderTotalPrice()));
				}
				ovo.setOrderCode(imsi_code[j]);
				ovo.setOrderAmount(imsi_amount[j]);
				ovo.setOrderSize(imsi_size[j]);
				ovo.setpName(mapper.pInfo(imsi_code[j]).getpName());
				ovo.setpImg1(mapper.pInfo(imsi_code[j]).getpImg1());
				ovo.setpPrice(mapper.pInfo(imsi_code[j]).getpPrice());
				ovo.setpDc(mapper.pInfo(imsi_code[j]).getpDc());
				
				result[j].add(ovo);
			}
			for(int j=0;j<result.length;j++) {
				olist.addAll(result[j]);
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
}
