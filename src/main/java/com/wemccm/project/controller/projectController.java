package com.wemccm.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.page.FindPageRequestDto;
import com.wemccm.common.page.PageResult;
import com.wemccm.project.service.projectService;

@RestController 
public class projectController {

	@Autowired
	private projectService service;

	@RequestMapping(value = "/findPage", produces = "application/json;charset=UTF-8")
	public PageResult findPage(@RequestBody FindPageRequestDto dto) {

		// DemoPageRequestDto继承于PageRequest，包含两个分页需要的参数。
		// PageRequest可直接作为列表查询参数对象的基类。
		return service.findPage(dto);
	}

}
