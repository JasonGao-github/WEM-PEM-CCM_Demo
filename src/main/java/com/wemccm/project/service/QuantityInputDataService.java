package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.QuantityInputDetailsPojo;
import com.wemccm.common.pojo.QuantityInputGetdataPojo;
import com.wemccm.common.pojo.QuantityInputGroupDataPojo;
import com.wemccm.project.dao.QuantityInputDataDao;

@Service
public class QuantityInputDataService {

	@Autowired
	private QuantityInputDataDao dao;

	public QuantityInputGetdataPojo getData(Integer projectId, String projectStatus) {

		QuantityInputGetdataPojo result = new QuantityInputGetdataPojo();
		result.setMassage("");
		result.setResult("success");
		result.setProjectStatus(projectStatus);

		List<QuantityInputItermGroup> allGroups = dao.listAllGroup();
		List<QuantityInputDetailsPojo> projectDataList = new ArrayList<QuantityInputDetailsPojo>();
		if ("exist".equals(projectStatus)) {
			result.setProjectId(projectId);
			for (QuantityInputItermGroup group : allGroups) {
				QuantityInputDetailsPojo detailpojo = new QuantityInputDetailsPojo();
				// 如果project已经存在，则查出已经有的数据。
				List<QuantityInputGroupDataPojo> pojoList = dao.listQuantityInputGroupDataPojo(projectId,
						group.getId());
				detailpojo.setQuantityInputItermGroupId(group.getId());
				detailpojo.setGroupData(pojoList);
				projectDataList.add(detailpojo);
			}

		}

		if ("new".equals(projectStatus)) {

			for (QuantityInputItermGroup group : allGroups) {
				QuantityInputDetailsPojo detailpojo = new QuantityInputDetailsPojo();
				// 如果project不存在，则查出所有的basicdata。
				List<QuantityInputGroupDataPojo> pojoList = dao.listBasicDatabyGroup(group.getId());
				detailpojo.setQuantityInputItermGroupId(group.getId());
				detailpojo.setGroupData(pojoList);
				projectDataList.add(detailpojo);
			}

		}
		result.setProjectData(projectDataList);

		return result;

	}

}
