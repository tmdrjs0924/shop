package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.OrderVo;
import kr.co.shop.vo.ProductVo;

public interface MypageMapper {
	public void counsel_input(CounselVo cvo);
	public ArrayList<OrderVo> orderInfo(String userid, String orderNumber);
	public ProductVo productInfo(String pCode);
	public void state_change(String orderState, String id);
}
