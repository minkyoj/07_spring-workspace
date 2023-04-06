<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=140ee392c8dab5a9aa0842cc98e0f78e"></script>
    <style>
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
        .wrap * {padding: 0;margin: 0;}
        .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
        .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
        .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
        .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
        .info .close:hover {cursor: pointer;}
        .info .body {position: relative;overflow: hidden;}
        .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
        .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
        .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
        .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
        .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .info .link {color: #5085BB;}
    </style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
	<!-- 
	<div style="height:600px" align="center">
	
	<div id="map" style="width: 800px; height: 800px; border: 1px black solid;"></div>


    <script>

        let mapx = "";
        let mapy = "";
        let title = "";
        let image = "";
        let addr1 = "";
        let addr2 = "";
    

        $(function(){
            $.ajax({
                type: "GET",
                url: "https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=Tripism&_type=json&listYN=Y&arrange=A&eventStartDate=20200101&serviceKey=u9lAqyYrK8iachVY9sMwUjf8FtH2nvjt12sjx49m0zQmTIxRVdo4%2Bipmg6rjE6d4VkjeRNFe3pXYFVRiCLumBg%3D%3D",
                data: {},
                success: function (response) {
                    let items = response["response"]["body"]["items"]["item"]; 
                    for (let i = 0; i < items.length; i++) {
                        mapx = items[i]['mapy']
                        mapy = items[i]['mapx']
                        title = items[i]['title']
                        image = items[i]['firstimage']
                        addr1 = items[i]['addr1']
                        addr2 = items[i]['addr2']
                        tel = items[i]['tel']
                        console.log(mapx, mapy);
                    }
                    kakaoMapMarker(mapx,mapy);
                }
            })

        })

        function kakaoMapMarker(mapx,mapy){
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(mapx, mapy), // 지도의 중심좌표
                level: 7 // 지도의 확대 레벨
            };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 지도에 마커를 표시합니다 
            var marker = new kakao.maps.Marker({
                map: map, 
                position: new kakao.maps.LatLng(mapx, mapy)
            });

            var imageTag = "<img src='"+image+"' width='73' height='70'>";

            // 커스텀 오버레이에 표시할 컨텐츠 입니다
            // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
            // 별도의 이벤트 메소드를 제공하지 않습니다 
            var content = '<div class="wrap">' + 
                        '    <div class="info">' + 
                        '        <div class="title">' + 
                        title + 
                        '            <div class="close" title="닫기"></div>' + 
                        '        </div>' + 
                        '        <div class="body">' + 
                        '            <div class="img">' +
                        imageTag +
                        '           </div>' + 
                        '            <div class="desc">' + 
                        addr1 + 
                        addr2 + 
                        '<div>'+tel+'</div>' + 
                        '            </div>' + 
                        '        </div>' + 
                        '    </div>' +    
                        '</div>';

            // 마커 위에 커스텀오버레이를 표시합니다
            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
            var overlay = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: marker.getPosition()       
            });

            // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                overlay.setMap(map);
            });




        }

        $(function(){
            $(".title").on("click", "div",function(){
                    console.log("dddd");
                    overlay.setMap(null);

                })

        })
        
    </script>
    
	
	</div>
	-->
	<div class="content">
		<br><br>
		<div class="innerOuter">
			<h4>게시글 Top5</h4>
			<br>
		
			<a href="list.bo" style="float:right">더보기 +</a>
		
	       <table id="boardList" class="table table-hover" align="center">
                <thead>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
                </tr>
                </thead>
                <tbody>
                	<!-- 현재 조회수가 가장 높은 상위 5개의 게시글 조회해서 뿌리기 -->
                </tbody>
            </table>
       </div>
       <br><br>
	</div>
	
	<script>
		$(function(){
			topBoardList();
			
			setInterval(topBoardList, 1000);
			
			/*
        	$(function(){
        		$("#boardList>tbody>tr").click(function(){
        			location.href='detail.bo?bno=' + $(this).children(".bno").eq(0).text();
        		})
        	})
        	*/
        	
        	$(document).on("click", "#boardList>tbody>tr", function(){
        		location.href='detail.bo?bno=' + $(this).children().eq(0).text();
        	})
			
		})
		
		function topBoardList(){
			$.ajax({
				url:"topList.bo",
				success:function(data){
					console.log(data);
					
					let value = "";
					
					for(let i in data){
						value += "<tr>"
								+ "<td>" + data[i].boardNo + "</td>"
								+ "<td>" + data[i].boardTitle + "</td>"
								+ "<td>" + data[i].boardWriter + "</td>"
								+ "<td>" + data[i].count + "</td>"
								+ "<td>" + data[i].createDate + "</td>"
								+ "<td>";
								
								if(data[i].originName != null){ // 첨부파일이 존재하는 경우
									value += "★";
								}
								
								value += "</td></tr>";
					}
					
					$("#boardList tbody").html(value);
					
				}, error:function(){
					console.log("조회수 top5 게시글 조회용 ajax 통신 실패");
				}
			})
		}
		
	</script>
	
	
	<jsp:include page="common/footer.jsp"/>
	
</body>
</html>