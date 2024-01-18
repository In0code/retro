<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 결제 css -->
<link href="https://fruitsfamily.com/static/css/main.8c8a1dc3.chunk.css" rel="stylesheet">
<link href="https://fruitsfamily.com/static/css/main.5a75766e.chunk.css" rel="stylesheet">
<style type="text/css">
.Checkout-container {
    padding-left: 650px;
    padding-right: 650px;
}
.h1, h1 {
    font-size: 40px;
    text-align: center;
}
</style>
<script type="text/javascript">
$(function() {
	 // 초기에는 안전 결제하기 버튼을 비활성화
    $('.button.default.full').prop('disabled', true);

    // 체크박스 상태 감지
    $('#agree1').change(function() {
        // 체크박스가 체크되었을 때
        if ($(this).is(':checked')) {
            // 안전 결제하기 버튼 활성화
            $('.button.default.full').prop('disabled', false);
        } else {
            // 체크되지 않았을 때는 안전 결제하기 버튼 비활성화
            $('.button.default.full').prop('disabled', true);
        }
    });

    // 안전 결제하기 버튼 클릭 시 폼 제출
    $('.button.default.full').click(function() {
        // 체크박스가 체크되었을 때만 폼 제출
        if ($('#agree1').is(':checked')) {
            $('#pay').submit();
        }
    });
});//ready
</script>

</head>
<body style="font-family: Pretendard Variable">
<c:import url="/common/cdn/header.jsp"/>
	<div class="Checkout-container">
		<h1 class="page-title" style="font-family: Pretendard Variable; font-size: 22px">주문 / 결제</h1>
		<h4 class="Checkout-title" style="font-family: Pretendard Variable">상품 정보</h4>
		<div class="CheckoutProductDetails" style="font-family: Pretendard Variable">
			<img class="CheckoutProductDetails-image" loading="lazy"
				alt="product_image"
				src="http://localhost/retro_prj/upload/<c:out value="${ payInfo.img }"/>">
			<div class="CheckoutProductDetails-details" style="font-family: Pretendard Variable">
				<div class="CheckoutProductDetails-productTitle" style="font-size: 15px; font-weight: 500">
				<c:out value="${ payInfo.pname }"/></div>
			</div>
		</div>
		<div class="Checkout-order">
			<div class="CheckoutInvoice">
				<div class="CheckoutInvoice-safety-purchase-info" style="font-family: Pretendard Variable">
					<a href="" rel="noopener noreferrer" target="_blank" class="SafetyPurchaseInfo">
					<div class="SafetyPurchaseInfo-button">
							<img alt="shield" src="https://fruitsfamily.com/static/media/icon_shield.ad9a7fba.svg">
							<div class="text" style="font-size:15px">100% 안전한 ‘안전결제’로 거래하세요.</div>
						</div></a>
				</div>
				<div class="CheckoutInvoice-price" style="font-family: Pretendard Variable">
					<div>상품 금액</div>
					<div><fmt:formatNumber value="${payInfo.price}" pattern="#,###,###"/>원</div>
				</div>
				<div class="CheckoutInvoice-price" style="font-family: Pretendard Variable">
					<div>수수료</div>
					<div>0원</div>
				</div>
				<div class="CheckoutInvoice-price total" style="font-family: Pretendard Variable">
					<div style="font-family: Pretendard Variable">총 결제 금액</div>
					<div style="font-family: Pretendard Variable"><fmt:formatNumber value="${payInfo.price}" pattern="#,###,###"/>원</div>
				</div>
			</div>
			<div class="Checkout-divider"></div>
			<div class="Checkout-divider"></div>
			<div class="CheckoutPaymentMethod">
				<div style="font-family: Pretendard Variable">결제 방법</div>
				<div class="CheckoutPaymentMethod-content">
					<div class="CheckoutPaymentMethod-select">
						<img alt="radio" src="https://fruitsfamily.com/static/media/icon_radio.ff11a5b5.svg">
						<div style="font-family: Pretendard Variable">안전 결제</div>
					</div>
					<div class="CheckoutPaymentMethod-pay">
						<img alt="naver-pay"
							src="https://fruitsfamily.com/static/media/icon_logo_npay.06f21a96.svg">
					</div>
				</div>
			</div>
			<div class="Checkout-divider"></div>
			<div class="Checkout-agree-container">
				<div class="Checkout-agree-list">
					<div class="Checkout-agree-text Checkout-select-text" style="font-family: Pretendard Variable; font-size: 15px">
						주문할 상품의 결제,배송,주문정보를 확인하였으며 이에 동의합니다.
					</div>
					<div class="form-checkbox">
						<input type="checkbox" id="agree1" name="agree1">
						<label for="agree1"></label>
					</div>
				</div>
				<form id="pay" action="pay_wan.do">
				<div style="font-family: Pretendard Variable">
					<input type="button" class="button default full" value="안전 결제하기"/>
					<input type="hidden" name="pcode" value="${ param.pcode }"/>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<c:import url="/common/cdn/footer.jsp"/>
</html>