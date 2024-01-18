package kr.co.sist.user.service.chat;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sist.user.dao.chat.ChattingDAO;
import kr.co.sist.user.domain.chat.ChatDetailDomain;
import kr.co.sist.user.domain.chat.ChatListDomain;
import kr.co.sist.user.domain.chat.ChatPrdDomain;
import kr.co.sist.user.vo.chat.ChatDetailVO;
import kr.co.sist.user.vo.chat.InsertChatVO;

@Service
public class ChattingService {

	@Autowired
	private ChattingDAO cDAO;
	
	public List<ChatListDomain> searchChatList(String id) {
		List<ChatListDomain> tempList = cDAO.selectChatList(id);
		Set<ChatListDomain> set = new LinkedHashSet<ChatListDomain>();
		
		for(ChatListDomain domain : tempList) {
			set.add(domain);
		}
		
		return new ArrayList<ChatListDomain>(set);
	}
	
	public List<ChatDetailDomain>  chatHistory(ChatDetailVO cdVO) {
		return cDAO.selectOneChat(cdVO);
	}
	
	public ChatPrdDomain chatPrdInfo(String pcode) {
		return cDAO.selectPrdInfo(pcode);
	}
	
	public JSONObject sendChat(InsertChatVO icVO) {
		JSONObject json = new JSONObject();
		json.put("flag", false);
		json.put("msg", "전송 실패! 다시 시도해주세요.");
		
		int bFlag = 0;
		if("".equals(icVO.getContext()) || icVO.getContext() == null) { bFlag++; }
		if("".equals(icVO.getPcode()) || icVO.getPcode() == null) { bFlag++; }
		if("".equals(icVO.getReceiver()) || icVO.getReceiver() == null) { bFlag++; }
		if("".equals(icVO.getSender()) || icVO.getSender() == null) { bFlag++; }
		
		if(bFlag == 0) {
			int result = 0;
			if("A".equals(icVO.getSFlag())) {
				result = cDAO.startNewChat(icVO);
			} else {
				result = cDAO.insertChat(icVO);				
			}
			
			if(result == 1) {
				json.put("flag", true);
			}
		}
		
		return json;
	}
}
