package org.shopmoon.mapper;

import java.util.List;

import org.shopmoon.domain.AttachImageVO;

public interface AttachMapper {

	
	// 이미지 데이터 반환
	public List<AttachImageVO> getAttachList(Long productNo);
}
