package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
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
				for (QuantityInputGroupDataPojo pojo : pojoList) {
					if (null == pojo.getActualsQty()) {
						pojo.setActualsQty(0);
					}
					if (null == pojo.getActualsSubTotal()) {
						pojo.setActualsSubTotal(0d);
					}
					if (null == pojo.getJemenaQty()) {
						pojo.setJemenaQty(0);
					}
					if (null == pojo.getJemenaSubTotal()) {
						pojo.setJemenaSubTotal(0d);
					}
					if (null == pojo.getLabour()) {
						pojo.setLabour(0d);
					}
					if (null == pojo.getLcatQty()) {
						pojo.setLcatQty(0);
					}
					if(null == pojo.getLcatSubTotal()) {
						pojo.setLcatSubTotal(0d);
					}
					if(null == pojo.getManhours()) {
						pojo.setManhours(0d);
					}
					if(null == pojo.getMaterial()) {
						pojo.setMaterial(0d);
					}
					if(null == pojo.getPlant()) {
						pojo.setPlant(0d);
					}
					if(null == pojo.getRecouverableQty()) {
						pojo.setRecouverableQty(0);
					}
					if(null == pojo.getRecouverableSubTotal()) {
						pojo.setRecouverableSubTotal(0d);
					}
					if(null == pojo.getSubcontract()) {
						pojo.setSubcontract(0d);
					}
					if(null == pojo.getUnitRate()) {
						pojo.setUnitRate(0d);
					}
				}

				detailpojo.setQuantityInputItermGroupId(group.getId());
				detailpojo.setGroupData(pojoList);
				projectDataList.add(detailpojo);
			}

		}
		result.setProjectData(projectDataList);

		return result;

	}

}
