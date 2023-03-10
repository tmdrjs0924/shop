package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.OrderVo;

public interface MypageMapper {
	public void counsel_input(CounselVo cvo);
	public ArrayList<OrderVo> orderInfo(String userid);
	public OrderVo pInfo(String pCode);
	public ArrayList<OrderVo> orderInfo2(String orderNumber, String userid);
	public void state_change(String orderState, String id);
}
