package com.wemccm.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.Notice;
import com.wemccm.common.pojo.NoticePojo;
import com.wemccm.notice.dao.NoticeDao;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao Dao;




	public String createNotice(NoticePojo requestPojo) {
		Dao.createNotice(requestPojo);
		
		// TODO Auto-generated method stub
		return "00";
	}

	public List<Notice> findNotice(NoticePojo requestPojo) {
		List<Notice> n = Dao.getNotice(requestPojo);
		return n;
	}

	
}
