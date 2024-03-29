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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Swiper 라이브러리 CDN 링크 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<style type="text/css">
a {
    font-size: small;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
    // Swiper 초기화 함수
    function initializeSwiper() {
      var swiper = new Swiper('.swiper', {
        slidesPerView: 1,
        spaceBetween: 10,
        navigation: {
          nextEl: '#product-gallery-slider-next',
          prevEl: '#product-gallery-slider-prev',
        },
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
      });

      // 이전 버튼 클릭 시
      $("#product-gallery-slider-prev").on("click", function () {
        swiper.slidePrev();
      });

      // 다음 버튼 클릭 시
      $("#product-gallery-slider-next").on("click", function () {
        swiper.slideNext();
      });

      // 페이지네이션 버튼 클릭 시 해당 슬라이드로 이동
      $(".swiper-pagination-bullet").on("click", function () {
        var index = $(this).index();
        swiper.slideTo(index);
      });

      return swiper;
    }

    // 초기화된 슬라이더가 있으면 파괴 후 다시 초기화
    var existingSwiper = initializeSwiper();
    if (existingSwiper) {
      existingSwiper.destroy();
      initializeSwiper();
    }
  });
  
  function moveReport() {
	  location.herf="report_frm.do?pcode=${param.pcode}"
  }
  
  
  function addWish(pcode){
	  
	  	var chkPcode = ${ chkPcode };
		if(chkPcode == 0 ){
					alert("찜 목록에 상품이 추가되었습니다.");
		                // 사용자가 확인을 누른 경우
					  $.ajax({
							url : "../product/addWish.do",
							type : "get",
							data : "pcode=" + pcode,
							dataType : "JSON",
							error : function(xhr) {
								alert("죄송합니다. 서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주세요.");
								console.log(xhr.status);
							},
							success : function(jsonObj) {
							if (confirm("찜 목록으로 이동하시겠습니까?")) {
		                        window.location.href = "http://localhost/retro_prj/user/product/wishList.do"; 
		                    } else {
		                        location.reload();
		                    }//end else
		            }//success
				});//ajax
                  	
                  	
         }else{
          	alert("이미 찜 목록에 존재하는 상품입니다.");
              if (confirm("찜 목록으로 이동하시겠습니까?")) {
                   window.location.href = "http://localhost/retro_prj/user/product/wishList.do"; 
               } else {
                   location.reload();
               }//end else
     	}//end else
}//addWish

