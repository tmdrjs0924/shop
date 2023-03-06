package kr.co.shop.mapper;


import java.util.ArrayList;

import kr.co.shop.vo.MemberVo;
import kr.co.shop.vo.OrderVo;
import kr.co.shop.vo.ProductVo;

public interface OrderMapper {
	public ProductVo getProduct(String pCode);
	public MemberVo getMember(String userid);
	public void orderAction(OrderVo ovo);
	public int getNumber(String number);
	public OrderVo list(String orderNumber);
}
