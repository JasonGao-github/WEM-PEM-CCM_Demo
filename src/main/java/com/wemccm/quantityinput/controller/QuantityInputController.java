package com.wemccm.quantityinput.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.QuantityInputItermType;
import com.wemccm.common.pojo.QuantityInputBasicDataListPojo;
import com.wemccm.common.pojo.QuantityInputItermPojo;
import com.wemccm.common.pojo.QuantityInputItermTypePojo;
import com.wemccm.common.pojo.ThreeQuantityInputItermTable;
import com.wemccm.quantityinput.service.QuantityInputService;

@RestController
public class QuantityInputController {


	
	@Autowired
	private QuantityInputService serivce;

	@RequestMapping(value = "/selectAllQuantityInputItermType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputItermType> selectAllQuantityInputItermType() {

		List<QuantityInputItermType> l=serivce.selectAllQuantityInputItermType();
		return l;
	}
	

	@RequestMapping(value = "/findQuantityInputItermType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputItermType> findQuantityInputItermType(@RequestBody QuantityInputItermTypePojo requestPojo) {

		
		List<QuantityInputItermType> l= serivce.findQuantityInputItermType(requestPojo);
		return l;
	}
	
	@RequestMapping(value = "/threeQuantityInputItermTable", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<QuantityInputBasicDataListPojo> threeQuantityInputItermTable(@RequestBody QuantityInputItermPojo requestPojo) {

		
		List<QuantityInputBasicDataListPojo> l= serivce.threeQuantityInputItermTable(requestPojo);
		return l;
	}
	
	

}
