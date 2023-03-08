package kr.co.shop.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.CounselMapper;
import kr.co.shop.vo.CounselVo;

@Service
@Qualifier("cm")
public class CounselServiceImpl implements CounselService {

	@Autowired
	private CounselMapper mapper;
	
	@Override
	public void counsel_input(HttpSession session, CounselVo cvo, PrintWriter out, Model model) {
		if(session.getAttribute("userid")==null)
			out.print("0");
		else {
			String userid=session.getAttribute("userid").toString();
			cvo.setUserid(userid);
			mapper.counsel_input(cvo);
			out.print("1");
		}
	}
	
	@Override
	public String counsel_list(Model model, HttpServletRequest request) {
		int state=0;
		if(request.getParameter("state")!=null)
			state=Integer.parseInt(request.getParameter("state"));
		
		ArrayList<CounselVo> clist=new ArrayList<CounselVo>();
		clist=mapper.counsel_list(state);
		for(int i=0;i<clist.size();i++)
			clist.get(i).setContent(clist.get(i).getContent().replace("\r\n", "<br>"));

		model.addAttribute("state", state);
		model.addAttribute("clist", clist);
		
		return "/mypage/counsel_list";
	}
	
	@Override
	public String counsel_update(CounselVo cvo) {
		mapper.counsel_update(cvo);
		
		return "redirect:/mypage/counsel_list";
	}
}
