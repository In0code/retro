<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<link rel="icon" href="http://192.168.0.70/mvc_prj/common/main/favicon-32x32.png">
<!-- bootstrap CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style type="text/css">
.container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:100%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%;
}
.headind_srch{ 
  padding:10px 29px 10px 20px; 
  overflow:hidden; 
  border-bottom:1px solid #c4c4c4;
  height: 70px;
}

.recent_heading h4 {
  color: #05728f;
  font-size: 26px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
  cursor: pointer;
}
.inbox_chat { height: 600px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 0px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {
  position: relative;
  margin-top: 10px;
}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 7px;
  width: 33px;
  margin-right: 5px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  padding-top: 10px;
  height: 540px;
  overflow-y: auto;
}

#msgData{
  border: 1px solid;
}

body a{
  color: #000;
  text-decoration: none;  
}
</style>
<script type="text/javascript">
	var you = "${uid}";
	var pcode = "${pcode}";
	
	$(function(){
		if("A" == "${sFlag}") {
			chatDetail("${uid}", "${pcode}");
		}
		
		
		$(".chat_list").click(function() {
			var div = $(this);
			you  = div.find('.buyid').val();
			pcode  = div.find('.pcode').val();
			
			$(".active_chat").removeClass("active_chat");
			div.addClass("active_chat");
			
			chatDetail(you, pcode);
		});
		
	});//ready
	
function chatDetail(you, pcode) {
	var me = "${sessionScope.id}";
	
	$.ajax({
		url:"chat_progress.do",
		type:"GET",
		data:{me:me, you:you, pcode:pcode},
		dataType:"HTML",
		error:function(xhr) {
			alert(xhr.status);
		},
		success:function(data) {
			$("#output").html(data);
		}
	});
}

function sendMsg() {
	var query = {context:$("#msgData").val(), pcode:pcode, sender:"${sessionScope.id}", receiver:you, sFlag:"${sFlag}"};
	
	$.ajax({
		url:"chating_process.do",
		type:"POST",
		data:query,
		dataType:"JSON",
		error:function(xhr) {
			alert(xhr.status);
		},
		success:function(json) {
			if(!json.flag) {
				alert(json.msg);
			} else {
				chatDetail(you, pcode);
			}
		}
	});
}
</script>

</head>
<body>
<!-- header -->
<c:import url="/common/cdn/header.jsp" />
	
