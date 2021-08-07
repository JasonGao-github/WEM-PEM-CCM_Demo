package com.wemccm.demo.service;

import com.wemccm.common.entity.DemoEntity;

public interface DemoService {

	DemoEntity selectUserById(Integer userId);

}
