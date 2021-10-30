package org.shopmoon.service;


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
	public void productEnroll(ProductVO product) {
		
		log.info("상품 등록 서비스 작동");
		adminmapper.productEnroll(product);
	}
	

}