</script>
</head>
<body>
<jsp:include page="/common/cdn/header.jsp"/>
	<div class="max-w-[1280px] lg:min-h-[950px] mx-auto max-w-[1280px] px-4 md:px-8 2xl:px-16 box-content">
		<div class="items-start block grid-cols-2 pt-5 lg:grid gap-x-10 xl:gap-x-14 pb-14 lg:py-10 lg:pb-14 2xl:pb-20">
			<div class="carouselWrapper relative product-gallery swiperThumbnail product-gallery-slider sticky top-[200px]   ">
				<div class="swiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden" dir="ltr">
					
					<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
						<div class="swiper-slide swiper-slide-active" style="width: 503px;">
							<div class="col-span-1 transition duration-150 ease-in hover:opacity-90 w-full relative pt-[100%]">
								<img alt="상품이미지-0" referrerpolicy="no-referrer"
									src="http://localhost/retro_prj/upload/<c:out value="${ img }"/>"
									decoding="async" data-nimg="fill"
									class="object-cover w-full h-full rounded-lg top-1/2 left-1/2"
									loading="lazy"
									style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
							</div>
						</div>
						<div class="swiper-slide swiper-slide-next" style="width: 503px;">
							<div class="col-span-1 transition duration-150 ease-in hover:opacity-90 w-full relative pt-[100%]">
								<img alt="상품이미지-1" referrerpolicy="no-referrer"
									src="http://localhost/retro_prj/upload/<c:out value="${ img2 }"/>"
									decoding="async" data-nimg="fill"
									class="object-cover w-full h-full rounded-lg top-1/2 left-1/2"
									loading="lazy"
									style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
							</div>
						</div>
						 <div class="swiper-slide" style="width: 503px;">
							<div class="col-span-1 transition duration-150 ease-in hover:opacity-90 w-full relative pt-[100%]">
								<img alt="상품이미지-2" referrerpolicy="no-referrer"
									src="http://localhost/retro_prj/upload/<c:out value="${ img3 }"/>"
									decoding="async" data-nimg="fill"
									class="object-cover w-full h-full rounded-lg top-1/2 left-1/2"
									loading="lazy"
									style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
							</div>
						</div>
						<div class="swiper-slide" style="width: 503px;">
							<div class="col-span-1 transition duration-150 ease-in hover:opacity-90 w-full relative pt-[100%]">
								<img alt="상품이미지-3" referrerpolicy="no-referrer"
									src="http://localhost/retro_prj/upload/<c:out value="${ img4 }"/>"
									decoding="async" data-nimg="fill"
									class="object-cover w-full h-full rounded-lg top-1/2 left-1/2"
									loading="lazy"
									style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
							</div>
						</div>
						
						
					</div>
					<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
						<span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
						
					</div>
				</div>
				
				<div class="flex items-center w-full absolute top-2/4 z-10 ">
					<button
						class="w-7 h-7 lg:w-8 lg:h-8 text-sm md:text-base lg:text-lg text-black flex items-center justify-center rounded absolute transition duration-250 hover:bg-gray-900 hover:text-white focus:outline-none transform shadow-navigation -translate-x-1/2 rounded-full lg:w-9 lg:h-9 xl:w-10 xl:h-10 3xl:w-12 3xl:h-12 lg:text-xl 3xl:text-2xl -left-4 bg-transparent shadow-transparent hover:bg-transparent hover:text-black swiper-button-disabled"
						id="product-gallery-slider-prev" aria-label="prev-button"
						disabled="" >
						<svg stroke="currentColor" fill="currentColor" stroke-width="0"
							viewBox="0 0 512 512" height="1em" width="1em"
							xmlns="http://www.w3.org/2000/svg">
							<path
								d="M217.9 256L345 129c9.4-9.4 9.4-24.6 0-33.9-9.4-9.4-24.6-9.3-34 0L167 239c-9.1 9.1-9.3 23.7-.7 33.1L310.9 417c4.7 4.7 10.9 7 17 7s12.3-2.3 17-7c9.4-9.4 9.4-24.6 0-33.9L217.9 256z"></path></svg>
					</button>
					<button
						class="w-7 h-7 lg:w-8 lg:h-8 text-sm md:text-base lg:text-lg text-black flex items-center justify-center rounded absolute transition duration-250 hover:bg-gray-900 hover:text-white focus:outline-none transform shadow-navigation translate-x-1/2 rounded-full lg:w-9 lg:h-9 xl:w-10 xl:h-10 3xl:w-12 3xl:h-12 lg:text-xl 3xl:text-2xl -right-4 bg-transparent shadow-transparent hover:bg-transparent hover:text-black"
						id="product-gallery-slider-next" aria-label="next-button">
						<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" 
							height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
						<path d="M294.1 256L167 129c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.3 34 0L345 239c9.1 9.1 9.3 23.7.7 33.1L201.1 417c-4.7 4.7-10.9 7-17 7s-12.3-2.3-17-7c-9.4-9.4-9.4-24.6 0-33.9l127-127.1z"></path></svg>
					</button>
				</div>
				
				
				
				
			</div>
			<div class="pt-4 lg:pt-0">
				<div class="pb-4">
					<div class="flex items-center w-full chawkbazarBreadcrumb">
						<ol class="flex flex-wrap items-center w-full">
							<li
								class="flex-shrink-0 px-0 text-sm break-all transition duration-200 ease-in text-body first:ps-0 last:pe-0 hover:text-heading"><a
								href="/">홈</a></li>
							<li
								class="text-sm mx-2.5 leading-5 text-body min-[480px]:px-1 max-[480px]:px-0">&gt;</li>
							<li
								class="flex-shrink-0 px-0 text-sm break-all transition duration-200 ease-in text-body first:ps-0 last:pe-0 hover:text-heading"><a
								class="capitalize" href="/retro_prj/goods/goods_list1.do?category1=C">패션의류</a></li>
							<li
								class="text-sm mx-2.5 leading-5 text-body min-[480px]:px-1 max-[480px]:px-0">&gt;</li>
							<li
								class="flex-shrink-0 px-0 text-sm break-all transition duration-200 ease-in text-body first:ps-0 last:pe-0 hover:text-heading"><a
								class="capitalize" href="/retro_prj/goods/goods_list2.do?category2=C1">여성의류</a></li>
							<li
								class="text-sm mx-2.5 leading-5 text-body min-[480px]:px-1 max-[480px]:px-0">&gt;</li>
							<li
								class="flex-shrink-0 px-0 text-sm break-all transition duration-200 ease-in text-body first:ps-0 last:pe-0 hover:text-heading"><a
								class="capitalize" href="/retro_prj/goods/goods_list3.do?category3=C101">티셔츠/캐주얼의류</a></li>
						</ol>
					</div>
				</div>
				
				<div class="pb-5 border-b border-gray-300">
					<h1 class="flex justify-between mb-1 text-lg font-bold align-middle text-heading lg:text-xl 2xl:text-2xl hover:text-black">
						<c:out value="${ pname }"/>
						 <a href="report_frm.do?pcode=${param.pcode}&id=${id}" onclick="window.open(this.href, '', 'width=500 , height=450, top=120, left=650'); return false;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lightbulb-off-fill" viewBox="0 0 16 16">
  <path d="M2 6c0-.572.08-1.125.23-1.65l8.558 8.559A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a1.964 1.964 0 0 0-.453-.618A5.984 5.984 0 0 1 2 6m10.303 4.181L3.818 1.697a6 6 0 0 1 8.484 8.484zM5 14.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5M2.354 1.646a.5.5 0 1 0-.708.708l12 12a.5.5 0 0 0 .708-.708l-12-12z"/>
