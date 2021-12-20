	//댓글 필수입력
	$(function(){
		$("#secretBtn").click(function(){
			var secret = $("#commentcont").val();
			if(secret == ""){
				alert('댓글을 입력해주세요');
				return false;
			}else{
				return true;
			}
		});

		//답글 창 열기
		$(".reshow").click(function(){
			var idx = $(".reshow").index(this);
			$(this).hide();
			$(".recomment").eq(idx).css("display","flex");
			$(".txtarea").show();
			$(".subbtn").show();
		});
		//답글 창 닫기
		$(".recancel").click(function(){
			var idx = $(".recancel").index(this);
			$(".recomment").eq(idx).css("display","none");
			$(".reshow").eq(idx).show();
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
		function modifyComplete(obj,ncNo,noticeNo){
			var form = $("<form action='/updateComment' method='post'></form>");
			form.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
			form.append($("<input type='text' name='boardNo' value='"+boardNo+"'>"));
			form.append($(obj).parent().prev());
			$("body").append(form);
			form.submit();		
		}
		function deleteComment(obj,ncNo,noticeNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteComment?commentNo="+commentNo+"&boardNo="+boardNo;
			}
		}
	});