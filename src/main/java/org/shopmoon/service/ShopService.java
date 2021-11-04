package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;

public interface ShopService {

	// shop 관련 상품 상세 페이지
	public ProductVO shopGetDetail(Long productNo) throws Exception;

	// 기타 리스트
	public List<ProductVO> guitarGetList(Criteria cri) throws Exception;
	
	// 기타 총 개수
	public int guitarGetTotal(Criteria cri) throws Exception;
	
	// 기타 리스트
	public List<ProductVO> baseGetList(Criteria cri) throws Exception;
	
	// 기타 총 개수
	public int baseGetTotal(Criteria cri) throws Exception;
	
	
}
