		
	$(function(){
		//답글 창 열기
		$(".reshow").click(function(){
			var idx = $(".reshow").index(this);
			$(".txtarea").eq(idx).show();
			$(".txtarea").css('width','1100px');
			$(".commentbt").eq(idx).hide();
			$(".subbtnSty").eq(idx).show();
			$(".recancel").eq(idx).show();
			$(".secretCom").show();
			$(".secretCom").css('display','inline');
					
		});
		
		//답글 창 닫기
		$(".recancel").click(function(){
			var idx = $(".recancel").index(this);
			$(".txtarea").eq(idx).hide();
			$(".commentbt").eq(idx).show();
			$(".subbtnSty").eq(idx).hide();
			$(".recancel").eq(idx).hide();
			$(".secretCom").hide();
		});
		
		 //댓글필수입력
		$("#secretBtn").click(function(){
			var idx = $("#secretBtn").index(this);
			var secret = $("#commentcont").eq(idx).val();
			if(secret == ""){
				alert('댓글을 입력해주세요');
				return false;
			}else{
				return true;
			}
		});
		
		//답글 필수입력
		$(".subbtnSty").click(function(){
			var idx = $(".subbtnSty").index(this);
			var submitBtn = $(".txtarea").eq(idx).val();
			if(submitBtn == ""){
				alert('답글을 입력해주세요');
				return false;
			}else{
				return true;
			}
		});
		
		
		//게시판_프로필정보 업로드
		var td = $("#profileOption");
		var pro = td.attr("value");
		console.log(pro);
		var local = [
	      '강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구',
	      '마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'
		];	
		
		//console.log(pro); 2262222
		if(pro.charAt(0) == '1'){
			td.append("<span class='tag'>#여성전용</span>&emsp;");
		}else if(pro.charAt(0) == '2'){
			td.append("<span class='tag'>#남성전용</span>&emsp;");
		}else if(pro.charAt(0) == '3'){
			td.append("<span class='tag'>#남녀공용</span>&emsp;");
		}
		
		if(pro.charAt(1) == '1'){
			td.append("<span class='tag'>#20대</span>&emsp;");
		}else if(pro.charAt(1) == '2'){
			td.append("<span class='tag'>#30대</span>&emsp;");
		}else if(pro.charAt(1) == '3'){
			td.append("<span class='tag'>#40대이상</span>&emsp;");
		}
		//길이가 7일때는 로컬코드 한자리로 처리, 8일때는 로컬코드2자리로처리해서 나머지가 1씩증가
		if(pro.length == 7){
			var pLocal = pro.charAt(2);  
			td.append("<span class='tag'>"+'#'+local[pLocal-1]+"</span>&emsp;");

			if(pro.charAt(3) == '1'){
				td.append("<span class='tag'>#흡연</span>&emsp;");
			}else if(pro.charAt(3) == '2'){
				td.append("<span class='tag'>#비흡연</span>&emsp;");
			}
			
			if(pro.charAt(4) == '1'){
				td.append("<span class='tag'>#반려동물 좋아해요</span>&emsp;");
			}else if(pro.charAt(4) == '2'){
				td.append("<span class='tag'>#반려동물 싫어해요</span>&emsp;");
			}
			
			if(pro.charAt(5) == '1'){
				td.append("<span class='tag'>#청소하는걸 좋아해요</span>&emsp;");
			}else if(pro.charAt(5) == '2'){
				td.append("<span class='tag'>#청소하는걸 싫어해요</span>&emsp;");
			}
			
			if(pro.charAt(6) == '1'){
				td.append("<span class='tag'>#생활패턴 : 밤</span>&emsp;");
			}else if(pro.charAt(6) == '2'){
				td.append("<span class='tag'>#생활패턴 : 낮</span>&emsp;");
			}
		}else if(pro.length == 8){
			var pLocal = pro.slice(2,4);    // 22182222 -> 18(2,3번째)
			td.append("<span class='tag'>"+'#'+local[pLocal-1]+"</span>&emsp;");
			
			if(pro.charAt(4) == '1'){
				td.append("<span class='tag'>#흡연</span>&emsp;");
			}else if(pro.charAt(4) == '2'){
				td.append("<span class='tag'>#비흡연</span>&emsp;");
			}
			
			if(pro.charAt(5) == '1'){
				td.append("<span class='tag'>#반려동물 좋아해요</span>&emsp;");
			}else if(pro.charAt(5) == '2'){
				td.append("<span class='tag'>#반려동물 싫어해요</span>&emsp;");
			}
			
			if(pro.charAt(6) == '1'){
				td.append("<span class='tag'>#청소하는걸 좋아해요</span>&emsp;");
			}else if(pro.charAt(6) == '2'){
				td.append("<span class='tag'>#청소하는걸 싫어해요</span>&emsp;");
			}
			
			if(pro.charAt(7) == '1'){
				td.append("<span class='tag'>#생활패턴 : 밤</span>&emsp;");
			}else if(pro.charAt(7) == '2'){
				td.append("<span class='tag'>#생활패턴 : 낮</span>&emsp;");
			}
		}
	});
	
	function modifyComment(obj,commentNo,boardNo){
		$(obj).parent().prev().show();
		$(obj).parent().prev().prev().hide();
		$(obj).html('수정완료');
		$(obj).attr("onclick","modifyComplete(this,'"+commentNo+"','"+boardNo+"');");
		$(obj).next().html('취소');
		$(obj).next().attr("onclick","modifyCancel(this,'"+commentNo+"','"+boardNo+"');");
		$(obj).next().next().hide();
	}
	
	function modifyCancel(obj,commentNo,boardNo){
		$(obj).parent().prev().hide();
		$(obj).parent().prev().prev().show();
		$(obj).prev().html("수정");
		$(obj).prev().attr("onclick","modifyComment(this,'"+commentNo+"','"+boardNo+"');");
		$(obj).html("삭제");
		$(obj).attr("onclick","deleteComment(this,'"+commentNo+"','"+boardNo+"');");
		$(obj).next().show();
	}
	
	function modifyComplete(obj,commentNo,boardNo){
		var form = $("<form action='/updateComment.do' method='post'></form>");
		form.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
		form.append($("<input type='text' name='boardNo' value='"+boardNo+"'>"));
		form.append($(obj).parent().prev());
		$("body").append(form);
		form.submit();		
	}
	
	function deleteComment(obj,commentNo,boardNo){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="/deleteComment.do?commentNo="+commentNo+"&boardNo="+boardNo;
		}
	}
		