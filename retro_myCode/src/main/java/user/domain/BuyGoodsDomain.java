package kr.co.sist.user.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyGoodsDomain {
	private String pname,pcode,img,safety_pay;
	private Date payment_date;
	private int price;
}

