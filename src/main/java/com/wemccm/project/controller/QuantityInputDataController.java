package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.QuantityInputGetdataPojo;
import com.wemccm.project.service.QuantityInputDataService;

@RestController
@RequestMapping("/quantity_input")
public class QuantityInputDataController {

	@Autowired
	private QuantityInputDataService qiService;

	@RequestMapping(value = "/getData", produces = "application/json;charset=UTF-8")
	public QuantityInputGetdataPojo getData() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		int projectId = Integer.valueOf((String) session.getAttribute("projectId"));

		String projectStatus = (String) session.getAttribute("projectStatus");

//		int projectId = 1;
//		String projectStatus = "exist";
		
		QuantityInputGetdataPojo resultPojo = qiService.getData(projectId, projectStatus);

		return resultPojo;

	}

}
