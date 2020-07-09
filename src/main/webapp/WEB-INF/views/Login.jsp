<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "../../resources/css/main.css" rel="stylesheet" type="text/css">
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/mainScript.js" charset="utf-8" type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../resources/js/zipCheck.js" charset="utf-8" type="text/javascript"></script>
</head>

<body>
   <c:import url="Top.jsp"/>
    <form name="regForm" method="post" action="loginProc">
<table class="tableclass3">
    <thead>
        <tr> <th colspan=3  class="theadstyle"> 로그인 </th></tr>
      </thead>
   <tbody>   
   <tr> 
         <td  class="tbodystyle" >아이디</td>
         <td style="width: 57%"  class="tbodystyle">
         <input type="text" name="mem_id" size="30" id="idchk" class="chk" title="아이디"   placeholder="아이디를 입력하시오." > 
         &nbsp; &nbsp; &nbsp; &nbsp; <font id="warning" size="2" color="red"></font>
         </td>
      </tr>
      <tr> 
         <td  class="tbodystyle">패스워드</td>
         <td  class="tbodystyle">
          <input type="password"  id= "passwd" name="m_passwd" size="30" class="chk" title="패스워드" placeholder="패스워드를 입력하시오.">
           <font id="check" size="2" color="red"></font> 
         </td>
      </tr>
    <tr> 
         <td colspan="3"  class="theadstyle"> 
         <button type="submit" id ="login">login</button> 
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
         <button type="reset">reset </button>
         </td>
      </tr>
         
</tbody>
</table>
</form>
<c:import url="Bottom.jsp"/>
</body>
</html>