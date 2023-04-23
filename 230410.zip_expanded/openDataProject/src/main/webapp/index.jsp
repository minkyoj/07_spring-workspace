<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h2>실시간 대기 오염 정보</h2>
	
	지역:
	<select id="location">
		<option>서울</option>
		<option>부산</option>
		<option>대전</option>
	</select>
	
	<button id="btn1">해당 지역 대기오염정보 확인하기</button>
	
	<table id="result1" border="1" align="center">
		<thead>
			<th>측정소명</th>
			<th>측정일시</th>
			<th>통합대기환경수치</th>
			<th>미세먼지농도</th>
			<th>아황산가스농도</th>
			<th>일산화탄소농도</th>
			<th>이산화질소농도</th>
			<th>오존농도</th>
		</thead>
		<tbody></tbody>
	</table>
	
	<script>

		$("#btn1").click(function(){
			$.ajax({
				url: "air.do",
				data:{location:$("#location").val()},
				success:function(data){
					// console.log(data);
					// console.log(data.response.body.items);
					const itemArr = data.response.body.items;
					
					let value ="";
					for(let i in itemArr) {
						// console.log(itemArr[i]);
						
						let item = itemArr[i];
						
						value += "<tr>"
								+ "<td>" + item.stationName + "</td>"
								+ "<td>" + item.dataTime + "</td>"
								+ "<td>" + item.khaiValue + "</td>"
								+ "<td>" + item.pm10Value + "</td>"
								+ "<td>" + item.so2Value + "</td>"
								+ "<td>" + item.coValue + "</td>"
								+ "<td>" + item.no2Value + "</td>"
								+ "<td>" + item.o3Value + "</td>"
								+ "</tr>";
					}
					
					$("#result1 tbody").html(value);
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			})
		})

	</script>
	
	<hr>
	
   <hr>
   
   <h2>지진해일대피소 정보</h2>
   <input type="button" value="실행" id="btn3">
   
   <div id="result3"></div>
   
   <script>
      $(function(){
         
         
         
         
        /* 
         $("#btn3").click(function(){
            
            $.ajax({
               url:"disaster.do",   // 넘길 data가 없으므로 생략함
               success:function(data){
                  //console.log(data);
                  //console.log($(data).find("row"));
                  
                  // jquery 방식으로 동적으로 테이블 요소 만들기!
                  
                  let $table = $("<table border='1'></table>");
                  let $thead = $("<thead></thead>");
                  let headTr = "<tr>"
                           + "<th>일련번호</th>"
                           + "<th>시도명</th>"
                           + "<th>시군구명</th>"
                           + "<th>대피장소명</th>"
                           + "<th>주소</th>"
                           + "<th>수용가능인원(명)</th>"
                           + "<th>해변으로부터거리</th>"
                           + "<th>대피소분류명</th>"
                           + "</tr>";
                  
                  // 결합작업
                  $thead.html(headTr);
                  
                  let $tbody = $("<tbody></tbody>");
                  let bodyTr = "";
                  
                  $(data).find("row").each(function(i, row){ // i는 인덱스값, row는 순차적으로 접근한 요소
                     //console.log(row);
                     //console.log($(row).find("shel_nm").text()); // <shel_nm>어쩌구</shel_nm>
                     
                     bodyTr += "<tr>"
                           + "<td>" + $(row).find("id").text() + "</td>"
                           + "<td>" + $(row).find("sido_name").text() + "</td>"
                           + "<td>" + $(row).find("sigungu_name").text() + "</td>"
                           + "<td>" + $(row).find("shel_nm").text() + "</td>"
                           + "<td>" + $(row).find("address").text() + "</td>"
                           + "<td>" + $(row).find("shel_av").text() + "</td>"
                           + "<td>" + $(row).find("lenth").text() + "</td>"
                           + "<td>" + $(row).find("shel_div_type").text() + "</td>"
                           + "</tr>";
                  })
                  
                  // 결합작업
                  $tbody.html(bodyTr);
                  
                  // jquery 방식으로 만들어진 요소를 자식으로 추가할때는 이렇게 해야함
                  // html() 메소드는 안에 스트링을 넣어야함
                  
                  //$table.append($thead, $tbody);    // a.append(b) => a안에 b를 추가하겠다.
                  //$table.appendTo("#result3");    // a.appendTo(b) => b안에 a를 추가하겠다.
                  
                  $table.append($thead, $tbody)
                       .appendTo("#result3");
                  
               }, error:function(){
                  console.log("ajax 통신 실패!");
               }
            });
         })
         */
         
         $("#btn3").click(() => {
             
             $.ajax({
                url:"disaster.do",   // 넘길 data가 없으므로 생략함
                success:data => {
                   //console.log(data);
                   //console.log($(data).find("row"));
                   
                   // jquery 방식으로 동적으로 테이블 요소 만들기!
                   
                   let $table = $("<table border='1'></table>");
                   let $thead = $("<thead></thead>");
                   let headTr = "<tr>"
                            + "<th>일련번호</th>"
                            + "<th>시도명</th>"
                            + "<th>시군구명</th>"
                            + "<th>대피장소명</th>"
                            + "<th>주소</th>"
                            + "<th>수용가능인원(명)</th>"
                            + "<th>해변으로부터거리</th>"
                            + "<th>대피소분류명</th>"
                            + "</tr>";
                   
                   // 결합작업
                   $thead.html(headTr);
                   
                   let $tbody = $("<tbody></tbody>");
                   let bodyTr = "";
                   
                   $(data).find("row").each((i, row) => { // i는 인덱스값, row는 순차적으로 접근한 요소
                      //console.log(row);
                      //console.log($(row).find("shel_nm").text()); // <shel_nm>어쩌구</shel_nm>
                      
                      bodyTr += "<tr>"
                            + "<td>" + $(row).find("id").text() + "</td>"
                            + "<td>" + $(row).find("sido_name").text() + "</td>"
                            + "<td>" + $(row).find("sigungu_name").text() + "</td>"
                            + "<td>" + $(row).find("shel_nm").text() + "</td>"
                            + "<td>" + $(row).find("address").text() + "</td>"
                            + "<td>" + $(row).find("shel_av").text() + "</td>"
                            + "<td>" + $(row).find("lenth").text() + "</td>"
                            + "<td>" + $(row).find("shel_div_type").text() + "</td>"
                            + "</tr>";
                   })
                   
                   // 결합작업
                   $tbody.html(bodyTr);
                   
                   // jquery 방식으로 만들어진 요소를 자식으로 추가할때는 이렇게 해야함
                   // html() 메소드는 안에 스트링을 넣어야함
                   
                   //$table.append($thead, $tbody);    // a.append(b) => a안에 b를 추가하겠다.
                   //$table.appendTo("#result3");    // a.appendTo(b) => b안에 a를 추가하겠다.
                   
                   /*
                   
                   만일 위의 반복문을 돌리지 않고 아래와 같이 진행할 경우
                   $table.append($thead)
                   		 .append(data) // ** 응답데이터 xml 형식을 곧바로 table 안에 넣는다 ? => 문제발생
                   		 .apeendTo("#result2");
                   
                   문제점 : xml 문서 안의 요소들을 바로 html화 시킬 수 없음 => 반복문 돌려가면서 각각의 요소에 접근해서 tr 요소 만들어줘야함
                   조치내용 : 위에 작성했던 코드들을 작성해서 실행시키면됨!!
                   
                   */
                   
                   $table.append($thead, $tbody)
                        .appendTo("#result3");
                   
                }, error:() => {
                   console.log("ajax 통신 실패!");
                }
             });
          })
         
      })
      
      /*
      
            ** 화살표 함수 **
            익명함수들을 화살표 함수로 작성 할 수 있음
            
            "function() {}" 를       "() => {}" 이런식으로 작성 가능
            
            "function(data) {}" 를  "data => {}" 이런식으로 작성 가능 (매개변수 한개)
            
            "function(a,b) {}" 를    "(a,b) => {}" 이런식으로 작성 가능 (매개변수 여러개)
            
            "function() {return 10;}" 를 "() => 10" 이런식으로 작성 가능
            
      */
      
      
      
      
      
   </script>

	
</body>
</html>