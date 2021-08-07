package com.wemccm.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.DemoEntity;
import com.wemccm.demo.dao.DemoDao;

@Service
public class DemoServiceImpl implements DemoService {

	@Autowired
	private DemoDao userDao;

	@Override
	public DemoEntity selectUserById(Integer userId) {
		return userDao.selectUserById(userId);
	}

}
