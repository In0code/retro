package kr.co.sist.user.domain;
//인영 - 사용자 : 관심상품 Domain
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WishDomain {

	private String img, pname, wcode, pcode, id;
	private int price;
	private Date input_date;
	
}
