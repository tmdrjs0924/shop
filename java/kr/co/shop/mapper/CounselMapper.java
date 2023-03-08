package kr.co.shop.mapper;

import java.util.ArrayList;

import kr.co.shop.vo.CounselVo;

public interface CounselMapper {
	public void counsel_input(CounselVo cvo);
	public ArrayList<CounselVo> counsel_list(int state); 
	public void counsel_update(CounselVo cvo);
}
