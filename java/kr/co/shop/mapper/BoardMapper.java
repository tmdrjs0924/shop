package kr.co.shop.mapper;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.co.shop.vo.BoardVo;

@Service
public interface BoardMapper {
	public void write_ok(BoardVo bvo);
	public ArrayList<BoardVo> list(int index, int rnum);
	public BoardVo update(BoardVo bvo);
	public void update_ok(BoardVo bvo);
	public void delete(BoardVo bvo);
	public int getChong(int rnum);
}
