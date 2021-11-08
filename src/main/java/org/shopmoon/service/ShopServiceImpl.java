package org.shopmoon.service;


import java.util.List;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.domain.CartVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;
import org.shopmoon.mapper.AdminMapper;
import org.shopmoon.mapper.AttachMapper;
import org.shopmoon.mapper.ShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopMapper shopmapper;
	
	@Autowired
	AttachMapper attachmapper;
	
	// shop 관련 상품 상세 페이지
		@Override
		public ProductVO shopGetDetail(Long productNo) throws Exception {

			return shopmapper.shopGetDetail(productNo);
		}
	
	
	// 기타 리스트
	@Override
	public List<ProductVO> guitarGetList(Criteria cri) throws Exception {

		List<ProductVO> list = shopmapper.guitarGetList(cri);
		
		list.forEach(product -> {
			
			Long productNo = product.getProductNo();
			
			List<AttachImageVO> imageList = attachmapper.getAttachList(productNo);
			
			product.setImageList(imageList);
			
		});
		
		return list;
	}
	
	// 기타 총 개수
	@Override
	public int guitarGetTotal(Criteria cri) throws Exception {

		return shopmapper.guitarGetTotal(cri);
	}
	
	// 베이스 리스트
	@Override
	public List<ProductVO> bassGetList(Criteria cri) throws Exception {
	
		List<ProductVO> list = shopmapper.bassGetList(cri);
			
			list.forEach(product -> {
				
				Long productNo = product.getProductNo();
				
				List<AttachImageVO> imageList = attachmapper.getAttachList(productNo);
				
				product.setImageList(imageList);
				
			});
		
		return list;
	}
	
	// 베이스 총 개수
	@Override
	public int bassGetTotal(Criteria cri) throws Exception {
		
		return shopmapper.bassGetTotal(cri);
	}
	
	// 미디 리스트
	@Override
	public List<ProductVO> midiGetList(Criteria cri) throws Exception {
	
		List<ProductVO> list = shopmapper.midiGetList(cri);
			
			list.forEach(product -> {
				
				Long productNo = product.getProductNo();
				
				List<AttachImageVO> imageList = attachmapper.getAttachList(productNo);
				
				product.setImageList(imageList);
				
			});
		
		return list;
	}
	
	// 미디 총 개수
	@Override
	public int midiGetTotal(Criteria cri) throws Exception {
		
		return shopmapper.midiGetTotal(cri);
	}
	
	// 앨범 리스트
	@Override
	public List<ProductVO> albumGetList(Criteria cri) throws Exception {
	
		List<ProductVO> list = shopmapper.albumGetList(cri);
			
			list.forEach(product -> {
				
				Long productNo = product.getProductNo();
				
				List<AttachImageVO> imageList = attachmapper.getAttachList(productNo);
				
				product.setImageList(imageList);
				
			});
		
		return list;
	}
	
	// 앨범 총 개수
	@Override
	public int albumGetTotal(Criteria cri) throws Exception {
		
		return shopmapper.albumGetTotal(cri);
	}
	
	// 장바구니 등록
	@Override
	public void cartEnroll(CartVO cart) throws Exception {

		shopmapper.cartEnroll(cart);
	}
	
	
}
