package com.wemccm.fiminput.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.entity.FIMinputItermQuantityType;
import com.wemccm.common.entity.FIMinputSubType;
import com.wemccm.common.entity.FIMinputType;
import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.FIMinputItermPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityPojo;
import com.wemccm.common.pojo.FIMinputSubTypePojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.fiminput.dao.FIMInputDao;
import com.wemccm.noncontestable.dao.NonContestableDao;

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
List<FIMinputType> l=Dao.selectAllFIMinputType();

		
		return l;
	}





	public List<FIMinputSubType> findFIMinputSubType(FIMinputSubTypePojo requestPojo) {
		List<FIMinputSubType> l=Dao.findFIMinputSubType(requestPojo);

		
		return l;
	}





	public List<FIMinputItermQuantityType> selectAllFIMinputItermQuantityType() {
List<FIMinputItermQuantityType> l=Dao.selectAllFIMinputItermQuantityType();

		
		return l;
	}





	public void insertFIMinputItermQuantity(FIMinputItermQuantityPojo requestPojo) {
		Dao.insertFIMinputItermQuantity(requestPojo);
		
	}





	public List<FIMinputIterm> findFIMinputIterm(FIMinputItermPojo requestPojo) {
List<FIMinputIterm> l=Dao.findFIMinputIterm(requestPojo);

		
		return l;
	}




	
}
