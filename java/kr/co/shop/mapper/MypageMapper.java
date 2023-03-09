package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CounselVo;
import kr.co.shop.vo.OrderVo;

public interface MypageMapper {
	public void counsel_input(CounselVo cvo);
	public ArrayList<OrderVo> order_history(String userid);
	public void state_change(String id, String state);
}
