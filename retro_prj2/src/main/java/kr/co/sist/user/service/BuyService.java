package kr.co.sist.user.service;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.sist.user.dao.BuyDAO;
import kr.co.sist.user.domain.BuyGoodsDomain;
import kr.co.sist.user.vo.BuyVO;

@Component
public class BuyService {
	
	@Autowired
	private BuyDAO bDAO;
	
	/**
	 * 상품결제 정보
	 * @param pcdoe
	 * @return
	 */
	public BuyGoodsDomain searchPayInfo(String pcode) {
		BuyGoodsDomain bgd=null;
		
		try {
		bgd=bDAO.selectPayInfo(pcode);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return bgd;
	}//searchPayInfo
	
	
	/**
	 * 상품결제 인서트
	 * @param pcode
	 * @return
	 */
	public int pay_confirm(BuyVO bVO) {
		int cnt=0;
		
		try {
		cnt=bDAO.insertPay(bVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		return cnt;
	}
	
	
}
