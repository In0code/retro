<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:if test="${ empty id }">
    <c:redirect url="http://localhost/retro_prj/user/login_frm.do"/>
    </c:if> 
<!DOCTYPE html>

<!-- 인영 - 사용자 : 관심상품 JSP -->

<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/26ca667.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/199727e.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/6ce4bbc.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/9caa514.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/1f3c072.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/e5d2c10.css" />
<link rel="stylesheet" href="https://kream.co.kr/_nuxt/css/ac4cc82.css" />
<c:import url="http://localhost/retro_prj/common/cdn/cdn.jsp" />

<style type="text/css">
#wishLi{
	color: #333;
}

#orderByList {
	display: none;
}

.btnStyle {
	border-radius: 10px;
	border: 1px solid #EEEFF0;
	font-size: 14px;
	font-weight: 600;
	width: 70px;
	padding: 10px;
	margin-left: 30px;
}

.end-0 {
	right: 0;
}

  #deleteBtn:hover {
    cursor: pointer; /* 버튼 위에 마우스를 올릴 때 손가락 모양으로 변경 */
  }
</style>
<script type="text/javascript">
	$(function() {
		
	});//ready
	
		function deleteWish(pcode) {
			var confirmDelete = confirm("정말로 삭제하시겠습니까?");
			if (confirmDelete) {
			$.ajax({
				url : "wishDelete.do",
				type : "get",
				data : "pcode=" + pcode,
				dataType : "JSON",
				error : function(xhr) {
					alert("죄송합니다. 서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
					console.log(xhr.status);
				},
				success : function(jsonObj) {
					alert("삭제 완료되었습니다.");
					location.reload()
					/* location.href=""; 사용자 메인으로 이동 */
				}//success
			});//ajax
			}//end if
		}//deleteProduct
</script>

</head>
	<c:import url="/common/cdn/header.jsp" />
<body style="height: auto">
	<main class="relative flex-grow border-b-2"
		style="min-height: -webkit-fill-available; -webkit-overflow-scrolling: touch">
		<div
			class="flex mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
			<c:import url="/common/cdn/mypage_sidebar.jsp" />
			<div class="w-full flex-grow">
				<c:import url="/common/cdn/mypage_info.jsp" />
				<div class="px-0 max-lg:mt-10">
					<div class="items-center justify-between block mb-4 md:flex lg:mb-7">
						<div class="flex-shrink-0 mb-1 text-xs leading-4 text-body md:text-sm pe-4 md:me-6 lg:ps-2 lg:block">
							${ selectAllCnt } 개의 상품</div>
					</div>

				<div id="listDiv">
						<div id="pcDiv">
						<c:forEach var="wl" items="${ searchWishList }">
						<!-- 상품 정보 -->
						<div id="productDiv1" onclick="">
							<div data-v-8c632d9a="">
										<div data-v-29479193="" data-v-8c632d9a="">
											<div data-v-29479193="" class="purchase_list_display_item"
												style="background-color: rgb(255, 255, 255);">
												<div data-v-29479193="" class="purchase_list_product">
													<div data-v-29479193="" class="list_item_img_wrap">
											<img data-v-29479193="" alt="image"
												src="http://localhost/retro_prj/upload/${ wl.img }"
												class="list_item_img"
												style="background-color: rgb(246, 238, 237);">
										</div>
										<!---->

										<!-- 상품명 -->
										<div data-v-29479193="" class="list_item_title_wrap" style="width: auto">
											<a href="http://localhost/retro_prj/user/goods/goods_info.do?pcode=${ wl.pcode }" class="list_item_title">
											<p data-v-29479193="" class="list_item_title">${ wl.pname }</p></a>
										</div>
										<!---->
									</div>

									<div data-v-29479193="" class="list_item_status">
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">
												<fmt:formatNumber value="${ wl.price }" pattern="#,###,###"/>원
												</p>
										</div>
										<!---->

										<!-- 삭제 -->
										<div data-v-6e1f328e="" class="list_item_column column_last">
											<input type="button" class="btnStyle" value="삭제하기" id="deleteBtn" onclick="deleteWish('${ wl.pcode }')" style="margin-left: 60px;" />
										</div>
										<!---->
									</div>
								</div>
								<!-- 상품 정보 -->
							</div>
						</div>
						</div>
						<!---->
						</c:forEach>
						</div>
						
						</div>
					
					
					
					
					</div>
					<div class="py-8 text-center xl:pt-14"></div>
				</div>
				
			</div>
		<div class="Toastify"></div>
	</main>
	<c:import url="http://localhost/retro_prj/common/cdn/footer.jsp"/>
</body>
</html>