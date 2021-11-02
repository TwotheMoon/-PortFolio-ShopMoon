package org.shopmoon.mapper;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;
import org.springframework.web.bind.annotation.PathVariable;

public interface AdminMapper {

	// 상품 등록
	public void productEnroll(ProductVO product);

	// 상품 리스트
	public List<ProductVO> productGetList(Criteria cri);
	
	// 상품 총 개수
	public int productGetTotal(Criteria cri);
	
	// 상품 조회 상세 페이지
	public ProductVO productGetDetail(Long productNo);
	
	// 상품 정보 수정
	public int productModify(ProductVO product);
	
	// 상품 삭제
	public int productDelete(Long productNo);
}