<div class="container" style="margin-top: 36px;">
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>채팅</h4>
            </div>
          </div>
          <!-- chat List -->
          <div class="inbox_chat">
          <c:if test="${sFlag eq 'A' }">
          	<div class="chat_list">
	              <div class="chat_people">
	                <div class="chat_img">
	                	<svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="47px" height="47px" viewBox="0 0 600.000000 600.000000" preserveAspectRatio="xMidYMid meet">
							<g transform="translate(0.000000,600.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">
								<path d="M2785 5794 c-381 -39 -706 -128 -1010 -279 -295 -146 -496 -288 -728 -514 -243 -238 -405 -461 -557 -766 -135 -272 -213 -525 -266 -865 -25 -159 -25 -573 0 -745 103 -714 451 -1335 1006 -1795 357 -296 857 -521 1320 -594 566 -90 1143 -7 1648 234 315 151 555 323 803 577 421 431 678 950 771 1553 18 121 22 187 22 395 0 340 -27 525 -120 832 -194 642 -642 1216 -1223 1567 -319 194 -669 320 -1046 377 -125 19 -516 34 -620 23z m465 -1127 c299 -77 552 -299 673 -587 54 -131 72 -223 72 -380 0 -157 -18 -249 -72 -380 -125 -298 -394 -524 -708 -597 -110 -25 -320 -25 -430 0 -363 84 -656 367 -753 727
									-22 83 -25 115 -25 250 0 135 3 167 25 250 103 382 406 660 802 736 107 20 298 12 416 -19z m-59 -2277 c645 -66 1212 -456 1507 -1040 l63 -125 -58 -54 c-375 -353 -856 -577 -1398 -653 -116 -16 -494 -16 -610 0 -542 76 -1023 300 -1398 653 l-58 54 63 125 c261 516 725 877 1290 1004 195 44 399 56 599 36z"/>
							</g>
						</svg>
	                </div>
	                <div class="chat_ib">
	                  <input class="buyid" type="hidden" value="${uid }">
	                  <input class="pcode" type="hidden" value="${pcode }">
	                  <h5><c:out value="${uid }"/> <span class="chat_date">방금</span></h5>
	                  <p> </p>
	                </div>
	              </div>
	         </div>
          </c:if>
          <c:forEach var="chat" items="${chatList }">
	            <div class="chat_list">
	              <div class="chat_people">
	                <div class="chat_img">
	                	<svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="47px" height="47px" viewBox="0 0 600.000000 600.000000" preserveAspectRatio="xMidYMid meet">
							<g transform="translate(0.000000,600.000000) scale(0.100000,-0.100000)" fill="#000000" stroke="none">
								<path d="M2785 5794 c-381 -39 -706 -128 -1010 -279 -295 -146 -496 -288 -728 -514 -243 -238 -405 -461 -557 -766 -135 -272 -213 -525 -266 -865 -25 -159 -25 -573 0 -745 103 -714 451 -1335 1006 -1795 357 -296 857 -521 1320 -594 566 -90 1143 -7 1648 234 315 151 555 323 803 577 421 431 678 950 771 1553 18 121 22 187 22 395 0 340 -27 525 -120 832 -194 642 -642 1216 -1223 1567 -319 194 -669 320 -1046 377 -125 19 -516 34 -620 23z m465 -1127 c299 -77 552 -299 673 -587 54 -131 72 -223 72 -380 0 -157 -18 -249 -72 -380 -125 -298 -394 -524 -708 -597 -110 -25 -320 -25 -430 0 -363 84 -656 367 -753 727
									-22 83 -25 115 -25 250 0 135 3 167 25 250 103 382 406 660 802 736 107 20 298 12 416 -19z m-59 -2277 c645 -66 1212 -456 1507 -1040 l63 -125 -58 -54 c-375 -353 -856 -577 -1398 -653 -116 -16 -494 -16 -610 0 -542 76 -1023 300 -1398 653 l-58 54 63 125 c261 516 725 877 1290 1004 195 44 399 56 599 36z"/>
							</g>
						</svg>
	                </div>
	                <div class="chat_ib">
	                  <input class="buyid" type="hidden" value="${chat.buyer_id != sessionScope.id ? chat.buyer_id : chat.id }">
	                  <input class="pcode" type="hidden" value="${chat.pcode }">
	                  <h5><c:out value="${chat.buyer_id != sessionScope.id ? chat.buyer_id : chat.id }"/> <span class="chat_date"><c:out value="${chat.send_date }"/></span></h5>
	                  <p><c:out value="${chat.context }"/></p>
	                </div>
	              </div>
	            </div>
            </c:forEach>
          </div>
          <!-- chat List End -->
        </div>
        <!-- prd info -->
        <div id="output" class="mesgs">
        <div class="headind_srch">
            <div class="recent_heading">
              <h4 id="userH4"></h4>
            </div>
        </div>
        <!-- prd info End -->
          
          <div class="msg_history">
          	<c:if test="${empty chatList }">
	        	<div style="text-align: center;margin-top: 120px;">
	        		<img src="https://i.pinimg.com/originals/73/68/91/7368914ad993256049334f1976c25bec.jpg" width="200" style="margin: 0px auto;"><br>
	          		채팅이 없습니다.
	        	</div>          	
          	</c:if>
          </div>
          
          <div class="type_msg">
              <div class="input-group">
				  <input id="msgData" type="text" class="form-control" placeholder="채팅방을 선택하여 채팅을 시작해세요!" aria-describedby="button-addon2" disabled="disabled">
				  <input class="btn btn-outline-secondary" type="button" id="button-addon2" disabled="disabled" value="전송">
			  </div>
          </div>
        </div>
        <!-- chat msg End -->
      </div>
      
    </div>
</div>

<!-- footer -->
<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp" />
</body>
</html>