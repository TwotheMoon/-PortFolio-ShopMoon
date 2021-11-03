package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;
import org.springframework.web.bind.annotation.PathVariable;

public interface ShopService {

	// 기타 리스트
	public List<ProductVO> guitarGetList(Criteria cri) throws Exception;
	
	// 기타 총 개수
	public int guitarGetTotal(Criteria cri) throws Exception;
	
	// 기타 조회 상세 페이지
	public ProductVO guitarGetDetail(Long productNo) throws Exception;
	
}
