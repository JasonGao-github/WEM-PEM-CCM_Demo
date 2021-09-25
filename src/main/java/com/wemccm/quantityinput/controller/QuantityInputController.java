package com.wemccm.quantityinput.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.QuantityInputIterm;
import com.wemccm.common.entity.QuantityInputItermType;
import com.wemccm.common.pojo.QuantityInputBasicDataListPojo;
import com.wemccm.common.pojo.QuantityInputItermPojo;
import com.wemccm.common.pojo.QuantityInputItermTypeIdPojo;
import com.wemccm.common.pojo.QuantityInputItermTypePojo;
import com.wemccm.common.pojo.QuantityInputPojo;
import com.wemccm.quantityinput.service.QuantityInputService;

@RestController
public class QuantityInputController {

	//
	@Autowired
	private QuantityInputService serivce;

	// list all groups
	@RequestMapping(value = "/selectAllQuantityInputItermType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputItermType> selectAllQuantityInputItermType() {

		List<QuantityInputItermType> l = serivce.selectAllQuantityInputItermType();
		return l;
	}

	// insert
	@RequestMapping(value = "/insertQuantityInput", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertQuantityInput(@RequestBody List<QuantityInputPojo> list) {
		// insert table avoidedcostassetreplacementcosts
		serivce.insertQuantityInput(list);
		return "success";
	}

	// list all iterm in one group.
	@RequestMapping(value = "/findQuantityInputIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputIterm> findQuantityInputIterm(@RequestBody QuantityInputItermTypeIdPojo requestPojo) {
		// get by any attribute input (one or many)

		List<QuantityInputIterm> l = serivce.findQuantityInputIterm(requestPojo);
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

	@RequestMapping(value = "/findMuliQuantityInputTable", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputBasicDataListPojo> findMuliQuantityInputTable(
			@RequestBody QuantityInputItermPojo requestPojo) {
		// find by quantityInputItermTypeId
		// form table
		// quantityinputiterm,quantityinputitermsubtypeprice,quantityinputsubtype

		List<QuantityInputBasicDataListPojo> l = serivce.findMuliQuantityInputTable(requestPojo);
		return l;
	}

}
