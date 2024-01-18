package kr.co.sist.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.sist.user.domain.BuyGoodsDomain;
import kr.co.sist.user.service.BuyService;
import kr.co.sist.user.vo.BuyVO;

@Controller
public class BuyController {
	
	@Autowired
	private BuyService bs;
	
	
	@GetMapping("user/pay/safe_payment.do")
	public String payment(String pcode, Model model) {
		System.out.println("==========");
		System.out.println(pcode);
		
		BuyGoodsDomain bgd=bs.searchPayInfo(pcode);
		
		model.addAttribute("payInfo", bgd);
		
		return "user/pay/safe_payment";
	}
	
	@GetMapping("user/pay/pay_wan.do")
	public String safe_pay(String pcode, Model model, HttpSession httpSession) {
		BuyVO bVO=new BuyVO((String)httpSession.getAttribute("id"), pcode);
		
		model.addAttribute("flag", bs.pay_confirm(bVO)==1? true:false);
		
		return "user/pay/pay_complete";
	}
	
	
}
