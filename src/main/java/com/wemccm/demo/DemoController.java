package com.wemccm.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

	@Autowired
	private DemoService service;

	@RequestMapping(value = "/findPage", produces = "application/json;charset=UTF-8")
	public Object findPage(@RequestBody DemoPageRequestDto dto) {

		// DemoPageRequestDto继承于PageRequest，包含两个分页需要的参数。
		// PageRequest可直接作为列表查询参数对象的基类。
		return service.findPage(dto);
	}

}
