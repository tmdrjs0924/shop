package kr.co.shop.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.shop.mapper.ProductMapper;
import kr.co.shop.vo.ProductVo;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;
	
	@Override
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		String pCode="";
		if(request.getParameter("pCode")!=null)
			pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}

		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		total=mapper.listTotal(rnum, pCode);
		if(pend>total)
			pend=total;

		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("pCode", pCode);
		model.addAttribute("list", mapper.list(pCode, index, rnum));
		
		return "/product/list";
	}
	
	@Override
	public String display_list(HttpServletRequest request, Model model, HttpSession session) {
		int pShow=Integer.parseInt(request.getParameter("pShow"));
		String pCode="";
		if(request.getParameter("pCode")!=null)
			pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}
		
		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		total=mapper.displayTotal(rnum, pShow, pCode);
		if(pend>total)
			pend=total;

		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("pShow", pShow);
		model.addAttribute("pCode", pCode);
		model.addAttribute("display_list", mapper.display_list(pCode, pShow, index, rnum));
		
		return "/product/display_list";
	}
	
	@Override
	public String dc_list(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}
		
		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		total=mapper.dcTotal(rnum);
		if(pend>total)
			pend=total;
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("total", total);
		model.addAttribute("dc_list", mapper.dc_list(index, rnum));
		
		return "/product/dc_list";
	}
	
	@Override
	public void cart_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")==null) {
			out.print("2");
		}
		else {
			String userid=session.getAttribute("userid").toString();
			boolean cchk=mapper.getCart(pCode, userid);
			if(cchk==true)
				out.print("1");
			else {
				String size=mapper.getSize(pCode).split(",")[0];
				mapper.cart_add2(pCode, userid, size);
				out.print("0");
			}
		}
	}
	
	@Override
	public void wish_add2(HttpSession session, HttpServletRequest request, PrintWriter out) {
		String pCode=request.getParameter("pCode");
		if(session.getAttribute("userid")==null) {
			out.print("2");
		}
		else {
			String userid=session.getAttribute("userid").toString();
			boolean wchk=mapper.getWish(pCode, userid);
			if(wchk==true) {
				mapper.wish_del2(pCode, userid);
				out.print("1");
			}
			else {
				mapper.wish_add2(pCode, userid);
				out.print("0");
			}
		}
	}

	@Override
	public String content(HttpServletRequest request, Model model,HttpSession session) {
		String pCode = request.getParameter("pCode");
		ProductVo pvo = mapper.content(pCode);
		String[] pSize = pvo.getpSize().split(",");
		pvo.setpSize2(pSize);
		model.addAttribute("pvo", pvo);
		
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			int wcnt=mapper.getWish_w(pCode, userid);
			model.addAttribute("wcnt", wcnt);
		}
		return "/product/content";
	}
	@Override
	public void wish_add(HttpServletRequest request, HttpSession session, PrintWriter out) {
		String pCode=request.getParameter("pCode");
		String userid=session.getAttribute("userid").toString();
		int ck=Integer.parseInt(request.getParameter("ck"));
		
		if(ck==1) {
			try {
				mapper.wish_del(pCode, userid);
				out.print("0");
			}
			catch(Exception e) {
				out.print("1");
			}
		} 
		else {
			try {
				mapper.wish_add(pCode, userid);
				out.print("0");
			}
			catch(Exception e) {
				out.print("1");
			}
		}
	}
	
	@Override
	public String main(HttpServletRequest request, HttpSession session, Model model) {
		String pCode="";
		if(request.getParameter("pCode")!=null)
			pCode=request.getParameter("pCode");
		
		model.addAttribute("new_list", mapper.mainList("p", "1"));
		model.addAttribute("best_list", mapper.mainList(pCode, "2"));
		
		return "/main/main";
	}
	
	@Override
	public String product_search(HttpServletRequest request, Model model, HttpSession session) {
		if(session.getAttribute("userid")!=null) {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("userid", userid);
			model.addAttribute("wchk", mapper.wish_check(userid));
			model.addAttribute("cchk", mapper.cart_check(userid));
		}

		String keyword="";
		if(request.getParameter("keyword")!=null)
			keyword=request.getParameter("keyword");
		String color="";
		if(request.getParameter("color")!=null)
			color=request.getParameter("color");
		int sprice=0;
		if(request.getParameter("sprice")!=null)
			sprice=Integer.parseInt(request.getParameter("sprice"));
		int eprice;
		
		int page, index, rnum, pstart, pend, total;
		if(request.getParameter("page")==null)
			page=1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		if(request.getParameter("rnum")==null)
			rnum=20;
		else
			rnum=Integer.parseInt(request.getParameter("rnum"));
		index=(page-1)*rnum;
		pstart=page/5;
		if(page%5==0)
			pstart--;
		pstart=pstart*5+1;
		pend=pstart+4;
		
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("keyword", keyword);
		model.addAttribute("color", color);
		model.addAttribute("sprice", sprice);
		
		if(request.getParameter("eprice")==null) {
			total=mapper.search_total(rnum, keyword, color, sprice);
			if(pend>total)
				pend=total;
			model.addAttribute("total", total);
			model.addAttribute("search_list", mapper.product_search(keyword, color, sprice, index, rnum));
			System.out.println(page+" "+rnum+" "+pstart+" "+pend+" "+total+" "+keyword+" "+color);
			return "/product/product_search";
		}
		else {
			eprice=Integer.parseInt(request.getParameter("eprice"));
			total=mapper.search_total2(rnum, keyword, color, sprice, eprice);
			if(pend>total)
				pend=total;
			model.addAttribute("eprice", eprice);
			model.addAttribute("total", total);
			model.addAttribute("search_list", mapper.product_search2(keyword, color, sprice, eprice, index, rnum));
			System.out.println(page+" "+rnum+" "+pstart+" "+pend+" "+total+" "+keyword+" "+color);
			return "/product/product_search?page="+page+"&rnum="+rnum+"&keyword="+keyword+"&color="+color;
		}
	}
}
