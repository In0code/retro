package kr.co.sist.user.domain.chat;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ChatDetailDomain {

	private String sender, context;
	private Date send_date;
}
