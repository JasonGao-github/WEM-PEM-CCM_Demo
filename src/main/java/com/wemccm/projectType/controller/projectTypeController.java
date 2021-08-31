package com.wemccm.projectType.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.ProjectType;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectTypePojo;
import com.wemccm.projectType.service.projectTypeService;

@RestController
public class projectTypeController {
	@Autowired
	private projectTypeService serivce;

	@RequestMapping(value = "/projectType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<ProjectType> sendMyName(@RequestBody projectTypePojo requestPojo) {
//
//		int id = requestPojo.getId();
//		String description = requestPojo.getDescription();
//		String name = requestPojo.getName();

		List<ProjectType> list=serivce.projectType(requestPojo);

		return list;
	}
}
