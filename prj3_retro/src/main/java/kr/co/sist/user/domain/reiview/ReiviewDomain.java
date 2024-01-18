package kr.co.sist.user.domain.reiview;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReiviewDomain {

	private String id, context, input_date, buycommentcode;
	private char select1, select2_1, select2_2, select2_3, select2_4;
}
