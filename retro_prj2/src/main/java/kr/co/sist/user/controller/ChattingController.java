package kr.co.sist.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.co.sist.user.domain.chat.ChatListDomain;
import kr.co.sist.user.service.chat.ChattingService;
import kr.co.sist.user.vo.chat.ChatDetailVO;
import kr.co.sist.user.vo.chat.InsertChatVO;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService cService;
	
	@GetMapping("/chat/chatting_room.do")
	public String chattingRoom() {
		return "user/chat/chatting_room";
	}

	@GetMapping("/chat/chatting.do")
	public String chatting(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		if(id == null || "".equals(id)) {
			 return "redirect:https://google.com";
		}
		
		List<ChatListDomain> list = cService.searchChatList(id);
		model.addAttribute("chatList", list);
		session.setAttribute("id", id);
		
		return "user/chat/chatting";
	}
	
	@GetMapping("/chat/chat_progress.do")
	public String detailChat(ChatDetailVO cdVO, Model model) {
		model.addAttribute("data", cService.chatHistory(cdVO));
		model.addAttribute("prdInfo", cService.chatPrdInfo(cdVO.getPcode()));
		model.addAttribute("you", cdVO.getYou());
		
		return "user/chat/chat_ajax";
	}
	
	@ResponseBody
	@PostMapping("/chat/chating_process.do")
	public String sendChat(InsertChatVO icVO) {
		return cService.sendChat(icVO).toJSONString();
	}
	
	@GetMapping("/chat/start_chat.do")
	public String startNewChat(HttpSession session, Model model, String pcode, String uid) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("u", uid);
		model.addAttribute("pcode", pcode);
		
		if(!id.equals(uid)) {
			model.addAttribute("sFlag", "A");
		}
		
		model.addAttribute("uid", uid);
		
		List<ChatListDomain> list = cService.searchChatList(id);
		model.addAttribute("chatList", list);
		
		return "user/chat/chatting";
	}
}
