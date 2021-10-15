package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.avoidedcost.dao.AvoidedCostDao;
import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.AvoidedCostassetReplacementIterm;
import com.wemccm.common.pojo.AllAvoidedCostassetPojo;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsDataPojo;
import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypePojo;
import com.wemccm.fiminput.dao.FIMInputDao;

	@Service
	public class AvoidedCostDataService {

		@Autowired
		private AvoidedCostDao dao;

		public AvoidedCostassetReplacementItermDataPojo getData(Integer projectId, String projectStatus) {

			AvoidedCostassetReplacementItermDataPojo result = new AvoidedCostassetReplacementItermDataPojo();
			result.setMassage("");
			result.setResult("success");
			result.setProjectStatus(projectStatus);
			
			
			List<AllAvoidedCostassetPojo> projectDataList = new ArrayList<AllAvoidedCostassetPojo>();
			
			if ("exist".equals(projectStatus)) {
				result.setProjectId(projectId);
				projectDataList = dao.selectAllAvoidedCostassetReplacementIterm(projectId);

			}

			if ("new".equals(projectStatus)) {

//				projectDataList = dao.selectAllALLAvoidedCostassetReplacementIterm();

			}
			result.setProjectData(projectDataList);

			return result;

		}

		public void saveAndUpdate(AvoidedCostAssetReplacementCostsDataPojo pojo) {
			
			if ("new".equals(pojo.getProjectStatus())) {

				List<AvoidedCostAssetReplacementCosts> projectDataList = pojo.getProjectData();
				for (AvoidedCostAssetReplacementCosts Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					dao.insertAvoidedCostassetReplacementItermId(Pojo.getId());
					dao.updateAvoidedCostassetReplacementIterm(Pojo);
				}

			}

			if ("exist".equals(pojo.getProjectStatus())) {

				List<AvoidedCostAssetReplacementCosts> projectDataList = pojo.getProjectData();
				for (AvoidedCostAssetReplacementCosts Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					AvoidedCostAssetReplacementCosts ncoc=dao.getAvoidedCostAssetReplacementCostsId(Pojo.getId());
					if(ncoc!=null) {
						dao.updateAvoidedCostassetReplacementIterm(Pojo);
					}else {
						dao.insertAvoidedCostassetReplacementItermId(Pojo.getId());
						dao.updateAvoidedCostassetReplacementIterm(Pojo);
					}

				}

					

				

			}

		}

	}
