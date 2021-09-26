package com.wemccm.quantityinput.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.QuantityInputBasicData;
import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.QIDataPojo;
import com.wemccm.common.pojo.QuantityInputDetailPojo;
import com.wemccm.common.pojo.QuantityInputItermGroupIdPojo;
import com.wemccm.common.pojo.QuantityInputPojo;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.quantityinput.dao.QuantityInputDao;

@Service
public class QuantityInputService {

	@Autowired
	private QuantityInputDao Dao;

	public List<QuantityInputItermGroup> selectAllQuantityInputItermGroup() {
		List<QuantityInputItermGroup> l = Dao.selectAllQuantityInputItermGroup();

		return l;
	}

	public List<QuantityInputBasicData> findQuantityInputBasicData(QuantityInputItermGroupIdPojo requestPojo) {
		List<QuantityInputBasicData> l = Dao.findQuantityInputBasicData(requestPojo);

		return l;
	}

	public void insertQuantityInputBasicData(QuantityInputBasicData data) {
		Dao.insertQuantityInputBasicData(data);
		
	}

//	public List<QuantityInputItermType> selectAllQuantityInputItermType() {
//		List<QuantityInputItermType> l = Dao.selectAllQuantityInputItermType();
//
//		return l;
//	}

//	public List<QuantityInputItermType> findQuantityInputItermType(QuantityInputItermTypePojo requestPojo) {
//		List<QuantityInputItermType> l = Dao.findQuantityInputItermType(requestPojo);
//
//		return l;
//	}
//List<QuantityInputDetailPojo> l = serivce.findQuantityInputDetail(requestPojo);
	


//	public void insertQuantityInput(List<QuantityInputPojo> list) {
//		for (int i = 0; i < list.size(); i++) {
//			Dao.insertQuantityInput(list.get(i));
//
//		}
//	}
//
//	public List<QuantityInputIterm> findQuantityInputIterm(QuantityInputItermTypeIdPojo requestPojo) {
//		List<QuantityInputIterm> l = Dao.findQuantityInputIterm(requestPojo);
//
//		return l;
//	}

	public void insertQuantityInput(List<QuantityInputPojo> list) {
		for (int i = 0; i < list.size(); i++) {
		Dao.insertQuantityInput(list.get(i));

	}
	}
	
	
	
	
	public List<QuantityInputDetailPojo> findQuantityInputDetail(projectIdPojo requestPojo) {
		List<QuantityInputDetailPojo> l = Dao.findQuantityInputDetail(requestPojo);


		return l;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
