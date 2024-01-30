package kr.co.sist.user.vo;
//인영 - 사용자 : 상품 상태 변경 선택 VO
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyReceiptVO {

	private String id, pcode, payment;
	private Date payment_date;
	
}
