package kr.co.sist.admin.domain;
//인영 - 관리자 : 상품관리 Domain
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminProductDomain {
	private String  nickname,id, category, pname, pcode;
	private int price;
	private Date input_date;
}//AdminProductDomain
