package kr.co.shop.mapper;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import kr.co.shop.vo.JusoVo;
import kr.co.shop.vo.MemberVo;

public interface MemberMapper {
	
	public void join_ok(MemberVo mvo);
	
	public int userid_check(String userid);
	
    public MemberVo login_ok(MemberVo mvo);
	
    public String userid_search(String name,String email);
    
    public String pwd_search(String name,String email,String userid);
    
    public MemberVo member_view(String userid);
    
    public MemberVo member_edit(String userid);
    
    public void member_edit_ok(MemberVo mvo);
    
    public MemberVo member_delete(String userid);
    
    public void memberDelete(String userid);
    
    public MemberVo checkMemberId(@Param("userid") String userid);
    
    public MemberVo pwd_edit(String userid);
    
    public void pwd_edit_ok(MemberVo mvo);
    
    public MemberVo pwd_check_ok(MemberVo mvo);

    public void pwd_change_ok(MemberVo mvo);
    
    public void juso_edit_ok(JusoVo jvo);
    
    public ArrayList<JusoVo> juso_list(String userid);
    
    public int getChong(int rnum);
    
    public void juso_delete(String id);
    
    public void juso_gibon(String id);
    
    public void juso_gibonoff(String id);
}
