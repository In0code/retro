package kr.co.sist.user.domain.chat;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ChatListDomain {

	private String sender, context, pcode, send_date, buyer_id, id;
	
	//sender의 중복을 제거 하기 위한 overriding, Set class에서 사용한다.
	@Override
    public int hashCode() {
        return (this.buyer_id+this.pcode).hashCode();
    }
    
    @Override
    public boolean equals(Object obj) {
        //p1.equals(p2)
        if(obj instanceof ChatListDomain) {
        	ChatListDomain domain = (ChatListDomain)obj;
            return this.hashCode() == domain.hashCode(); 
            
        }
        return false;
    }
}
