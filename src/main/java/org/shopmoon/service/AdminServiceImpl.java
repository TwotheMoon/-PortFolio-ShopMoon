package org.shopmoon.service;


import java.util.List;

import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;
import org.shopmoon.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper adminmapper;
	
	@Override
	public void productEnroll(ProductVO product) throws Exception{
		
		log.info("상품 등록 서비스 작동");
		adminmapper.productEnroll(product);
	}
	
	@Override
	public List<ProductVO> productGetList(Criteria cri) throws Exception {
		
		return adminmapper.productGetList(cri);
	}
	
	@Override
	public int productGetTotal(Criteria cri) throws Exception {
	
		return adminmapper.productGetTotal(cri);
	}

	@Override
	public ProductVO productGetDetail(Long productNo) throws Exception {
		
		return adminmapper.productGetDetail(productNo);
	}
	
	@Override
	public int productModify(ProductVO product) throws Exception {
		
		return adminmapper.productModify(product);
	}
}
