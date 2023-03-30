<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 이쪽에 메뉴바 포함 할꺼임 -->
<jsp:include page="../common/header.jsp"/>

<div class="content">
   <br><br>
   <div class="innerOuter">
       <h2>마이페이지</h2>
       <br>

       <form action="update.me" method="post">
           <div class="form-group">
               <label for="userId">* ID :</label>
               <input type="text" class="form-control" id="userId" name="userId" value="${loginUser.userId }" readonly><br>
               
               <label for="userName">* Name :</label>
               <input type="text" class="form-control" id="userName" name="userName" value="${loginUser.userName }" required><br>
               
               <label for="email"> &nbsp; Email :</label>
               <input type="email" class="form-control" id="email" name="email" value="${loginUser.email }"><br>
               
               <label for="age"> &nbsp; Age :</label>
               <input type="number" class="form-control" id="age" name="age" value="${loginUser.age }"><br>
               
               <label for="phone"> &nbsp; Phone :</label>
               <input type="tel" class="form-control" id="phone" name="phone" value="${loginUser.phone }"><br>
               
               <label for="address"> &nbsp; Address :</label>
               <input type="text" class="form-control" id="address" name="address" value="${loginUser.address }"><br>
               
               <label for=""> &nbsp; Gender : </label> &nbsp;&nbsp;
               <input type="radio" name="gender" id="Male" value="M">
               <label for="Male">남자</label> &nbsp;&nbsp;
               <input type="radio" name="gender" id="Female" value="F">
               <label for="Female">여자</label><br>
               
               
           </div>
           <br>
           <div class="btns" align="center">
           	   <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#pwUpdateForm">비밀번호 수정</button>
               <button type="submit" class="btn btn-primary">수정하기</button>
               <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
           </div>
       </form>
       
       <script>
       /*
            $(function(){
                if("${loginUser.gender}" == "M"){
                   	$('#Male').attr("checked", "checked");
                }else{
                    $('#Female').attr("checked", "checked");
                }
            })
       */
            $(function(){
            	if("${loginUser.gender}" != ""){
            		$("input[value=${loginUser.gender}]").attr("checked", true);
            	}
            })
       </script>

   </div>
   <br><br>
</div>

<!-- 회원탈퇴 버튼 클릭시 보여질 Modal -->
<div class="modal" id="deleteForm">
   <div class="modal-dialog">
       <div class="modal-content">
       
           <!-- Modal Header -->
           <div class="modal-header">
           <h4 class="modal-title">회원탈퇴</h4>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
           
           <!-- Modal body -->
           <div class="modal-body" align="center">
           
               <b>
                               탈퇴 후 복구가 불가능합니다. <br>   
                               정말로 탈퇴 하시겠습니까?
               </b>

               <form action="delete.me" method="post">
                       비밀번호 : 
                   <input type="password" name="userPwd" required>
                   <input type="hidden" name="userId" value="${loginUser.userId }">
                   <button type="submit" class="btn btn-danger">탈퇴하기</button>
               </form>

           </div>
           
       </div>
   </div>
</div>

<!-- 비밀번호 수정 클릭시 보여질 Modal -->
<div class="modal" id="pwUpdateForm">
    <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">회원탈퇴</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body" align="center">
            
                <b>
                                비밀번호 변경 정보를 입력해주세요. <br><br><br>
                </b>
 
                <form action="updatePwd.me" method="post">
                        현재 비밀번호 : &emsp;&emsp;&emsp;&emsp;
                    <input type="password" name="userPwd" required> <br><br>
                        변경할 비밀번호 : &emsp;&emsp;&emsp;
                    <input type="password" name="updatePwd" required> <br><br>
                        변경할 비밀번호 확인 :&emsp;
                    <input type="password" name="checkPwd" required> <br><br>
                    <input type="hidden" name="userId" value="${loginUser.userId }"> 
                    <button type="submit" class="btn btn-danger">수정하기</button>
                </form>
 
            </div>
            
        </div>
    </div>
 </div>

 <script>
    $(function(){
        
    })
 </script>

<!-- 이쪽에 푸터바 포함할꺼임 -->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>