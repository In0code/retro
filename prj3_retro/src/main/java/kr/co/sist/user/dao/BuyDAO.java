package kr.co.sist.user.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.BuyGoodsDomain;
import kr.co.sist.user.vo.BuyVO;

@Component
public class BuyDAO {
	
	/**
	 * 상품 결제
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */
	public BuyGoodsDomain selectPayInfo(String pcode) throws PersistenceException{
		BuyGoodsDomain bgd=null;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		bgd=ss.selectOne("kr.co.sist.goods.selectPayInfo",pcode);
		
		mbh.closeHandler(ss);
		
		return bgd;
	}
	
	/**
	 * 상품결제 인서트
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */
	public int insertPay(BuyVO bVO)throws PersistenceException{
		int cnt=0;
		
		MybatisHandler mbh=MybatisHandler.getInstance();
		SqlSession ss=mbh.getMyBatisHandler(false);
		cnt=ss.insert("kr.co.sist.goods.insertPayInfo", bVO);
		
		if(cnt==1) {
			ss.commit();
		}
		
		mbh.closeHandler(ss);
		
		return cnt;
	}
	
}
