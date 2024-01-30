package kr.co.sist.user.vo;
//인영 - 사용자 : 상품 VO
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO {
	private String c3code, id, pcode, pname, context, img, img2, img3, 
		img4, img5, status, loc, deliver, saleok, pcancel;
	private int price;
	
	public ProductVO(String pcode) {
		this.pcode=pcode;
	}
}//class
