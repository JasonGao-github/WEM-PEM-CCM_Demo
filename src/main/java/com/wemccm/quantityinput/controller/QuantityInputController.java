package com.wemccm.quantityinput.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.entity.QuantityInputBasicData;
import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.common.pojo.QuantityInputBasicDataGroupPojo;
import com.wemccm.common.pojo.QuantityInputDetailPojo;
import com.wemccm.common.pojo.QuantityInputItermGroupIdPojo;
import com.wemccm.common.pojo.QuantityInputPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.quantityinput.service.QuantityInputService;

@RestController
public class QuantityInputController {

	//
	@Autowired
	private QuantityInputService serivce;

	// list all groups
	@RequestMapping(value = "/selectAllQuantityInputItermGroup", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputItermGroup> selectAllQuantityInputItermGroup() {

		List<QuantityInputItermGroup> l = serivce.selectAllQuantityInputItermGroup();
		return l;
	}

	@RequestMapping(value = "/insertQuantityInputBasicData", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertQuantityInputBasicData(@RequestBody QuantityInputBasicData data) {
		// insert table avoidedcostassetreplacementcosts
		String result = serivce.insertQuantityInputBasicData(data);
		if ("-1".equals(result)) {
			return new ResponseResult("false", "the code has already exist in our system!");
		}
		return new ResponseResult();
	}
	
	
	
	@RequestMapping(value = "/listAllQuantityInputBasicData", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputBasicDataGroupPojo> listAllQuantityInputBasicData() {
		Integer projectId=123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		projectId=(int) session.getAttribute("projectId");

		List<QuantityInputBasicDataGroupPojo> l = serivce.listAllQuantityInputBasicData(projectId);
		return l;
	}
	@RequestMapping(value = "/updateQuantityInputBasicData", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult updateQuantityInputBasicData(
			@RequestBody QuantityInputBasicDataGroupPojo requestPojo) {


		 serivce.updateQuantityInputBasicData(requestPojo);
		return new ResponseResult();
	}
	@RequestMapping(value = "/deleteQuantityInputBasicData", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult deleteQuantityInputBasicData(
			@RequestBody IdPojo requestPojo) {
		// find by nonContestableTypeId

		 serivce.deleteQuantityInputBasicData(requestPojo);
		return new ResponseResult();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// insert
	@RequestMapping(value = "/insertQuantityInput", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertQuantityInput(@RequestBody List<QuantityInputPojo> list) {
		// insert table avoidedcostassetreplacementcosts
		serivce.insertQuantityInput(list);
		return new ResponseResult();
	}

	@RequestMapping(value = "/findQuantityInputBasicData", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputBasicData> findQuantityInputBasicData(
			@RequestBody QuantityInputItermGroupIdPojo requestPojo) {
		// get by any attribute input (one or many)

		List<QuantityInputBasicData> l = serivce.findQuantityInputBasicData(requestPojo);
		return l;
	}

//	@RequestMapping(value = "/findQuantityInputItermType", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public List<QuantityInputItermType> findQuantityInputItermType(
//			@RequestBody QuantityInputItermTypePojo requestPojo) {
//		// get by any attribute input (one or many)
//
//		List<QuantityInputItermType> l = serivce.findQuantityInputItermType(requestPojo);
//		return l;
//	}

	@RequestMapping(value = "/findQuantityInputDetail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputDetailPojo> findQuantityInputDetail() {
		projectIdPojo requestPojo=new projectIdPojo();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		int projectId=(int) session.getAttribute("projectId");
		requestPojo.setProjectId(projectId);
		List<QuantityInputDetailPojo> l = serivce.findQuantityInputDetail(requestPojo);
		return l;
	}

}
