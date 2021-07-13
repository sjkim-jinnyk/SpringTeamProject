<%@page import="com.spring.model.ProductDAOImpl"%>
<%@page import="com.spring.model.ProductDAO"%>
<%@page import="com.spring.model.ProductLikeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>

<% int no = Integer.parseInt(request.getParameter("product_no").trim()); 

String user_id = (String) session.getAttribute("session_id");
if(user_id == null) {
	user_id = "guest";
}

HashMap hm = new HashMap();
hm.put("product_no", no);
hm.put("user_id", user_id);

ProductLikeDTO dto = new ProductLikeDTO();

ProductDAOImpl dao = new ProductDAOImpl();

int result = dao.addLike(hm);

out.println(result);

%>

