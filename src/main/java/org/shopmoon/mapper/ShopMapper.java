package org.shopmoon.mapper;

import java.util.List;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;
import org.springframework.web.bind.annotation.PathVariable;

public interface ShopMapper {

	// 상품 리스트
	public List<ProductVO> guitarGetList(Criteria cri);
	
	// 기타 총 개수
	public int guitarGetTotal(Criteria cri);
	
	// 기타 조회 상세 페이지
	public ProductVO guitarGetDetail(Long productNo);
	
}
