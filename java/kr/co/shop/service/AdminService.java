package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.Criteria;
import kr.co.shop.vo.ProductVo;

public interface AdminService {
	public String category(Model model);
	public String product(Model model);
	
	//카테고리 관련
	public void getCate2(HttpServletRequest request, PrintWriter out);
	public void getCate3(HttpServletRequest request, PrintWriter out);
	public String cate1_insert(Cate1Vo c1vo);
	public String cate2_insert(Cate2Vo c2vo);
	public String cate3_insert(Cate3Vo c3vo);
	
	//상품코드 관련
	public void getPcode(HttpServletRequest request, PrintWriter out);
	
	//상품 등록
	public String productInsertAction(HttpServletRequest request)throws Exception;
	
	//상품 목록
	public String productList(Criteria cri,Model model);
	
	//상품삭제
	public String productDelete(HttpServletRequest request);

	//판매중
	public String productOn(HttpServletRequest request);
	
	//판매중지
	public String productOff(HttpServletRequest request);
	
	//상품 정보
	public String productDetail(HttpServletRequest request, Model model);
	
	//상품 수정
	public String productModify(HttpServletRequest request, ProductVo pvo) throws Exception;
	
	//주문관리
	public String order(Model model, Criteria cri);

	//주문리스트
	public String orderList(Model model, Criteria cri);
	
	//주문상태 변경
	public String orderModify(HttpServletRequest request);
}
