package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.AllNonContestableOtherCostsPojo;
import com.wemccm.common.pojo.AllNonContestableProjectComponentPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypePojo;
import com.wemccm.common.pojo.NonContestableOtherCostsDataPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemTypeDataPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemTypePojo;
import com.wemccm.common.pojo.NonContestableProjectComponentTypeDataPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentTypePojo;
import com.wemccm.common.pojo.ProjectNonContestableProjectComponentData;
import com.wemccm.fiminput.dao.FIMInputDao;
import com.wemccm.noncontestable.dao.NonContestableDao;

	@Service
	public class NonContestableDataService {

		@Autowired
		private NonContestableDao dao;

		public NonContestableOtherCostsItemTypeDataPojo getDataNonContestableOtherCostsIterm(Integer projectId, String projectStatus) {

			NonContestableOtherCostsItemTypeDataPojo result = new NonContestableOtherCostsItemTypeDataPojo();
			result.setMassage("");
			result.setResult("success");
			result.setProjectStatus(projectStatus);

			
			List<AllNonContestableOtherCostsPojo> projectDataList = new ArrayList<AllNonContestableOtherCostsPojo>();
			
			if ("exist".equals(projectStatus)) {
				result.setProjectId(projectId);
				projectDataList = dao.listAllNonContestableOtherCostsIterm(projectId);

			}

			if ("new".equals(projectStatus)) {

//				projectDataList = dao.listAllAllNonContestableOtherCostsIterm();

			}
			result.setProjectData(projectDataList);

			return result;

		}

		public void saveAndUpdateNonContestableOtherCostsIterm(NonContestableOtherCostsDataPojo pojo) {

			if ("new".equals(pojo.getProjectStatus())) {

				List<NonContestableOtherCosts> projectDataList = pojo.getProjectData();
				for (NonContestableOtherCosts Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					dao.insertNonContestableOtherCostsItermId(Pojo.getNonContestableOtherCostsItemId(),Pojo.getProjectId());
					dao.updateNonContestableOtherCostsIterm(Pojo);
				}

			}

			if ("exist".equals(pojo.getProjectStatus())) {

				List<NonContestableOtherCosts> projectDataList = pojo.getProjectData();
				for (NonContestableOtherCosts Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					NonContestableOtherCosts ncoc=dao.getNonContestableOtherCostsId(Pojo.getNonContestableOtherCostsItemId(),Pojo.getProjectId());
					if(ncoc!=null) {

						dao.updateNonContestableOtherCostsIterm(Pojo);
					}else {
						dao.insertNonContestableOtherCostsItermId(Pojo.getNonContestableOtherCostsItemId(),Pojo.getProjectId());
						dao.updateNonContestableOtherCostsIterm(Pojo);
					}

				}

					

				

			}

		}
		
		
		
		
		
		
		
		
		public NonContestableProjectComponentTypeDataPojo getDataNonContestableProjectComponent(Integer projectId, String projectStatus) {

			NonContestableProjectComponentTypeDataPojo result = new NonContestableProjectComponentTypeDataPojo();
			result.setMassage("");
			result.setResult("success");
			result.setProjectStatus(projectStatus);

			
			List<AllNonContestableProjectComponentPojo> projectDataList = new ArrayList<AllNonContestableProjectComponentPojo>();
			
			if ("exist".equals(projectStatus)) {
				result.setProjectId(projectId);
				projectDataList = dao.listAllNonContestableProjectComponent(projectId);

			}

			if ("new".equals(projectStatus)) {

//				projectDataList = dao.listAllALLNonContestableProjectComponent();

			}
			result.setProjectData(projectDataList);

			return result;

		}

		public void saveAndUpdateNonContestableProjectComponent(ProjectNonContestableProjectComponentData pojo) {

			if ("new".equals(pojo.getProjectStatus())) {

				List<ProjectNonContestableProjectComponent> projectDataList = pojo.getProjectData();
				for (ProjectNonContestableProjectComponent Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					dao.insertNonContestableProjectComponentId(Pojo.getNonContestableProjectComponentId(),Pojo.getProjectId());
					dao.updateNonContestableProjectComponent(Pojo);
				}

			}

			if ("exist".equals(pojo.getProjectStatus())) {

				List<ProjectNonContestableProjectComponent> projectDataList = pojo.getProjectData();
				for (ProjectNonContestableProjectComponent Pojo : projectDataList) {
					
					Pojo.setProjectId(pojo.getProjectId());
					ProjectNonContestableProjectComponent ncoc=dao.getProjectNonContestableProjectComponentId(Pojo.getNonContestableProjectComponentId(),Pojo.getProjectId());
					if(ncoc!=null) {
						dao.updateNonContestableProjectComponent(Pojo);
					}else {
						dao.insertNonContestableProjectComponentId(Pojo.getNonContestableProjectComponentId(),Pojo.getProjectId());
						dao.updateNonContestableProjectComponent(Pojo);
					}

				}

					

				

			}

		}

	}
