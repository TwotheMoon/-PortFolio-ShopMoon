package org.shopmoon.mapper;

import java.util.List;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;

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
	
	// 이미지 등록
	public void imageEnroll(AttachImageVO vo);
	
	// 상품 수정시 이미지 전체 삭제
	public void deleteImgAll(Long productNo);
	
	// 배치) 어제 날짜 이미지 리스트
	public List<AttachImageVO> checkFileList();
	
	// 지정 상품 이미지 정보 가져오기
	public List<AttachImageVO> getAttachInfo(Long productNo);
}
