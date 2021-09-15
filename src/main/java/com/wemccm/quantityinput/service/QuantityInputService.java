package com.wemccm.quantityinput.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wemccm.common.entity.QuantityInputItermType;
import com.wemccm.common.pojo.QuantityInputBasicDataListPojo;
import com.wemccm.common.pojo.QuantityInputItermDetailPojo;
import com.wemccm.common.pojo.QuantityInputItermPojo;
import com.wemccm.common.pojo.QuantityInputItermTypePojo;
import com.wemccm.common.pojo.ThreeQuantityInputItermTable;
import com.wemccm.quantityinput.dao.QuantityInputDao;

@Service
public class QuantityInputService {

	@Autowired
	private QuantityInputDao Dao;



	public List<QuantityInputItermType> selectAllQuantityInputItermType() {
		List<QuantityInputItermType> l=Dao.selectAllQuantityInputItermType();

		
		return l;
	}

	public List<QuantityInputItermType> findQuantityInputItermType(QuantityInputItermTypePojo requestPojo) {
		List<QuantityInputItermType> l=Dao.findQuantityInputItermType(requestPojo);

		
		return l;
	}

	public List<QuantityInputBasicDataListPojo> threeQuantityInputItermTable(QuantityInputItermPojo requestPojo) {
		List<QuantityInputBasicDataListPojo> l=Dao.findTableI(requestPojo);
		for(int i=0;i<l.size();i++) {
			List<QuantityInputItermDetailPojo> details=Dao.findTableSTPAndST(l.get(i).getId());
			l.get(i).setDetails(details); 
		}
		

		
		return l;
	}



	
}
