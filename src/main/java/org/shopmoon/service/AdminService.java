package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.ContactVO;
import org.shopmoon.domain.Criteria;
import org.shopmoon.domain.ProductVO;

public interface AdminService {

	// 상품 등록
	public void productEnroll(ProductVO product);
}
