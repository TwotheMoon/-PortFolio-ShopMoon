package org.shopmoon.mapper;

import java.util.List;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.CartVO;
import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;
import org.springframework.web.bind.annotation.PathVariable;

public interface ShopMapper {

	// shop 관련 상품 상세 페이지
	public ProductVO shopGetDetail(Long productNo);
	
	// 기타 리스트
	public List<ProductVO> guitarGetList(Criteria cri);
	
	// 기타 총 개수
	public int guitarGetTotal(Criteria cri);	
	
	// 베이스 리스트
	public List<ProductVO> bassGetList(Criteria cri);
		
	// 베이스 총 개수
	public int bassGetTotal(Criteria cri);
	
	// 미디 리스트
	public List<ProductVO> midiGetList(Criteria cri);
		
	// 미디 총 개수
	public int midiGetTotal(Criteria cri);
	
	// 앨범 리스트
	public List<ProductVO> albumGetList(Criteria cri);
		
	// 앨범 총 개수
	public int albumGetTotal(Criteria cri);
	
	// 장바구니 등록
	public void cartEnroll(CartVO cart);
	
		
}
