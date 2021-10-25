package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.avoidedcost.dao.AvoidedCostDao;
import com.wemccm.common.entity.AssetRelocation;
import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.AvoidedCostassetReplacementIterm;
import com.wemccm.common.entity.NegotiatedConnection;
import com.wemccm.common.entity.URD;
import com.wemccm.common.pojo.AllAvoidedCostassetPojo;
import com.wemccm.common.pojo.AssetRelocationData;
import com.wemccm.common.pojo.AssetRelocationPojo;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsDataPojo;
import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypePojo;
import com.wemccm.common.pojo.NegotiatedConnectionData;
import com.wemccm.common.pojo.NegotiatedConnectionPojo;
import com.wemccm.common.pojo.URDData;
import com.wemccm.common.pojo.URDPojo;
import com.wemccm.contractschedule.dao.ContractScheduleDao;
import com.wemccm.fiminput.dao.FIMInputDao;

@Service
public class ContractScheduleDataService {

	@Autowired
	private ContractScheduleDao dao;

	public NegotiatedConnectionData getNegotiatedConnectionData(Integer projectId, String projectStatus) {

		NegotiatedConnectionData result = new NegotiatedConnectionData();
		result.setMassage("");
		result.setResult("success");
		result.setProjectStatus(projectStatus);

		result.setProjectId(projectId);

		NegotiatedConnection nc = new NegotiatedConnection();
		if ("exist".equals(projectStatus)) {
			nc = dao.getNCinCC(projectId);

		}

		if ("new".equals(projectStatus)) {

			NegotiatedConnectionPojo l = dao.findNCinCC(projectId);
			if (l != null) {
				l.setJemenaResponsibleOfficer("?????????????");
			}
			nc.setInquiryNumber(l.getInquiryNumber());
			nc.setScopeofWorksCustomerFunded(l.getScopeofWorksCustomerFunded());
			nc.setScopeofWorksJemenaFunded(l.getScopeofWorksJemenaFunded());
			nc.setExclusions(l.getExclusions());
			nc.setAssumptions(l.getAssumptions());
			nc.setSupplyAddress(l.getSupplyAddress());
			nc.setProjectReference(l.getProjectReference());

		}
		result.setProjectData(nc);

		return result;

	}

	public void saveAndUpdateNegotiatedConnection(NegotiatedConnectionData pojo) {

		if ("new".equals(pojo.getProjectStatus())) {
			NegotiatedConnection nc = new NegotiatedConnection();
			nc = pojo.getProjectData();
			dao.insertNegotiatedConnection(nc);

		}

		if ("exist".equals(pojo.getProjectStatus())) {

			NegotiatedConnection nc = new NegotiatedConnection();
			nc = pojo.getProjectData();

			dao.deleteNegotiatedConnection(nc.getProjectId());

			dao.insertNegotiatedConnection(nc);

		}

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public URDData getURD(Integer projectId, String projectStatus) {

		URDData result = new URDData();
		result.setMassage("");
		result.setResult("success");
		result.setProjectStatus(projectStatus);

		result.setProjectId(projectId);

		URD urd = new URD();
		if ("exist".equals(projectStatus)) {
			urd = dao.getURDinCC(projectId);

		}

		if ("new".equals(projectStatus)) {

			URDPojo l = dao.findURDinCC(projectId);
			if (l != null) {
				l.setJemenaResponsibleOfficer("?????????????");
			}
			urd.setSubdivision(l.getSubdivision());
			urd.setInquiryNumber(l.getInquiryNumber());
			urd.setSupplyAddress(l.getSupplyAddress());
			urd.setDescriptionofConnectionWorkstobeundertakenbyJemena(l.getDescriptionofConnectionWorkstobeundertakenbyJemena());
			urd.setDescriptionofConnectionWorkstobeundertakenbyDeveloper(l.getDescriptionofConnectionWorkstobeundertakenbyDeveloper());

			
		}
		result.setProjectData(urd);

		return result;

	}

	public void saveAndUpdateURD(URDData pojo) {

		if ("new".equals(pojo.getProjectStatus())) {
			URD nc = new URD();
			nc = pojo.getProjectData();
			dao.insertURD(nc);

		}

		if ("exist".equals(pojo.getProjectStatus())) {

			URD nc = new URD();
			nc = pojo.getProjectData();

			dao.deleteURD(nc.getProjectId());

			dao.insertURD(nc);

		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public AssetRelocationData getAssetRelocation(Integer projectId, String projectStatus) {

		AssetRelocationData result = new AssetRelocationData();
		result.setMassage("");
		result.setResult("success");
		result.setProjectStatus(projectStatus);

		result.setProjectId(projectId);

		AssetRelocation ar = new AssetRelocation();
		if ("exist".equals(projectStatus)) {
			ar = dao.getARinCC(projectId);

		}

		if ("new".equals(projectStatus)) {

			AssetRelocationPojo l = dao.findARinCC(projectId);
			if(l!=null) {
//				//=Financials!E47
//				private String contestableContributionChargesforWorksCompletedbyJemena;
//				//=IF('JEN Overheads|Build Up'!B23=TRUE,Financials!J46,"N/A")
//				private String nonContestableContributionChargesforWorksCompletedbyJemena;
//				//=Financials!D55
//				private String jemenaResponsibleOfficer;
				l.setContestableContributionChargesforWorksCompletedbyJemena("?????????????");
				l.setNonContestableContributionChargesforWorksCompletedbyJemena("?????????????");
				l.setJemenaResponsibleOfficer("?????????????");
				}
			ar.setInquiryNumber(l.getInquiryNumber());
			ar.setWorksAddress(l.getWorksAddress());
			ar.setScopeofWorks(l.getScopeofWorks());


			
		}
		result.setProjectData(ar);

		return result;

	}

	public void saveAndUpdateAssetRelocation(AssetRelocationData pojo) {

		if ("new".equals(pojo.getProjectStatus())) {
			AssetRelocation ar = new AssetRelocation();
			ar = pojo.getProjectData();
			dao.insertAssetRelocation(ar);

		}

		if ("exist".equals(pojo.getProjectStatus())) {

			AssetRelocation ar = new AssetRelocation();
			ar = pojo.getProjectData();

			dao.deleteAssetRelocation(ar.getProjectId());

			dao.insertAssetRelocation(ar);

		}

	}
	
	
	
}
