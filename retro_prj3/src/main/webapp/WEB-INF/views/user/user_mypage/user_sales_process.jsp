<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div data-v-8c632d9a="" class="purchase_head">
	<div data-v-8c632d9a="" class="head_status" style="font-size: 13px">
		<div data-v-8c632d9a="" class="status_box">
			<span data-v-8c632d9a="" class="status_txt">가격</span>
		</div>
		<div data-v-8c632d9a="" class="status_box">
			<span data-v-8c632d9a="" class="status_txt">등록일</span>
		</div>
		<div data-v-8c632d9a="" class="status_box">
			<span data-v-8c632d9a="" class="status_txt">찜</span>
		</div>
	</div>
</div>
		<c:choose>
			<c:when test="${empty saleList }">
				<div id="noDataDiv">
						<p class="py-12 text-center" style="padding: 40px 0px 41px 0px">상품이
							없습니다.</p>
					</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="prd" items="${saleList }">
								<!-- 상품 정보 -->
								<div id="productDiv1" onclick="moveTo('${prd.pcode }')">
									<div data-v-8c632d9a="">
										<div data-v-29479193="" data-v-8c632d9a="">
											<div data-v-29479193="" class="purchase_list_display_item"
												style="background-color: rgb(255, 255, 255);">
												<div data-v-29479193="" class="purchase_list_product">
													<div data-v-29479193="" class="list_item_img_wrap">
														<img data-v-29479193="" alt="  "
															src="http://localhost/retro_prj/upload/${prd.img }"
															class="list_item_img"
															style="background-color: rgb(246, 238, 237);">
														<!---->
													</div>
													<div data-v-29479193="" class="list_item_title_wrap" style="width: auto">
														<!---->
														<p data-v-29479193="" class="list_item_title">
														${ prd.pname  }</p>
													</div>
												</div>

												<div data-v-29479193="" class="list_item_status">
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">
															<fmt:formatNumber value="${ prd.price }" pattern="#,###,###"/>원
															</p>
													</div>
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">${prd.input_date }</p>
													</div>
													<div data-v-29479193=""
														class="list_item_column column_secondary">
														<p data-v-8016a084="" data-v-29479193=""
															class="secondary_title display_paragraph"
															style="color: rgba(34, 34, 34, 0.5);">${prd.wish }</p>
													</div>

												</div>
											</div>
											<!---->
										</div>
									</div>
								</div>
								<!---->
							</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
