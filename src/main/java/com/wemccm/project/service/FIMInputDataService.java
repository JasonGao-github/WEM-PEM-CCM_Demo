package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.FIMAllPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityDataPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypePojo;
import com.wemccm.common.pojo.QuantityInputDetailsPojo;
import com.wemccm.common.pojo.QuantityInputGetdataPojo;
import com.wemccm.common.pojo.QuantityInputGroupDataPojo;
import com.wemccm.common.pojo.QuantityInputSaveAndUpdatePojo;
import com.wemccm.fiminput.dao.FIMInputDao;
import com.wemccm.project.dao.QuantityInputDataDao;


	@Service
	public class FIMInputDataService {

		@Autowired
		private FIMInputDao dao;

		public FIMinputItermSubTypeTypeDataPojo getData(Integer projectId, String projectStatus) {

			FIMinputItermSubTypeTypeDataPojo result = new FIMinputItermSubTypeTypeDataPojo();
			result.setMassage("");
			result.setResult("success");
			result.setProjectStatus(projectStatus);

			
			List<FIMAllPojo> projectDataList = new ArrayList<FIMAllPojo>();
			
			if ("exist".equals(projectStatus)) {
				result.setProjectId(projectId);
				projectDataList = dao.listAllFIMinputIterm(projectId);

			}

			if ("new".equals(projectStatus)) {

//				projectDataList = dao.listAllAllFIMinputIterm();

			}
			result.setProjectData(projectDataList);

			return result;

		}

		public void saveAndUpdate(FIMinputItermSubTypeTypeDataPojo pojo) {

			if ("new".equals(pojo.getProjectStatus())) {

				List<FIMAllPojo> projectDataList = pojo.getProjectData();
				for (FIMAllPojo Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					
					dao.insertFIMAllPojo(Pojo);
//					FIMinputIterm i=new FIMinputIterm();
//					i.setCurrency(Pojo.getCurrency());
//					i.setUnitCost(Pojo.getUnitCost());
//					i.setfIMinputSubTypeID(Pojo.getfIMinputItermId());
//					dao.insertFIMinputIterm(i);
					
				}

			}

			if ("exist".equals(pojo.getProjectStatus())) {

				List<FIMAllPojo> projectDataList = pojo.getProjectData();
				for (FIMAllPojo Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					FIMAllPojo fim=dao.getFIMAllPojoId(Pojo.getfIMinputItermId(),Pojo.getProjectId());
					if(fim!=null) {
						dao.updateFIMAllPojo(Pojo);
					}else {
						dao.insertFIMAllPojo(Pojo);
					}
					
					
//					dao.updateFIMinputIterm(Pojo);

				}

					

				

			}

		}

	}
