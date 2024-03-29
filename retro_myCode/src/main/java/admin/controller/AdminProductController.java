package kr.co.sist.admin.controller;
// 인영 - 관리자 : 상품관리 Controller
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.sist.admin.domain.AdminProductDetailDomain;
import kr.co.sist.admin.domain.AdminProductDomain;
import kr.co.sist.admin.service.AdminProductService;
import kr.co.sist.common.BoardRangeVO;
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;

@Controller
public class AdminProductController {

	private AdminProductService aps = AdminProductService.getInstance();

	@RequestMapping("/admin/product_managing.do")
	public String productManage(HttpServletRequest request, BoardRangeVO brVO, String page, Model model) {
		int currentPage = 1;
		if(page != null && !"".equals(page)) {
			currentPage = Integer.parseInt(page);
		}//end if
		
		int totalRecode = aps.productTotalCnt(brVO);
		
		PaginationDomain pg = new Pagination().setStartEndPageNum(totalRecode, currentPage);
		
		String keyword = request.getParameter("keyword");
		String field = request.getParameter("field");

		brVO.setKeyword(keyword);
		brVO.setField(field);
		brVO.setStartNum(pg.getStartNum());
		brVO.setEndNum(pg.getEndNum());

		List<AdminProductDomain> productList = aps.searchAllProduct(brVO);

		model.addAttribute("productList", productList);
		model.addAttribute("pageStart", pg.getPaginationStartNum());
		model.addAttribute("pageEnd", pg.getPaginationEndNum());

		return "admin/product_managing";
	}// productManage

	
	
	@RequestMapping("/admin/productDetail_managing.do")
	public String productManageDetail( Model model,String pcode) {
		AdminProductDetailDomain productOne=aps.searchOneProduct(pcode);
		
		model.addAttribute("productOne", productOne);

		return "admin/productDetail_managing";
	}// productManage
	
	
	@ResponseBody
	@RequestMapping("/admin/productManageEdit.do")
	public String productManageEdit(String pcode) {
		
		return aps.editRemoveProduct(pcode).toJSONString();
	}// productManage

	
}// class
