package kr.co.sist.user.dao;
//인영 - 사용자 : 상품 등록/수정/상세/삭제 DAO
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.common.dao.MybatisHandler;
import kr.co.sist.user.domain.MySalesDomain;
import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.vo.GoodsVO;
import kr.co.sist.user.vo.ProductVO;

public class ProductDAO {

	private static ProductDAO pDAO;
	private String configPath;

	private ProductDAO() {
		configPath = "kr/co/sist/common/dao/mybatis-config.xml";
	}

	public static ProductDAO getInstance() {
		if (pDAO == null) {
			pDAO = new ProductDAO();
		} // end if
		return pDAO;
	}// getInstance

	/**
	 * pcode 생성
	 * 
	 * @return
	 */
	public String sellectPrdPcode() {
		String pcode = "";

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			pcode = ss.selectOne("user.product.createPcode");
		} finally {
			mbh.closeHandler(ss);
		} // finally

		return pcode;
	}//sellectPrdPcode

	/**
	 * 판매자가 보는 자기 자신의 상품 상세 페이지인지, 
	 * 구매자가 보는 상품 상세 페이지인지를 구별하기 위함
	 * => 누가 보는 상품 상세 페이지인지에 따라 페이지가 다르게 보여짐
	 * 
	 * @param pVO
	 * @return
	 * @throws PersistenceException
	 */
	public int searchCheck(ProductVO pVO) throws PersistenceException {
		int cnt = 0;
		
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(false);
		cnt = ss.selectOne("user.product.selectCheck",pVO);
		
		return cnt;
	}//searchCheck
	
	/**
	 * 상품 등록
	 * 
	 * @return
	 * @throws PersistenceException
	 */
	public int insertProduct(ProductVO pVO) throws PersistenceException {
		int insertCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			insertCnt = ss.insert("user.product.insertProduct", pVO);

			if (insertCnt == 1) {
				ss.commit();
			} else {
				ss.rollback();
			} // end else
		} finally {
			mbh.closeHandler(ss);
		} // finally
		return insertCnt;
	}// selectCategory

	/**
	 * 상품 조회
	 * 
	 * @param pVO
	 * @return
	 * @throws PersistenceException
	 */
	public ProductDomain selectProduct(ProductVO pVO) throws PersistenceException {
		ProductDomain search = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		search = ss.selectOne("user.product.selectProduct", pVO);

		mbh.closeHandler(ss);

		return search;
	}// selectProduct

	/**
	 * 상품 수정
	 * @param pVO
	 * @return
	 * @throws PersistenceException
	 */
	public int updateProduct(ProductVO pVO) throws PersistenceException {

		int updateCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			updateCnt = ss.update("user.product.updateProduct", pVO);
			if (updateCnt == 1) {
				ss.commit();
			} else {
				ss.rollback();
			} // end else
		} finally {
			mbh.closeHandler(ss);
		} // finally

		return updateCnt;
	}// updateProduct

	/**
	 * 상품 판매 완료 처리
	 * 
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */
	public int updateSaleok(String pcode) throws PersistenceException {

		int updateSaleCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			updateSaleCnt = ss.update("user.product.updateSaleOk", pcode);
			if (updateSaleCnt == 1) {
				ss.commit();
			} else {
				ss.rollback();
			} // end else
		} finally {
			mbh.closeHandler(ss);
		} // finally

		return updateSaleCnt;
	}// updateSaleok

	/**
	 * 상품 삭제
	 * 
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */
	public int deleteProduct(String pcode) throws PersistenceException {
		int deleteCnt = 0;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		try {
			deleteCnt = ss.delete("user.product.deleteProduct", pcode);
			if (deleteCnt == 1) {
				ss.commit();
			} else {
				ss.rollback();
			} // end else
		} finally {
			mbh.closeHandler(ss);
		} // end finally
		return deleteCnt;
	}// deleteProduct

	/**
	 * 상품에 대해서 채팅 온 사람들의 정보 조회
	 * => 거래한 상대를 선택하고 판매 후기를 작성하기 위함
	 * 
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */
	public List<MySalesDomain> selectBuyerAllInfo(String pcode) throws PersistenceException {

		List<MySalesDomain> selectInfo = null;

		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		selectInfo = ss.selectList("user.product.selectBuyerAllInfo", pcode);

		mbh.closeHandler(ss);

		return selectInfo;

	}// selectBuyerAllInfo

	/**
	 * 상품에 대해 관심상품 등록한 횟수
	 * 
	 * @param pcode
	 * @return
	 * @throws PersistenceException
	 */
	public int selectWishCnt(String pcode) throws PersistenceException {
		int wishCnt = 0;
		MybatisHandler mbh = MybatisHandler.getInstance();
		SqlSession ss = mbh.getMyBatisHandler(configPath, false);
		wishCnt = ss.selectOne("user.product.selectWishCnt", pcode);

		mbh.closeHandler(ss);

		return wishCnt;
	}// selectWishCnt

}// class
