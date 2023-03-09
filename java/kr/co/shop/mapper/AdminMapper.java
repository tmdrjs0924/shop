package kr.co.shop.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.shop.vo.BoardVo;
import kr.co.shop.vo.Cate1Vo;
import kr.co.shop.vo.Cate2Vo;
import kr.co.shop.vo.Cate3Vo;
import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.Criteria;
import kr.co.shop.vo.OrderVo;
import kr.co.shop.vo.ProductVo;

public interface AdminMapper {
	//카테고리 불러오기
	public ArrayList<Cate1Vo> getCate1();
	public ArrayList<Cate2Vo> getCate2(String cate1Code);
	public ArrayList<Cate3Vo> getCate3(String cate2Code);

	//카테고리 등록
	public void cate1_insert(Cate1Vo c1vo);
	public void cate2_insert(Cate2Vo c2vo);
	public void cate3_insert(Cate3Vo c3vo);
	
	//상품코드
	public int getPcode(String imsi);
	
	//상품등록
	public void productInsertAction(ProductVo pvo);
	
	//상품리스트
	public List<ProductVo> productList(Criteria cri);
	
	//상품 총개수
	public int productTotal(Criteria cri);

	//판매중 총개수
	public int productTotal2(Criteria cri);

	//판매안함 총개수
	public int productTotal3(Criteria cri);
	
	//상품 삭제
	public void productDelete(String id);

	//판매중
	public void productOn(String id);
	
	//판매중지
	public void productOff(String id);
	
	//상품 정보
	public ProductVo productDetail(String id);
	
	//상품 정보
	public void productModify(ProductVo pvo);
	
	//주문관리
	public ArrayList<OrderVo> order();

	//주문리스트
	public ArrayList<OrderVo> orderList(Criteria cri);
	
	//주문상태변경
	public void orderModify(String orderState, String orderNumber);
	
	//주문총건수
	public int orderTotal(Criteria cri);
	
	//주문 상태별 건수
	public int orderAmount(int orderState);
	
	//주문날짜별 주문데이터 건수
	public int getTodayOrderAmount(int day, int orderState);

	//주문날짜별 주문데이터 건수
	public int getTodayOrderPrice(int day, int orderState);

	//이번주 총 주문  건수
	public int getWeekOrderAmount(int orderState);	

	//이번주 총 주문 금액
	public int getWeekOrderPrice(int orderState);
	
	//이번달 총 주문  건수
	public int getMonthOrderAmount(int orderState);	

	//이번달 총 주문 금액
	public int getMonthOrderPrice(int orderState);
	
	//게시판 관리
	public ArrayList<BoardVo> board();

	//게시글 목록
	public ArrayList<BoardVo> boardList(Criteria cri);
	
	//게시판총건수
	public int boardTotal(Criteria cri);
	
	//게시글 답변
	public void boardAction(BoardVo bvo);
	
	//게시글 삭제
	public void boardDelete(String id);
	
	//1대1목록
	public ArrayList<CounselVo> counselList(Criteria cri);
	
	//1대1 총건수
	public int counselTotal(Criteria cri);
	
	//1대1 삭제
	public void counselDelete(String id);
}
