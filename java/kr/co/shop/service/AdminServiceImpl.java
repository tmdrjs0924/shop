package kr.co.shop.service;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shop.mapper.AdminMapper;
import kr.co.shop.vo.BoardVo;
import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.Criteria;
import kr.co.shop.vo.PageDTO;
import kr.co.shop.vo.ProductVo;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	@Override
	public String category(Model model) {
		ArrayList<Cate1Vo> cate1 = mapper.getCate1();
		model.addAttribute("cate1", cate1);
		return "/admin/category";
	}
	
	//상품 등록 페이지
	@Override
	public String product(Model model) {
		ArrayList<Cate1Vo> cate1 = mapper.getCate1();
		model.addAttribute("cate1", cate1);
		return "/admin/product";
	}
	
	//카테고리 관련
	@Override
	public void getCate2(HttpServletRequest request, PrintWriter out) {
		String cate1Code = request.getParameter("cate1Code");
		ArrayList<Cate2Vo> cate2 = mapper.getCate2(cate1Code);
		
		String str="<option> "+URLEncoder.encode("중분류")+"</option>";
		for(int i=0;i<cate2.size();i++)
		{
			str=str+"<option value='"+cate2.get(i).getCate2Id()+"'> "+URLEncoder.encode(cate2.get(i).getCate2Name()) +" ("+cate2.get(i).getCate2Id()+")"+" </option>";
		}
		out.print(str);
	}
	@Override
	public void getCate3(HttpServletRequest request, PrintWriter out) {
		String cate2Code = request.getParameter("cate2Code");
		ArrayList<Cate3Vo> cate3 = mapper.getCate3(cate2Code);
		
		String str="<option> "+URLEncoder.encode("소분류")+"</option>";
		for(int i=0;i<cate3.size();i++)
		{
			str=str+"<option value='"+cate3.get(i).getCate3Id()+"'> "+URLEncoder.encode(cate3.get(i).getCate3Name())+" ("+cate3.get(i).getCate3Id()+")"+" </option>";
		}
		out.print(str);
	}
	
	@Override
	public String cate1_insert(Cate1Vo c1vo) {
		mapper.cate1_insert(c1vo);
		return "redirect:/admin/category";
	}
	@Override
	public String cate2_insert(Cate2Vo c2vo) {
		mapper.cate2_insert(c2vo);
		return "redirect:/admin/category";
	}
	@Override
	public String cate3_insert(Cate3Vo c3vo) {
		mapper.cate3_insert(c3vo);
		return "redirect:/admin/category";
	}
	
	//상품코드 가져오기
	@Override
	public void getPcode(HttpServletRequest request, PrintWriter out) {
		String imsi = request.getParameter("imsi");
		out.print(mapper.getPcode("p"+imsi));
	}
	
	//상품등록
	@Override
	public String productInsertAction(HttpServletRequest request) throws Exception {
		String path=request.getRealPath("/resources/pro");
		int size = 1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String pCode = multi.getParameter("pCode");
		String pName = multi.getParameter("pName");
		String pSize= multi.getParameter("pSize");
		
		int pPrice = Integer.parseInt(multi.getParameter("pPrice"));
		int pState = Integer.parseInt(multi.getParameter("pState"));
		int pDc = Integer.parseInt(multi.getParameter("pDc"));
		int pMile = Integer.parseInt(multi.getParameter("pMile"));
		int pInven = Integer.parseInt(multi.getParameter("pInven"));
		
		String pImg1 = multi.getFilesystemName("pImg1");
		String pImg2 = multi.getFilesystemName("pImg2");
		String pImg3 = multi.getFilesystemName("pImg3");
		
		ProductVo pvo = new ProductVo();
		pvo.setpCode(pCode);
		pvo.setpName(pName);
		pvo.setpSize(pSize);

		pvo.setpPrice(pPrice);
		pvo.setpState(pState);
		pvo.setpDc(pDc);
		pvo.setpMile(pMile);
		pvo.setpInven(pInven);

		pvo.setpImg1(pImg1);
		pvo.setpImg2(pImg2);
		pvo.setpImg3(pImg3);
		
		mapper.productInsertAction(pvo);
		return "redirect:/admin/product";
	}
	
	//상품목록
	@Override
	public String productList(Criteria cri, Model model) {
		model.addAttribute("plist", mapper.productList(cri));
		model.addAttribute("pageMaker",	new PageDTO(cri, mapper.productTotal(cri)));
		model.addAttribute("total2", mapper.productTotal2(cri));
		model.addAttribute("total3", mapper.productTotal3(cri));
		return "/admin/productList";
	}
	
	//상품삭제
	@Override
	public String productDelete(HttpServletRequest request) {
		String[] id = request.getParameter("id").split(",");
		
		for(int i=0;i<id.length;i++)
		{
			mapper.productDelete(id[i]);	
		}
		return "redirect:/admin/productList";
	}
	
	//판매중지
	@Override
	public String productOff(HttpServletRequest request) {
		String[] id = request.getParameter("id").split(",");
		
		for(int i=0;i<id.length;i++)
		{
			mapper.productOff(id[i]);	
		}
		return "redirect:/admin/productList";
	}
	//판매중
	@Override
	public String productOn(HttpServletRequest request) {
		String[] id = request.getParameter("id").split(",");
		
		for(int i=0;i<id.length;i++)
		{
			mapper.productOn(id[i]);	
		}
		return "redirect:/admin/productList";
	}
	
	//상품정보
	@Override
	public String productDetail(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		ProductVo pvo = mapper.productDetail(id);
		model.addAttribute("pvo", pvo);
		return "/admin/productDetail";
	}
	
	//상품수정
	@Override
	public String productModify(HttpServletRequest request, ProductVo pvo) throws Exception {
		String path = request.getRealPath("/resources/pro");
		int size=1024*1024*2;
		MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		String pCode = multi.getParameter("pCode");
		String pName = multi.getParameter("pName");
		String pSize = multi.getParameter("pSize");
		
		int pPrice = Integer.parseInt(multi.getParameter("pPrice"));
		int pState = Integer.parseInt(multi.getParameter("pState"));
		int pDc = Integer.parseInt(multi.getParameter("pDc"));
		int pMile = Integer.parseInt(multi.getParameter("pMile"));
		int pInven = Integer.parseInt(multi.getParameter("pInven"));
		
		String pImg1 = multi.getFilesystemName("pImg1");
		String pImg2 = multi.getFilesystemName("pImg2");
		String pImg3 = multi.getFilesystemName("pImg3");
		
		pvo.setpCode(pCode);
		pvo.setpDc(pDc);
		pvo.setpImg1(pImg1);
		pvo.setpImg2(pImg2);
		pvo.setpImg3(pImg3);
		pvo.setpInven(pInven);
		pvo.setpMile(pMile);
		pvo.setpName(pName);
		pvo.setpPrice(pPrice);
		pvo.setpSize(pSize);
		pvo.setpState(pState);
		
		mapper.productModify(pvo);
			
		return "redirect:/admin/productList";
	}

	//주문관리
	@Override
	public String order(Model model, Criteria cri) {
		model.addAttribute("olist", mapper.order());
		model.addAttribute("orderTotal", mapper.orderTotal(cri));
		
		//오늘 총 주문건수, 주문금액
		model.addAttribute("todayOrderAmount", mapper.getTodayOrderAmount(0,99));
		model.addAttribute("todayOrderPrice", mapper.getTodayOrderPrice(0,99));

		//오늘 실 주문건수, 주문금액
		model.addAttribute("todayOrderAmount2", mapper.getTodayOrderAmount(0,9));
		model.addAttribute("todayOrderPrice2", mapper.getTodayOrderPrice(0,9));
		
		//어제 총 주문건수, 주문금액
		model.addAttribute("yesterdayOrderAmount", mapper.getTodayOrderAmount(1,99));
		model.addAttribute("yesterdayOrderPrice", mapper.getTodayOrderPrice(1,99));

		//어제 실 주문건수, 주문금액
		model.addAttribute("yesterdayOrderAmount2", mapper.getTodayOrderAmount(1,9));
		model.addAttribute("yesterdayOrderPrice2", mapper.getTodayOrderPrice(1,9));
		
		//최근 1주일 총 주문건수, 주문금액
		model.addAttribute("weekOrderAmount", mapper.getWeekOrderAmount(99));
		model.addAttribute("weekOrderPrice", mapper.getWeekOrderPrice(99));
		
		//최근 1주일 실 주문건수, 주문금액
		model.addAttribute("weekOrderAmount2", mapper.getWeekOrderAmount(9));
		model.addAttribute("weekOrderPrice2", mapper.getWeekOrderPrice(9));

		
		//이번달 총 주문건수, 주문금액
		model.addAttribute("monthOrderAmount", mapper.getMonthOrderAmount(99));
		model.addAttribute("monthOrderPrice", mapper.getMonthOrderPrice(99));
		
		//이번달 실 주문건수, 주문금액
		model.addAttribute("monthOrderAmount2", mapper.getMonthOrderAmount(9));
		model.addAttribute("monthOrderPrice2", mapper.getMonthOrderPrice(9));
		
		//이번달 실 환불건수, 주문금액
		
		for(int i=0;i<11;i++) {
			model.addAttribute("orderAmount"+i, mapper.orderAmount(i));
		}
		
		return "/admin/order";
	}

	//주문리스트
	@Override
	public String orderList(Model model, Criteria cri) {
		model.addAttribute("olist", mapper.orderList(cri));
		model.addAttribute("pageMaker",	new PageDTO(cri, mapper.orderTotal(cri)));
		model.addAttribute("orderTotal", mapper.orderTotal(cri));
		return "/admin/orderList";
	}
	
	//주문상태변경
	@Override
	public String orderModify(HttpServletRequest request) {
		String orderState = request.getParameter("orderState");
		String orderNumber = request.getParameter("orderNumber");
		
		mapper.orderModify(orderState, orderNumber);
		return "redirect:/admin/orderList";
	}
	
	//게시판관리
	@Override
	public String board(Model model) {
		model.addAttribute("blist", mapper.board());
		return "/admin/border";
	}

	//게시판목록
	@Override
	public String boardList(Model model) {
		model.addAttribute("blist", mapper.boardList());
		return "/admin/boardList";
	}
		
	//게시판 답변
	@Override
	public String boardAction(BoardVo bvo) {
		mapper.boardAction(bvo);
		return "redirect:/admin/boardList";
	}
	
		
	
}