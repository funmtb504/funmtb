<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- updatePro.jsp -->
<%
// 한글처리
request.setCharacterEncoding("utf-8");
//pageNum파라미터 가져오기
String pageNum=request.getParameter("pageNum");
// num  pass 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
//BoardBean bb 
BoardBean bb=new BoardBean();
bb.setNum(num);
bb.setPass(pass);
//BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
//int check = passCheck(bb)   num pass 일치하는지 체크
int check=bdao.passCheck(bb);
// check==1 num pass 일치  deleteBoard(bb) 수정 list.jsp 이동
// check==0  "비밀번호틀림" 뒤로이동
if(check==1){
	bdao.deleteBoard(bb);
	response.sendRedirect("list.jsp?pageNum="+pageNum);
}else{
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>








