package kr.co.sist.user.vo.chat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class InsertChatVO {

	private String context, pcode, sender, receiver, sFlag;
}
