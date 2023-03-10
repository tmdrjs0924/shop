<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/main/main.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<script src="../resources/js/main/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<decorator:head/>
</head>
	<body>
	<div id="fixed_btn">
		<span class="material-symbols-rounded" id="top_btn">vertical_align_top</span>
		<a><img src="../resources/pro/counsel.png" width="50" height="50"></a>
	</div>
    <div id="section">
      <div id="first">
        <div id="up">
          <div id="left"></div>
          <div id="center">
            <a href="../main/main"><img src="../resources/pro/symbol.jpg" id="logo_icon" /></a>
          </div>
          <div id="right">
          <c:if test="${userid==null}">
            <a href="../member/login">
              <span class="material-symbols-rounded" id="user_icon">person</span>
            </a>
          </c:if>
          <c:if test="${userid!=null}">
            <a href="../member/pwd_check">
              <span class="material-symbols-rounded" id="member_icon">person</span>
            </a>
            <a href="../member/logout">
            	<span class="material-symbols-rounded" id="logout_icon">logout</span>
            </a>
          </c:if>
            <a href="../wish/wish_view">
              <span class="material-symbols-rounded" id="wish_icon">favorite</span>
            </a>
            <a href="../product/cart">
            	<span class="material-symbols-rounded" id="cart_icon">shopping_bag</span>
            </a>
          </div>
        </div>
        <div id="down">
          <ul>
            <li>
              <a href="../product/display_list?pShow=1&pCode=p">NEW RELEASES</a>
              <ul class="menu">
                <li>
                  <a href="../product/display_list?pShow=1&pCode=p">New & Featured</a>
                </li>
                <li>
                  <a href="../product/display_list?pShow=1&pCode=p02">?????? ?????????</a>
                </li>
                <li>
                  <a href="../product/display_list?pShow=1&pCode=p03">?????? ?????????</a>
                </li>
                <li>
                  <a href="../product/display_list?pShow=1&pCode=p04">?????? ?????????</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="../product/display_list?pShow=2&pCode=p">BEST</a>
              <ul class="menu">
                <li>
                  <a href="../product/display_list?pShow=2&pCode=p">??????</a>
                </li>
                <li>
                  <a href="../product/display_list?pShow=2&pCode=p02">?????? ?????????</a>
                </li>
                <li>
                  <a href="../product/display_list?pShow=2&pCode=p03">?????? ?????????</a>
                </li>
                <li>
                  <a href="../product/display_list?pShow=2&pCode=p04">?????? ?????????</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="../product/list?pCode=p">SHOP</a>
              <ul class="menu">
                <li><a href="../product/list?pCode=p">??????</a></li>
                <li><a href="../product/list?pCode=p__01">??????</a></li>
                <li><a href="../product/list?pCode=p__02">??????</a></li>
                <li><a href="../product/list?pCode=p__03">?????????</a></li>
                <li><a href="../product/list?pCode=p__04">??????</a></li>
                <li><a href="../product/list?pCode=p__05">??????</a></li>
                <li><a href="../product/list?pCode=p__06">??????</a></li>
                <li><a href="../product/list?pCode=p__07">??????</a></li>
                <li><a href="../product/list?pCode=p__08">????????????</a></li>
              </ul>
            </li>
            <li>
              <a href="../product/dc_list">SEASON</a>
              <ul class="menu">
                <li><a href="../product/dc_list">SALE</a></li>
                <li><a href="#">LOOKBOOK</a></li>
                <li><a href="#">????????? ?????????</a></li>
                <li><a href="#">????????????</a></li>
              </ul>
            </li>
            <li>
              <a href="#">MD COLLECTION</a>
            </li>
          </ul>
        </div>
      </div>

<decorator:body/>

      <div id="eightth">
        <table width="1200" align="center">
          <tr>
            <td width="540">
              <img src="../resources/pro/hilight.png" width="160" height="24"/><p>
              <div style="font-weight:900">???????????? ?????????</div><p>
           	  <div>Co-Owner. HYEONG GYU KIM, SEUNG GEON KIM, HEE JU GO</div>
              <div>Business License No. 544-67-01119 [?????????????????????]</div>
              <div>Mail Order Business Registration. No. 2023-????????????B-5432</div>
              <div>Address. 1104 PDC Building Woo-Jung 3F, 474, Goyangdae-ro, Ilsan-gu, Goyang-si, Gyeonggi, Korea</div><p>
              <div>Hilight Brands is a division within Modern Works.</div>
              <div>The Sanus trademark, logo and trade dress are</div>
              <div>used by Modern Works under license from westman Sanus Company.</div><p>
              <div>??? 2023 Hilight Brands.</div>
            </td>
            <td width="130">
              <div>Term of Use</div>
              <div>Privacy Policy</div>
              <div>Order Tracking</div>
              <div>Notice</div>
              <div>Q&A</div>
              <p>
              <div>
              	<img src="../resources/pro/kakao.png" width="30" height="30">
              	<img src="../resources/pro/facebook.png" width="30" height="30">
              	<img src="../resources/pro/insta.png" width="30" height="30">
              </div>
            </td>
            <td width="230">
              <div>CS Center</div>
              <div>Mon - Fri (10:00 - 16:00)</div>
              <div>support@sanus.co.kr</div>
              <div>??????????????? : marketing@sanus.co.kr</div>
            </td>
            <td width="300">
              <div>?????? & ??????</div>
              <div>??????????????? : ?????? ????????? ???????????? ????????? 1193 ?????????????????? 9???</div><p>
              <div>?????? ??????</div>
              <div>???????????? : ???????????? 168-910228-91007</div>
              <div>????????? : ???????????? ?????????</div><p>
              <div>?????? ??????</div>
              <div>?????? ????????????</div>
              <div>????????? ?????? ?????? : welcome@sanus.co.kr (011-919-5778)</div>
            </td>
          </tr>
        </table>
      </div>
    </div>
	</body>
</html>