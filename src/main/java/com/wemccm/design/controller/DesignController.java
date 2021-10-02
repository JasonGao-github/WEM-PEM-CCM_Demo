package com.wemccm.design.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.Design;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.design.service.DesignService;

@RestController
public class DesignController {

	@Autowired
	private DesignService serivce;

	
	@RequestMapping(value = "/findWBSElement", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Integer findWBSElement(@RequestBody projectIdPojo requestPojo) {
		// find by fIMinputTypeID

		Integer l = serivce.findWBSElement(requestPojo);
		return l;
	}
	
	
//	@RequestMapping(value = "/listAllFIMinputType", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public List<FIMinputType> selectAllFIMinputType() {
//
//		List<FIMinputType> l = serivce.selectAllFIMinputType();
//		return l;
//	}




	@RequestMapping(value = "/insertDesign", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertDesign(@RequestBody Design Pojo) {
		System.out.println(Pojo.getwBSElement());
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);
		serivce.insertDesign(Pojo);
		return new ResponseResult();
	}



}
