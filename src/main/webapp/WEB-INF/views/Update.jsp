<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>simple shopping mall</title>
<link href = "../../resources/css/main.css" rel="stylesheet" type="text/css">
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/mainScript.js" charset="utf-8" type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../../resources/js/zipCheck.js" charset="utf-8" type="text/javascript"></script>



</head>
<script>
    function zipCheck() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullAddr = ''; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수
 
                        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            fullAddr = data.roadAddress;
 
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            fullAddr = data.jibunAddress;
                        }
 
                        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                        if (data.userSelectedType === 'R') {
                            //법정동명이 있을 경우 추가한다.
                            if (data.bname !== '') {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if (data.buildingName !== '') {
                                extraAddr += (extraAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                                    + ')' : '');
                        }
 
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                        document.getElementById('sample6_address').value = fullAddr;
 
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById('sample6_address2').focus();
                    }
                }).open();
    }
</script>

</head>

<body>
    <c:import url="Top.jsp"/>
   <form name="regForm" method="post" action="memberUpdateProc">
   <table class="tableclass2">
   <thead>
        <tr> <th colspan=3  class="theadstyle">정보수정 </th></tr>
      </thead>
   <tbody >
      <tr> 
         <td  class="tbodystyle" >아이디</td>
         <td style="width: 57%"  class="tbodystyle">
         <input type="text" name="mem_id" size="30" id="idchk" class="chk" 
         			readonly="readonly" value="${mdto.mem_id}"> 
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
         <td class="tbodystyle">패스워드 확인</td>
         <td class="tbodystyle">
         <input type="password" id= "passwd2" name="m_repasswd" size="30" class="chk" title="패스워드 확인" placeholder="패스워드를  확인하시오."> </td>
      </tr>
      <tr> 
         <td class="tbodystyle">이름</td>
         <td class="tbodystyle">
         <input type="text" name="m_name" size="30" class="chk" title="이름" 
         	value="${mdto.mem_id}"> </td>
      </tr>
      <tr> 
      <td class="tbodystyle">이메일</td>
         <td class="tbodystyle">
         <input type="text" name="m_email" size="50" class="chk" title="이메일" placeholder="이메일 입력하시오."> </td>
         <td class="tbodystyle">이메일을 적어주세요.</td>
      </tr>
      <tr>  
         <td class="tbodystyle">전화번호</td>
         <td class="tbodystyle">
         <input type="text" name="m_phone" size="40" class="chk" title="전화번호" placeholder="전화번호를 입력하시오.(010-1111-2222)"> </td>
         <td class="tbodystyle">연락처를 적어 주세요.</td>
      </tr>
      
       <tr>
                <td class="tbodystyle">우편번호</td>
                <td class="tbodystyle">
                <input type="text" name="zipcode" id="sample6_postcode" readonly placeholder="우편번호를 검색하시오."> 
                <input type="button" onclick="zipCheck()" class="chk" title="우편번호" value="우편번호 찾기">
                </td>
                <td class="tbodystyle">우편번호를 검색 하세요.</td>
            </tr>
            <tr>
                <td class="tbodystyle">주소</td>
                <td class="tbodystyle">
                <input type="text" size="100" name="address" id="sample6_address" readonly class="chk" title="주소" placeholder="주소를  검색하시오"></td>
                <td class="tbodystyle">주소를 적어 주세요.</td>
            </tr>
            <tr>
                <td class="tbodystyle">주소상세</td>
                <td class="tbodystyle">
                <input type="text" size="100" name="address2" id="sample6_address2" class="chk" title="상세주소" placeholder="상세주소를 입력하시오" ></td>
                <td class="tbodystyle">상세주소를 적어 주세요.</td>
            </tr>
      <tr>  
         <td class="tbodystyle">직업</td>
         <td class="tbodystyle">
            <select name=m_job>
               <option value="0">선택하세요.
               <option value="회사원">회사원
               <option value="연구전문직">연구전문직
               <option value="교수학생">교수학생
               <option value="일반자영업">일반자영업
               <option value="공무원">공무원
               <option value="의료인">의료인
               <option value="법조인">법조인
               <option value="종교,언론,에술인">종교.언론/예술인
               <option value="농,축,수산,광업인">농/축/수산/광업인
               <option value="주부">주부
               <option value="무직">무직
               <option value="기타">기타
            </select>
         </td>
         <td class="tbodystyle">직업을 선택 하세요.</td>
      </tr>
      <tr> 
         <td colspan="3"  class="theadstyle"> 
         <button type="submit" id ="inputCheck">회원가입</button> 
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
         <button type="reset">다시쓰기 </button>
         </td>
      </tr>
   </tbody>
   </table>
   </form>
   <c:import url="Bottom.jsp"/>
</body>
</html>