</svg>신고</a>
						
					</h1>
					<div class="flex items-center justify-between">
						<div
							class="text-heading font-bold text-[40px] pe-2 md:pe-0 lg:pe-2 2xl:pe-0 mr-2">
							<fmt:formatNumber value="${price}" pattern="#,###,###"/><span class="text-base">원</span>
						</div>
						<svg width="30" height="17" viewBox="0 0 30 17" fill="none"
							xmlns="http://www.w3.org/2000/svg">
							<path
								d="M11.6626 6.31356V6.28956C11.6626 4.57356 10.4506 3.38556 8.44665 3.38556H5.01465V11.7856H6.86265V9.26556H8.26665C10.1506 9.26556 11.6626 8.25756 11.6626 6.31356ZM9.79065 6.34956C9.79065 7.06956 9.25065 7.62156 8.32665 7.62156H6.86265V5.05356H8.29065C9.21465 5.05356 9.79065 5.49756 9.79065 6.32556V6.34956Z"
								fill="white"></path>
							<path
								d="M18.2531 11.7856V8.05356C18.2531 6.31356 17.3771 5.28156 15.3851 5.28156C14.2931 5.28156 13.5971 5.48556 12.8891 5.79756L13.3451 7.18956C13.9331 6.97356 14.4251 6.84156 15.1211 6.84156C16.0331 6.84156 16.5011 7.26156 16.5011 8.01756V8.12556C16.0451 7.96956 15.5771 7.86156 14.9291 7.86156C13.4051 7.86156 12.3371 8.50956 12.3371 9.91356V9.93756C12.3371 11.2096 13.3331 11.9056 14.5451 11.9056C15.4331 11.9056 16.0451 11.5816 16.4891 11.0896V11.7856H18.2531ZM16.5251 9.51756C16.5251 10.1776 15.9491 10.6456 15.0971 10.6456C14.5091 10.6456 14.1011 10.3576 14.1011 9.86556V9.84156C14.1011 9.26556 14.5811 8.95356 15.3611 8.95356C15.8051 8.95356 16.2131 9.04956 16.5251 9.19356V9.51756Z"
								fill="white"></path>
							<path
								d="M25.7083 5.35356H23.8123L22.4083 9.73356L20.9443 5.35356H19.0123L21.5323 11.8096C21.3763 12.1336 21.2083 12.2296 20.8963 12.2296C20.6563 12.2296 20.3563 12.1216 20.1163 11.9776L19.5043 13.2976C19.9723 13.5736 20.4643 13.7416 21.1243 13.7416C22.2163 13.7416 22.7443 13.2496 23.2363 11.9416L25.7083 5.35356Z"
								fill="white"></path></svg>
					</div>
				</div>
				<div class="py-4 border-b border-gray-300 space-s-4">
					<div class="pb-1 space-y-5 text-sm">
						<div class="flex justify-between text-body">
							<span>26분 전 · 조회 <c:out value="${ pview }"/> · 찜 <c:out value="${ wish }"/></span><a href="/fraud">
							<div class="flex items-center hover:text-gray-400">
									<svg stroke="currentColor" fill="currentColor" stroke-width="0"
										viewBox="0 0 16 16" height="1em" width="1em"
										xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
											d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 100-6 3 3 0 000 6zm7 1.5a.5.5 0 01.5-.5h2a.5.5 0 010 1h-2a.5.5 0 01-.5-.5zm-2-3a.5.5 0 01.5-.5h4a.5.5 0 010 1h-4a.5.5 0 01-.5-.5zm0-3a.5.5 0 01.5-.5h4a.5.5 0 010 1h-4a.5.5 0 01-.5-.5zm2 9a.5.5 0 01.5-.5h2a.5.5 0 010 1h-2a.5.5 0 01-.5-.5z"
											clip-rule="evenodd"></path></svg>
									<span class="ml-2 ">사기조회</span>
								</div></a>
						</div>
						<div class="flex justify-between">
							<div class="flex-1 basis-[33.33%] pe-4 border-r border-gray-300">
								<span>배송비</span><span
									class="block mt-2 text-lg font-semibold text-heading">
								<c:choose>
									<c:when test="${ deliver eq 'Y' || deliver eq null }">
										배송비 포함
									</c:when>
									<c:when test="${ deliver eq 'N' }">
										배송비 별도
									</c:when>
								</c:choose>
								</span>
							</div>
							<div class="flex-1 basis-[33.33%] px-4 border-r border-gray-300">
								<span>상품 상태</span><span
									class="block mt-2 text-lg font-semibold text-heading">
							<c:choose>
								<c:when test="${ status eq 'J' }">
									중고
								</c:when>
								<c:when test="${ status eq 'S' }">
									새 상품
								</c:when>
							</c:choose>
									
									</span>
							</div>
							<div class="flex-1 basis-[33.33%] ps-4">
								<span>희망 지역</span><span
									class="block mt-2 text-lg font-semibold text-heading">
								<c:choose>
									<c:when
										test="${ loc eq null || loc eq ''}">
										지역 정보 없음
									</c:when>
									<c:when
										test="${ loc != null and loc != '' }">
										${ loc }
									</c:when>
								</c:choose>
							</span>
							</div>
						</div>
						
					</div>
				</div>
				<div class="flex items-center py-4 border-b border-gray-300 space-s-4">
					<button data-variant="slim" onclick="location.href='http://localhost/retro_prj/chat/start_chat.do?pcode=${ pcode }&uid=${id }';"
						class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center placeholder-white focus-visible:outline-none focus:outline-none rounded-md h-11 md:h-12 px-5 py-2 transform-none normal-case hover:shadow-cart w-full bg-white hover:bg-white/90 text-jnblack hover:text-jnblack border-[1px] border-jnblack">
						채팅하기</button>
					<button data-variant="slim" onclick="location.href='http://localhost/retro_prj/user/pay/safe_payment.do?pcode=${ pcode }';"
						class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center border-0 border-transparent placeholder-white focus-visible:outline-none focus:outline-none rounded-md h-11 md:h-12 px-5 text-white py-2 transform-none normal-case hover:text-white hover:shadow-cart w-full bg-jnblack hover:bg-jnblack/90">
						<span class="py-2 3xl:px-8">안전거래</span>
					</button>
					<button data-variant="slim" style="width:150px"  onclick="addWish('${ pcode }')"
						class="text-[13px] md:text-sm leading-4 inline-flex items-center cursor-pointer transition ease-in-out duration-300 font-semibold font-body text-center justify-center placeholder-white focus-visible:outline-none focus:outline-none rounded-md h-11 md:h-12 px-5 py-2 transform-none normal-case hover:shadow-cart w-full bg-white hover:bg-white/90 text-jnblack hover:text-jnblack border-[1px] border-jnblack">찜</button>
				</div>
			</div>
		</div>
		<div class="z-[15]" style="position: sticky; top: 80px;">
			<div
				class="mb-2 grid grid-cols-2 lg:grid-cols-5 list-none pl-0 w-full bg-white"
				data-nav-ref="true">
				<div class="col-span-1 lg:col-span-3 w-full">
					<a
						class="text-base py-2 px-4 border-b-[4px] border-b-transparent text-jnblack w-full lg:w-auto justify-center flex lg:block cursor-pointer false"
						aria-label="상품내용탭" aria-roledescription="상품내용탭" href="#">상품내용</a>
				</div>
				<div role="presentation" class="col-span-1 lg:col-span-2 w-full">
					<a
						class="text-base py-2 px-4 border-b-[4px] border-b-transparent text-jnblack w-full justify-center flex lg:block cursor-pointer border-b-jnblack transition duration-300 ease-in lg:border-b-transparent"
						aria-label="가게정보탭" aria-roledescription="가게정보탭" href="#">가게정보</a>
				</div>
			</div>
		</div>
		<div class="block grid-cols-5 lg:grid lg:mb-10">
			<div name="product-description"
				class="col-span-3 text-sm w-full data-[tab-active]:block">
				<div class="flex flex-col items-center justify-center w-full p-3 mb-2 space-y-2 bg-gray-200">
					<div class="flex space-x-2">
						<span class="flex items-center justify-center"><svg
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" clip-rule="evenodd"
									d="M12 21C16.9706 21 21 16.9706 21 12C21 7.02944 16.9706 3 12 3C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21ZM12 13.9286C12.4691 13.9286 12.8577 13.5645 12.8882 13.0964L13.1989 8.32508L13.2429 7.25541C13.2662 6.68747 12.8121 6.21429 12.2437 6.21429H11.7563C11.1879 6.21429 10.7338 6.68747 10.7571 7.25541L10.8012 8.32508L11.1118 13.0964C11.1423 13.5645 11.5309 13.9286 12 13.9286ZM11.993 17.7857C12.3583 17.7857 12.6651 17.663 12.9133 17.4174C13.1616 17.1719 13.2857 16.8661 13.2857 16.5C13.2857 16.1339 13.1616 15.8281 12.9133 15.5826C12.6651 15.3371 12.3583 15.2143 11.993 15.2143C11.6276 15.2143 11.3232 15.3371 11.0796 15.5826C10.8361 15.8281 10.7143 16.1339 10.7143 16.5C10.7143 16.8661 10.8361 17.1719 11.0796 17.4174C11.3232 17.663 11.6276 17.7857 11.993 17.7857Z"
									fill="#FF5453"></path></svg></span><span
							class="text-base font-bold pt-[2px]">거래 전 주의사항 안내</span>
					</div>
					<div class="text-xs truncate">
						판매자가 별도의 메신저로 결제링크를 보내거나 직거래(직접송금)을 <br>유도하는 경우 사기일 가능성이 높으니
						거래를 자제해 주시고
					</div>
					<span class="text-xs font-bold underline truncate"><a
						class="text-[#FF5453]" href="/cs-center">중고나라 고객센터</a>로 신고해주시기
						바랍니다.</span>
				</div>
				<article>
					<p class="px-4 py-10 break-words break-all whitespace-pre-line lg:py-2">
					<c:out value="${ context }"/>
					</p>
				</article>
			</div>
			<div name="product-store"
				class="col-span-2 w-full py-10 lg:py-2 px-4">
				<div class="flex">
					<div class="flex w-full flex-col justify-around lg:ml-4">
						<a class="font-semibold text-base text-jnblack"
							href="http://localhost/retro_prj/user_mypage_frm.do?id=${id }"><c:out value="${ id }"/></a><span
							class="font-medium text-sm flex text-jnGray-500">판매상품 7 ·
							안전거래 2 · 후기 0</span>
					</div>
					<a class="flex items-center translate-x-4" href="/store/1062005"><img
						alt="프로파일"
						src="https://img2.joongna.com/common/Profile/Default/profile_m.png"
						width="60" height="60" decoding="async" data-nimg="1"
						class="rounded-full max-w-none h-[60px] box-content border-4 border-white -translate-x-4"
						loading="lazy" style="color: transparent;"></a>
				</div>
				<div class="lg:ml-4">
					<div class="flex justify-between mt-2 text-[#0CB650] font-medium">
						<strong>신뢰지수 0</strong><span class="text-jnGray-500 text-sm">1000</span>
					</div>
					<div class="w-full h-1.5 bg-[#CCF4DC] rounded overflow-hidden">
						<div class="h-full rounded bg-[#0DCC5A]" style="width: 0%;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body> 
<jsp:include page="/common/cdn/footer.jsp"/>
</html>