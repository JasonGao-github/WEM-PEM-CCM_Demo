package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.pojo.ConnectionHandoverDataPojo;
import com.wemccm.common.pojo.FIMAllPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.connectionhandover.dao.ConnectionHandoverDao;
import com.wemccm.fiminput.dao.FIMInputDao;

	@Service
	public class ConnectionHandoverDataService {

		@Autowired
		private ConnectionHandoverDao dao;

		public ConnectionHandoverDataPojo getData(Integer projectId, String projectStatus) {

			ConnectionHandoverDataPojo result = new ConnectionHandoverDataPojo();
			result.setMassage("");
			result.setResult("success");
			result.setProjectStatus(projectStatus);

			
			List<ConnectionHandover> projectDataList = new ArrayList<ConnectionHandover>();
			
			if ("exist".equals(projectStatus)) {
				result.setProjectId(projectId);
				projectDataList.add(dao.listAllConnectionHandover(projectId));

			}

			if ("new".equals(projectStatus)) {

//				projectDataList = dao.listAllAllFIMinputIterm();

			}
			result.setProjectData(projectDataList);

			return result;

		}

		public void saveAndUpdate(ConnectionHandoverDataPojo pojo) {

			if ("new".equals(pojo.getProjectStatus())) {

				List<ConnectionHandover> projectDataList = pojo.getProjectData();
				for (ConnectionHandover Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					
					dao.insertConnectionHandover(Pojo);
					
				}

			}

			if ("exist".equals(pojo.getProjectStatus())) {

				List<ConnectionHandover> projectDataList = pojo.getProjectData();
				for (ConnectionHandover Pojo : projectDataList) {
					Pojo.setProjectId(pojo.getProjectId());
					ConnectionHandover ncoc=dao.getConnectionHandoverId(Pojo.getProjectId());
					
					if(ncoc!=null) {
						dao.updateConnectionHandover(Pojo);
						//??????????????????????????????????????
					}else {
						dao.insertConnectionHandover(Pojo);
					}

				
					

				}

					

				

			}

		}

	}
