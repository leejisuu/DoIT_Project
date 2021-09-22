<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A - Do IT</title>
<!-- 외부 스타일 시트 -->
	<link href='<%= request.getContextPath() %>/resources/css/all.css' rel='stylesheet'>
	<link href='<%= request.getContextPath() %>/resources/css/qna-boardDetail.css' rel='stylesheet'>
</head>
<body>
	<!-- 모든 페이지에 include할 menubar.jsp 생성 -->
	<%@ include file='/WEB-INF/views/common/menubar.jsp' %>
	
	<div class="content">
		<div class="board_wrap">
        <div class="board_info">
            <div class="writer_info">
                <img class="user_img" src='<%= request.getContextPath() %>/resources/images/user.png' alt="게시글 유저">
                <div class="avatar_info">
                    <div class="nickname">nickname</div>
                    <div class="write_time">
                        <fmt:formatDate value="${ board.create_date }" pattern="yyy.MM.dd HH:mm:ss"/> 작성
                   		<c:if test= "${ board.create_date != board.modify_date}">
                        <fmt:formatDate value="${ board.modify_date }" pattern="yyy.MM.dd HH:mm:ss"/> 수정됨
    					</c:if>     
                    </div>
                </div>
                
            </div>
            <span># ${ board.board_no } 조회수 : ${ board.count }</span>
        </div>
        <div class="board_title">
            <h1>${ board.board_title }</h1>
        </div>
        <div class="board_text">
        	<div class="cname">분류 : ${ board.cname }</div> 
        	${ board.board_content }
        </div>
        
        
    <div class="board_btn btn">
    	<c:if test="${ board.user_no != loginUser.userNo}">
        <button class="report_btn" 
        onclick="openPopup('<%= request.getContextPath() %>/qnaReport', 'qnaReport', 500, 360);">신고</button>
        </c:if>
        
        
        <c:if test="${ board.user_no == loginUser.userNo || loginUser.userType == 'A' }">
        <button class="del_btn" onclick="deleteBoard()">삭제</button>
        <button class="modify_btn" onclick="updateBoardView()">수정</button>
        <form name ="boardForm" method="post">
			<input type="hidden" name="board_no" value="${ board.board_no }">
		</form>
        </c:if>
    </div>
</div>
    
        <%-- <!-- 댓글등록 -->
        <div class="comment_header">Comment</div>
        <div class="new_comment comment">
            <img class="user_img" src='<%= request.getContextPath() %>/resources/images/user.png' alt="게시글 유저">
            <pre><a href="<%= request.getContextPath() %>/login">로그인</a>이 필요합니다.</pre>
            <button>등록</button>
        </div>
        <!-- 댓글 -->
        <div class="comment_wrapper">
            <div class="writer_info">
                <img class="user_img" src='<%= request.getContextPath() %>/resources/images/user.png' alt="게시글 유저">
                <div class="avatar_info">
                    <div class="nickname">nickname</div>
                    <div class="write_time">
                        2021-07-22 15:19:04 작성  
                        <fmt:formatDate value="${ board.createDate }" pattern="yyy.MM.dd HH:mm:ss"/>
                        2021-07-22 15:23:14 수정됨
                        <fmt:formatDate value="${ board.modifyDate }" pattern="yyy.MM.dd HH:mm:ss"/>
                    </div>
                </div>
            </div>
            <pre class="comment">MYSQL 이면 group_concat 함수 사용해보세요.</pre>
            <div class="comment_btn btn">
                <button class="report_btn"
                onclick="openPopup('<%= request.getContextPath() %>/qnaReport', 'qnaReport', 500, 360);">신고</button>
                <button class="del_btn" onclick="commentDelete()">삭제</button>
                <button class="modify_btn">수정</button>
            </div>
        </div>

        <div class="comment_wrapper">
            <div class="writer_info">
                <img class="user_img" src='<%= request.getContextPath() %>/resources/images/user.png' alt="게시글 유저">
                <div class="avatar_info">
                    <div class="nickname">nickname</div>
                    <div class="write_time">
                        2021-07-22 15:19:04 작성  
                        <fmt:formatDate value="${ board.createDate }" pattern="yyy.MM.dd HH:mm:ss"/>
                        2021-07-22 15:23:14 수정됨
                        <fmt:formatDate value="${ board.modifyDate }" pattern="yyy.MM.dd HH:mm:ss"/>
                    </div>
                </div>
            </div>
            <div class="comment_btn btn">
                <button class="report_btn">신고</button>
                <button class="del_btn">삭제</button>
                <button class="modify_btn">수정</button>
            </div>
            <pre class="comment">group by 자체가 같은걸 묶는거에요</pre>
        </div>
        <div class="comment_wrapper">
            <div class="writer_info">
                <img class="user_img" src='<%= request.getContextPath() %>/resources/images/user.png' alt="게시글 유저">
                <div class="avatar_info">
                    <div class="nickname">nickname</div>
                    <div class="write_time">
                        2021-07-22 15:19:04 작성  
                        <fmt:formatDate value="${ board.createDate }" pattern="yyy.MM.dd HH:mm:ss"/>
                        2021-07-22 15:23:14 수정됨
                        <fmt:formatDate value="${ board.modifyDate }" pattern="yyy.MM.dd HH:mm:ss"/>
                    </div>
                </div>
            </div>
            <div class="comment_btn btn">
                <button class="report_btn">신고</button>
                <button class="del_btn">삭제</button>
                <button class="modify_btn">수정</button>
            </div>
            <pre class="comment report_comment">신고 처리된 글입니다.</pre>
        </div> --%>
	</div>	
	
	<footer>
	<%@ include file='/WEB-INF/views/common/footer.jsp' %>
	</footer>
	
	<script>
	 	// 팝업창 호출
		function openPopup(url, title, width, height){
			// 왼쪽으로 부터 거리(가운데 맞추기)
			let left = (document.body.clientWidth/2) - (width/2);
			// 듀얼모니터를 위한 계산 (듀얼모니터를 쓰고 있을때 추가로 )
			left += window.screenLeft;
			let top = (screen.availHeight/2) - (height/2);
			
			let options = "width="+width+",height="+height+",left="+left+",top="+top;
			
			/* console.log(window.screenLeft);
			console.log(options); */
			
			// 새창 열기
			window.open(url, title, options);
		}
	 	
		function deleteBoard(){
			if(confirm("이 게시글을 삭제하시겠습니까?")){
				document.forms.boardForm.action = "${contextPath}/qna/delete";
				document.forms.boardForm.submit();
			}
		}
		
		function updateBoardView(){
			document.forms.boardForm.action = "${contextPath}/qna/updateView";
			document.forms.boardForm.submit();
		}
		
		
		function commentDelete(){
			if(confirm("정말로 삭제하시겠습니까?"))
				location.href = '<%= request.getContextPath() %>/commentDelete';
		}
		
	</script>
	
	
<%-- 	<script src="<%= request.getContextPath() %>/resources/js/imagePreview.js"></script> --%>
</body>
</html>