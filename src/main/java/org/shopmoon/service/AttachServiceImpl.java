package org.shopmoon.service;

import java.util.List;

import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.mapper.AttachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AttachServiceImpl implements AttachService {

	@Autowired
	AttachMapper attachmapper;
	
	// 이미지 데이터 반환
	@Override
	public List<AttachImageVO> getAttachList(Long productNo) {
		
		log.info("getAttachList...");	
		
		return attachmapper.getAttachList(productNo);
	}
}
