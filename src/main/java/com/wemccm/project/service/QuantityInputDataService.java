package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.CICprojectDetails;
import com.wemccm.common.entity.CICprojectEstimate;
import com.wemccm.common.entity.CICprojectTask;
import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.QuantityInputDetailsPojo;
import com.wemccm.common.pojo.QuantityInputGetdataPojo;
import com.wemccm.common.pojo.QuantityInputGroupDataPojo;
import com.wemccm.common.pojo.QuantityInputSaveAndUpdatePojo;
import com.wemccm.project.dao.CICDao;
import com.wemccm.project.dao.CustomerContributionDataDao;
import com.wemccm.project.dao.QuantityInputDataDao;

@Service
public class QuantityInputDataService {

	@Autowired
	private QuantityInputDataDao qtdao;
	@Autowired
	private CICDao cicDao;
	@Autowired
	private CustomerContributionDataDao ccDao;

	public QuantityInputGetdataPojo getData(Integer projectId, String projectStatus) {

		QuantityInputGetdataPojo result = new QuantityInputGetdataPojo();
		result.setMassage("");
		result.setResult("success");
		result.setProjectStatus(projectStatus);

		List<QuantityInputItermGroup> allGroups = qtdao.listAllGroup();
		List<QuantityInputDetailsPojo> projectDataList = new ArrayList<QuantityInputDetailsPojo>();
		if ("exist".equals(projectStatus)) {
			result.setProjectId(projectId);
			for (QuantityInputItermGroup group : allGroups) {
				QuantityInputDetailsPojo detailpojo = new QuantityInputDetailsPojo();
				// 如果project已经存在，则查出已经有的数据。
				List<QuantityInputGroupDataPojo> pojoList = qtdao.listQuantityInputGroupDataPojo(projectId,
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
				List<QuantityInputGroupDataPojo> pojoList = qtdao.listBasicDatabyGroup(group.getId());
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
					if (null == pojo.getLcatSubTotal()) {
						pojo.setLcatSubTotal(0d);
					}
					if (null == pojo.getManhours()) {
						pojo.setManhours(0d);
					}
					if (null == pojo.getMaterial()) {
						pojo.setMaterial(0d);
					}
					if (null == pojo.getPlant()) {
						pojo.setPlant(0d);
					}
					if (null == pojo.getRecouverableQty()) {
						pojo.setRecouverableQty(0);
					}
					if (null == pojo.getRecouverableSubTotal()) {
						pojo.setRecouverableSubTotal(0d);
					}
					if (null == pojo.getSubcontract()) {
						pojo.setSubcontract(0d);
					}
					if (null == pojo.getUnitRate()) {
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

	public void saveAndUpdate(QuantityInputSaveAndUpdatePojo pojo) {

		if ("new".equals(pojo.getProjectStatus())) {

			List<QuantityInputDetailsPojo> projectDataList = pojo.getProjectData();
			for (QuantityInputDetailsPojo quantityInputDetailsPojo : projectDataList) {
				List<QuantityInputGroupDataPojo> groupDataList = quantityInputDetailsPojo.getGroupData();
				for (QuantityInputGroupDataPojo groupDataPojo : groupDataList) {
					groupDataPojo.setProjectId(pojo.getProjectId());
					qtdao.saveToQantityInput(groupDataPojo);
				}
			}

			// if its a new project , create new cic items .
			initicalCIC(pojo.getProjectId());
		}

		if ("exist".equals(pojo.getProjectStatus())) {
			List<QuantityInputDetailsPojo> projectDataList = pojo.getProjectData();
			for (QuantityInputDetailsPojo quantityInputDetailsPojo : projectDataList) {
				List<QuantityInputGroupDataPojo> groupDataList = quantityInputDetailsPojo.getGroupData();
				for (QuantityInputGroupDataPojo groupDataPojo : groupDataList) {
					// existing data
					if (null != groupDataPojo.getQuantityInputId()) {
						qtdao.updateQuantityInput(groupDataPojo);
						// new data
					} else {
						groupDataPojo.setProjectId(pojo.getProjectId());
						qtdao.saveToQantityInput(groupDataPojo);

					}

				}

			}

		}

		// update new cic information
		finacialCaculation(pojo.getProjectId());

	}

	private void initicalCIC(int projectId) {

		// initical details
		CICprojectDetails detail = new CICprojectDetails();
		detail.setProjectId(projectId);
		cicDao.saveCICprojectDetails(detail);
		int detailId = cicDao.getCICprojectDetailsNewestId();

		// initial estimate
		List<CICprojectTask> taskList = cicDao.listAllTask();

		for (CICprojectTask task : taskList) {

			CICprojectEstimate estimaite = new CICprojectEstimate();

			estimaite.setCicProjectTaskId(task.getId());
			estimaite.setCicProjectDetailsId(detailId);
			// other parameters will have an default value which is 0;

			cicDao.saveCICprojectEstimate(estimaite);
		}

	}

	private void finacialCaculation(int projectId) {

		caculateProjectManagementDesign(projectId);
		// TODO tobe more items

	}

	private void caculateProjectManagementDesign(int projectId) {

		// caculate
		double labour = caculateProjectManagementDesignLabour(projectId);
		double materials = caculateProjectManagementMaterials(projectId);
		double plant = caculateProjectManagementPlant(projectId);
		double contracts = caculateProjectManagementContracts(projectId);

		// update CICprojectDetails
		CICprojectDetails tempDetail = new CICprojectDetails();
		String zinfraWBS = ccDao.getCustomerDetailsByProjectId(projectId).getZinfraWBS();
		tempDetail.setProjectId(projectId);
		tempDetail.setWbsElements(zinfraWBS);
		cicDao.updateCICprojectDetails(tempDetail);

		// update CICprojectEstimate
		CICprojectEstimate tempEstimate = new CICprojectEstimate();
		int detailsId = cicDao.getCICProjectDetailsId(projectId);
		tempEstimate.setCicProjectDetailsId(detailsId);
		tempEstimate.setCicProjectTaskId(1);
		tempEstimate.setContracts(contracts);
		tempEstimate.setLabour(labour);
		tempEstimate.setMaterials(materials);
		tempEstimate.setPlants(plant);
		tempEstimate.setTotal(contracts + labour + materials + plant);
		cicDao.updateCICprojectEstimate(tempEstimate);

	}

	private double caculateProjectManagementDesignLabour(int projectId) {

		Double result1 = cicDao.caculateProjectManagementDesignLabour1(projectId);
		Double result2 = cicDao.caculateProjectManagementDesignLabour2(projectId);
		Double result3 = cicDao.caculateProjectManagementDesignLabour3(projectId);

		return result1 - (result2 + result3);

	}

	private double caculateProjectManagementMaterials(int projectId) {

		Double result1 = cicDao.caculateProjectManagementMaterials1(projectId);
		Double result2 = cicDao.caculateProjectManagementMaterials2(projectId);

		return result1 - result2;

	}

	private double caculateProjectManagementPlant(int projectId) {

		Double result1 = cicDao.caculateProjectManagementPlant1(projectId);
		Double result2 = cicDao.caculateProjectManagementPlant2(projectId);

		return result1 - result2;

	}

	private double caculateProjectManagementContracts(int projectId) {

		Double result1 = cicDao.caculateProjectManagementContracts1(projectId);
		Double result2 = cicDao.caculateProjectManagementContracts2(projectId);
		Double result3 = cicDao.caculateProjectManagementContracts3(projectId);

		return result1 - (result2 + result3);

	}

}
