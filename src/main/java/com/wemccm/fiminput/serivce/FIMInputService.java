package com.wemccm.fiminput.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.entity.FIMinputSubType;
import com.wemccm.common.entity.FIMinputType;
import com.wemccm.common.pojo.FIMinputItermPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypePojo;
import com.wemccm.common.pojo.FIMinputSubTypePojo;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.fiminput.dao.FIMInputDao;

@Service
public class FIMInputService {

	@Autowired
	private FIMInputDao Dao;

//	public void insertProjectNonContestableProjectComponent(List<ProjectNonContestableProjectComponent> list) {
//		for(int i=0;i<list.size();i++) {
//			Dao.insertProjectNonContestableProjectComponent(list.get(i));
//		}
//		
//	}

	public List<FIMinputType> selectAllFIMinputType() {
		List<FIMinputType> l = Dao.selectAllFIMinputType();

		return l;
	}

	public List<FIMinputSubType> findFIMinputSubType(FIMinputSubTypePojo requestPojo) {
		List<FIMinputSubType> l = Dao.findFIMinputSubType(requestPojo);

		return l;
	}

//	public List<FIMinputItermQuantityType> selectAllFIMinputItermQuantityType() {
//		List<FIMinputItermQuantityType> l = Dao.selectAllFIMinputItermQuantityType();
//
//		return l;
//	}

	public void insertFIMinputItermQuantity(List<FIMinputItermQuantityPojo> pojoList) {

		for (FIMinputItermQuantityPojo pojo : pojoList) {
			Dao.insertFIMinputItermQuantity(pojo);
		}

	}

	public List<FIMinputIterm> findFIMinputIterm(FIMinputItermPojo requestPojo) {
		List<FIMinputIterm> l = Dao.findFIMinputIterm(requestPojo);

		return l;
	}

	public String insertFIMinputIterm(FIMinputIterm pojo) {
		
		FIMinputIterm f = Dao.getByfIMinputSubTypeID(pojo.getfIMinputSubTypeID());

		if (null != f) {
			return "-1";
		}

		Dao.insertFIMinputIterm(pojo);

		return "00";
		
		
		
		
	}

	public void deleteFIMinputIterm(IdPojo requestPojo) {
		Dao.deleteFIMinputIterm(requestPojo);
		
	}

	public List<FIMinputItermSubTypeTypePojo> listAllFIMinputIterm(Integer projectId) {
		List<FIMinputItermSubTypeTypePojo> l = Dao.listAllFIMinputIterm(projectId);

		return l;
	}

//	public void insertFIMinputIterm(List<FIMinputIterm> pojoList) {
//		for (FIMinputIterm pojo : pojoList) {
//			Dao.insertFIMinputIterm(pojo);
//		}
//	}

}
