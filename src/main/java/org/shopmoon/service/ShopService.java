package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.CartVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;

public interface ShopService {

	// shop 관련 상품 상세 페이지
	public ProductVO shopGetDetail(Long productNo) throws Exception;
	
	// 기타 리스트
	public List<ProductVO> guitarGetList(Criteria cri) throws Exception;
	
	// 기타 총 개수
	public int guitarGetTotal(Criteria cri) throws Exception;
	
	// 베이스 리스트
	public List<ProductVO> bassGetList(Criteria cri) throws Exception;
	
	// 베이스 총 개수
	public int bassGetTotal(Criteria cri) throws Exception;

	// 미디 리스트
	public List<ProductVO> midiGetList(Criteria cri) throws Exception;
	
	// 미디 총 개수
	public int midiGetTotal(Criteria cri) throws Exception;
	
	// 앨범 리스트
	public List<ProductVO> albumGetList(Criteria cri) throws Exception;
	
	// 앨범 총 개수
	public int albumGetTotal(Criteria cri) throws Exception;
	
	// 장바구니 등록
	public void cartEnroll(CartVO cart) throws Exception;
}
