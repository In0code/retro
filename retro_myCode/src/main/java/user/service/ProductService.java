package kr.co.sist.user.service;
//인영 - 사용자 : 상품 Service
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import kr.co.sist.user.dao.ProductDAO;
import kr.co.sist.user.domain.MySalesDomain;
import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.vo.GoodsVO;
import kr.co.sist.user.vo.ProductVO;

public class ProductService {

    private ProductDAO pDAO = ProductDAO.getInstance();
    private static ProductService ps;

    private ProductService() {

    }

    public static ProductService getInstance() {
        if (ps == null) {
            ps = new ProductService();
        }
        return ps;
    }//getInstance
    
    public String pcode() {
    	String pcode="";
    	
    	try {
			pcode=pDAO.sellectPrdPcode();
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
    	
    	return pcode;
    }//pcode

    /**
     * 상품 등록
     * 
     * @param pVO
     */
    public int addProduct(ProductVO pVO){
		int insertCnt= 0;
		try {
			insertCnt=pDAO.insertProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return insertCnt;
	}//searchCategory
    
    
    
    /**
     * 관심상품 등록 수
     * 
     * @param pcode
     * @return
     */
    public int searchWishCnt(String pcode) {
    	int wishCnt=0;
    	try {
    		wishCnt=pDAO.selectWishCnt(pcode);
    	} catch (PersistenceException pe) {
    		pe.printStackTrace();
    	}//end catch
    	return wishCnt;
    }//searchWishCnt
    
    /**
     * 판매자와 구매자를 구별하여 상세 페이지를 보여줌
     * 
     * @param pVO
     * @return
     */
    public int searchCheck(ProductVO pVO) {
		int cnt = 0;
		
		try {
			cnt = pDAO.searchCheck(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return cnt;
	}//searchCheck
    
    /**
     * 상품 조회
     * 
     * @param pVO
     * @return
     */
    public ProductDomain searchProduct(ProductVO pVO) {
    	ProductDomain search = null;
    	try {
    		search = pDAO.selectProduct(pVO);
    	} catch (PersistenceException pe) {
    		pe.printStackTrace();
        }//end catch
        return search;
    }//searchProduct

    /**
     * 상품 수정
     * 
     * @param pVO
     * @return
     */
    public int editProduct(ProductVO pVO) {
    	int editCnt= 0;
		try {
			editCnt=pDAO.updateProduct(pVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return editCnt;
    }//editProduct

    /**
     * 상품 판매 완료 처리
     * 
     * @param pcode
     * @return
     */
    public JSONObject editSaleok(String pcode) {
        JSONObject editSaleJsonObj = new JSONObject();
        editSaleJsonObj.put("resultData", false);
        try {
            int updateCnt = pDAO.updateSaleok(pcode);
            editSaleJsonObj.put("resultData", true);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            editSaleJsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
        }//end catch
        return editSaleJsonObj;
    }//editSaleok

    /**
     * 상품 삭제
     * 
     * @param pcode
     * @return
     */
    public JSONObject cancelProduct(String pcode) {
        JSONObject deletejsonObj = new JSONObject();
        deletejsonObj.put("resultData", false);
        try {
            int deleteCnt = pDAO.deleteProduct(pcode);
            deletejsonObj.put("resultData", true);
        } catch (PersistenceException pe) {
            pe.printStackTrace();
            deletejsonObj.put("error", pe.getMessage()); // 예외 메시지 추가
        }//end catch
        return deletejsonObj;
    }//cancelProduct
    

	/**
	 * 상품에 대해서 채팅 온 사람들의 정보 조회
	 * 
	 * @param pcode
	 * @return
	 */
	public List<MySalesDomain> searchBuyerAllInfo(String pcode){
		 List<MySalesDomain> searchAllInfo=null;
		 try {
			 searchAllInfo = pDAO.selectBuyerAllInfo(pcode);
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			return searchAllInfo;
	}//searchBuyerAllInfo

}//class
