package kr.co.shop.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.shop.mapper.BoardMapper;
import kr.co.shop.vo.BoardVo;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public String write_ok(BoardVo bvo, HttpServletRequest request) throws Exception {
		String path=request.getRealPath("/resources/img/");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		String memberId=multi.getParameter("memberId");
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String bimg="";
		if(multi.getFilesystemName("bimg")!=null)
			bimg=multi.getFilesystemName("bimg");
		int sort=Integer.parseInt(multi.getParameter("sort"));
		int bimil;
		if(multi.getParameter("bimil")==null)
			bimil=0;
		else
			bimil=1;
		
		bvo.setmemberId(memberId);
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setBimg(bimg);
		bvo.setSort(sort);
		bvo.setBimil(bimil);
		mapper.write_ok(bvo);
		
		return "redirect:/board/list";
	}
	
	@Override
	public String list(Model model, HttpServletRequest request) {
		int page, rnum, index, pstart, pend, chong;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=10;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		chong=mapper.getChong(rnum);
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		ArrayList<BoardVo> list=mapper.list(index, rnum);
		for(int i=0;i<list.size();i++) {
			list.get(i).setOrder(i);
		}
		String content="";
		for(int i=0;i<list.size();i++) {
			content=list.get(i).getContent().replace("\r\n", "<br>");
			list.get(i).setContent(content);
		}
		String answer="";
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getAnswer()!=null)
				answer=list.get(i).getAnswer().replace("\r\n", "<br>");
			list.get(i).setAnswer(answer);
		}
		model.addAttribute("list", list);
		
		return "/board/list";
	}
	
	public String update(Model model, BoardVo bvo) {
		BoardVo bvo2=mapper.update(bvo);
		bvo2.setBimg(bvo2.getBimg().replace(",", ""));
		model.addAttribute("bvo", bvo2);
		
		return "/board/update";
	}
	
	public String update_ok(HttpServletRequest request, BoardVo bvo) throws Exception {
		String path=request.getRealPath("/resources/img");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		int id=Integer.parseInt(multi.getParameter("id"));
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		
		String delimg=multi.getParameter("delimg");
		File file=new File(path+"/"+delimg);
		if(file.exists())
			file.delete();
    	String eximg=multi.getParameter("eximg");
    	String bimg=multi.getFilesystemName("bimg")+",";
    	bimg=bimg+eximg;
    	bimg=bimg.replace("null,", "");
		System.out.println("del:"+delimg+" "+"ex:"+eximg+" "+"img:"+bimg);
		int sort=Integer.parseInt(multi.getParameter("sort"));
		int bimil;
		if(multi.getParameter("bimil")==null)
			bimil=0;
		else
			bimil=1;
		
		bvo.setId(id);
		bvo.setTitle(title);
		bvo.setContent(content);
		bvo.setBimg(bimg);
		bvo.setSort(sort);
		bvo.setBimil(bimil);
		mapper.update_ok(bvo);
		
		return "redirect:/board/list";
	}
	public String delete(BoardVo bvo) {
		mapper.delete(bvo);
		
		return "redirect:/board/list";
	}
}
