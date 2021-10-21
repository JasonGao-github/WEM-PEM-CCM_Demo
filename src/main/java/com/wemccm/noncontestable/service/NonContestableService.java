package com.wemccm.noncontestable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.common.pojo.NccItemsAndProjectIdPojo;
import com.wemccm.common.pojo.NccItemsPojo;
import com.wemccm.common.pojo.NccProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemTypePojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentTypePojo;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.noncontestable.dao.NonContestableDao;

@Service
public class NonContestableService {

	@Autowired
	private NonContestableDao Dao;

	public List<NonContestableProjectComponent> findNonContestableProjectComponent(
			NonContestableProjectComponentPojo requestPojo) {

		List<NonContestableProjectComponent> l = Dao.findNonContestableProjectComponent(requestPojo);

		return l;
	}

	public List<NonContestableType> selectAllNonContestableType() {
		List<NonContestableType> l = Dao.selectAllNonContestableType();

		return l;
	}

	public List<NonContestableOtherCostsItem> findNonContestableOtherCostsItem(
			NonContestableOtherCostsItemPojo requestPojo) {
		List<NonContestableOtherCostsItem> l = Dao.findNonContestableOtherCostsItem(requestPojo);

		return l;
	}

	public void insertProjectNonContestableProjectComponent(List<ProjectNonContestableProjectComponent> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertProjectNonContestableProjectComponent(list.get(i));
		}

	}

	public void insertNonContestableOtherCosts(List<NonContestableOtherCosts> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertNonContestableOtherCosts(list.get(i));
		}
	}

	public List<NccProjectComponentPojo> findMultiNonContestableProjectComponent(projectIdPojo requestPojo) {

		List<NccProjectComponentPojo> l = Dao.findMultiNonContestableProjectComponent(requestPojo);

		return l;
	}

	public List<NccItemsPojo> findMultiNonContestableOtherCosts(NccItemsAndProjectIdPojo requestPojo) {
		List<NccItemsPojo> l = Dao.findMultiNonContestableOtherCosts(requestPojo);

		return l;
	}

	public String insertNonContestableProjectComponent(NonContestableProjectComponent ncpc) {

		NonContestableProjectComponent temp = Dao.getNonContestableProjectComponentByDescription(ncpc.getDescription());
		if (null != temp) {
			return "-1";
		}
		Dao.insertNonContestableProjectComponent(ncpc);

		return "00";

	}

	public String insertNonContestableOtherCostsItem(NonContestableOtherCostsItem ncoci) {

		NonContestableOtherCostsItem temp = Dao.getNonContestableOtherCostsItemByDescription(ncoci.getDescription());

		if (null != temp) {
			return "-1";
		}
		Dao.insertNonContestableOtherCostsItem(ncoci);

		return "00";

	}
	
	
	
	

//	public List<NonContestableOtherCostsItemTypePojo> listAllNonContestableOtherCostsIterm(Integer projectId) {
//		List<NonContestableOtherCostsItemTypePojo> l = Dao.listAllNonContestableOtherCostsIterm(projectId);
//
//		return l;
//	}

	public void deleteNonContestableOtherCostsIterm(IdPojo requestPojo) {
		Dao.deleteNonContestableOtherCostsIterm(requestPojo);
		
	}
	
	
//	public void updateNonContestableOtherCostsIterm(NonContestableOtherCostsItemTypePojo requestPojo) {
////		IdPojo  pojo=new IdPojo();
////		pojo.setId(requestPojo.getId());
////		Dao.deleteNonContestableOtherCostsIterm(pojo);
//		
//		Dao.updateNonContestableOtherCostsIterm(requestPojo);
//		
//		
//		
//		
//		
//	}
	
	
	
	
	
	
	
	
	public void deleteNonContestableProjectComponent(IdPojo requestPojo) {
		Dao.deleteNonContestableProjectComponent(requestPojo);
		
	}

//	public List<NonContestableProjectComponentTypePojo> listAllNonContestableProjectComponent(Integer projectId) {
//		List<NonContestableProjectComponentTypePojo> l = Dao.listAllNonContestableProjectComponent(projectId);
//
//		return l;
//	}
//
//	public void updateNonContestableProjectComponent(NonContestableProjectComponentTypePojo requestPojo) {
//		Dao.updateNonContestableProjectComponent(requestPojo);
//		
//	}


	
	
	
	
	
	
	
	
	
	
	
	
	

}
