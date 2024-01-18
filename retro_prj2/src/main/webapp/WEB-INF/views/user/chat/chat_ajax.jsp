<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="headind_srch">
    <div class="recent_heading">
      <span id="userH4" style="font-size: 26px;color: #05728f;float: left;margin-right: 15px;"><c:out value="${you }"/></span>
      <img style="width: 40px; height: 40px;float: left;margin-top: 10px;border-radius: 4px;background-color: rgb(246, 238, 237);margin-right: 15px;" alt=" "
      	src="https://i.namu.wiki/i/LHCcQXqCfC4aa-UGKIKCapukchL2xkGztQe4Fcu_lFUMGUKo98ojnSmKYLUdVJFW2IoCuSrUH2Bz2FmCLZrGcic7J8N8srcj9uBb9h89ROHwQg18aCcPAiNG0J7CDLNOTMmIsPNqyJckCwv_pzLbA.webp">
      <div style="margin-top: 5px;">
      	<span><c:out value="${prdInfo.pname }"/></span><br>
      	<span><fmt:formatNumber value="${prdInfo.price }" pattern="#,###,###,###원"/></span>
      </div>
    </div>
</div>

<div class="msg_history">
<c:forEach var="txt" items="${data }">
	<c:choose>
		<c:when test="${txt.sender eq sessionScope.id }">
			<!-- 발신 -->
			<div class="outgoing_msg">
			  <div class="sent_msg">
			    <p><c:out value="${txt.context }"/></p>
			    <span class="time_date"><fmt:formatDate value="${txt.send_date }" pattern="HH:mm | MM-dd"/></span> </div>
			</div>
		</c:when>
		<c:otherwise>
			<!-- 수신 -->
			<div class="incoming_msg">
			  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			  <div class="received_msg">
			    <div class="received_withd_msg">
			      <p><c:out value="${txt.context }"/></p>
			      <span class="time_date"><fmt:formatDate value="${txt.send_date }" pattern="HH:mm | MM-dd"/></span></div>
			  </div>
			</div>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
	
<div class="type_msg">
	<div class="input-group">
		<input id="msgData" type="text" class="form-control" placeholder="채팅 입력" aria-describedby="button-addon2">
		<input class="btn btn-outline-secondary" type="button" id="button-addon2" value="전송" onclick="sendMsg()">
	</div>
</div>