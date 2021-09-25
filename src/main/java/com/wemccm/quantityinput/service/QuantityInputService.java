package com.wemccm.quantityinput.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.quantityinput.dao.QuantityInputDao;

@Service
public class QuantityInputService {

	@Autowired
	private QuantityInputDao Dao;

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
//
//	public List<QuantityInputBasicDataListPojo> findMuliQuantityInputTable(QuantityInputItermPojo requestPojo) {
//		List<QuantityInputBasicDataListPojo> l = Dao.findTableI(requestPojo);
//		for (int i = 0; i < l.size(); i++) {
//			List<QuantityInputItermDetailPojo> details = Dao.findTableSTPAndST(l.get(i).getId());
//			l.get(i).setDetails(details);
//		}
//
//		return l;
//	}
//
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

}
