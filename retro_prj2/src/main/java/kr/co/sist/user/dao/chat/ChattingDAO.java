package kr.co.sist.user.dao.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.chat.ChatDetailDomain;
import kr.co.sist.user.domain.chat.ChatListDomain;
import kr.co.sist.user.domain.chat.ChatPrdDomain;
import kr.co.sist.user.vo.chat.ChatDetailVO;
import kr.co.sist.user.vo.chat.InsertChatVO;

@Component
public class ChattingDAO {

	public List<ChatListDomain> selectChatList(String id) {
		List<ChatListDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("user.chat.chatList", id);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public List<ChatDetailDomain> selectOneChat(ChatDetailVO cdVO) {
		List<ChatDetailDomain> list = null;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		list = ss.selectList("user.chat.selectOneChat", cdVO);
		
		mh.closeHandler(ss);
		
		return list;
	}
	
	public ChatPrdDomain selectPrdInfo(String pcode) {
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		ChatPrdDomain domain = ss.selectOne("user.chat.chatPrdInfo", pcode);
		
		mh.closeHandler(ss);
		
		return domain;
	}
	
	public int insertChat(InsertChatVO icVO) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.insert("user.chat.insertChat", icVO);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		return result;
	}

	public int startNewChat(InsertChatVO icVO) {
		int result = 0;
		
		MybatisHandler mh = MybatisHandler.getInstance();
		SqlSession ss = mh.getMyBatisHandler(false);
		
		result = ss.insert("user.chat.startNewChat", icVO);
		if(result == 1) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		return result;
	}
	
}
