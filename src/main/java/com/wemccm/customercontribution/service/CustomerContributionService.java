package com.wemccm.customercontribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.entity.CustomerContributionAuthoris;
import com.wemccm.common.pojo.CustomerContributionDetailPojo;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.common.pojo.CustomerContributionPricePojo;
import com.wemccm.common.pojo.CustomerContributionURDPojo;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.customercontribution.dao.CustomerContributionDao;

@Service
public class CustomerContributionService {
	@Autowired  
	private CustomerContributionDao Dao;

//		CICAuthorisation cica = Dao.getCICAuthorisation(requestPojo);

	public CustomerContribution updateCustomerContribution(CustomerContributionPojo requestPojo) {
		Dao.updateCustomerContribution(requestPojo);
		return null;
	}

	public void insertCustomerContributionAuthoris(List<CustomerContributionAuthoris> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertCustomerContributionAuthoris(list.get(i));

		}
	}

	public CustomerContributionDetailPojo CustomerContributionDetail(projectIdPojo requestPojo) {
		CustomerContributionDetailPojo p=Dao.findDetailPojo(requestPojo);

			List<CustomerContributionAuthoris> a=Dao.findCustomerContributionAuthoris(p.getCustomerContributionId());
			p.setAuthorList(a); 
			
			
			List<CustomerContributionPricePojo> pp=Dao.findCustomerContributionPricePojo(p.getCustomerContributionId());
			p.setPriceList(pp); 


		return p;
	}

	public CustomerContributionURDPojo CustomerContributionURD(Integer projectId) {
		
		Boolean b=Dao.JENOverheadsBuildUpB23(projectId);
		//OverheadsBuildUp is not finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//OverheadsBuildUp is not finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//OverheadsBuildUp is not finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//OverheadsBuildUp is not finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//OverheadsBuildUp is not finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//OverheadsBuildUp is not finish!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
		
		CustomerContributionURDPojo result = new CustomerContributionURDPojo();
		if(b==true){
			
			
			result.setScope("The services listed below must be performed by Jemena and in accordance with the Conditions of this contract.\r\n" + 
					"• Design review and approval.\r\n"+
					"• Project management.\r\n"+
					"• Final audit and inspection.\r\n"+
					"• Co-ordination of access to the network.");
			
			result.setExclusions("\"Unless otherwise agreed by the parties, the services listed are hereby expressly excluded from the Works to be carried out by Jemena under this contract and must be provided by the Customer.\"&\"As outlined in drawing JEMEE-DW-UG-\"&\" and summarised below.\"&\"\r\n" + 
					"\r\n" + 
					"• Install "+Dao.FIMacturalQuantity(projectId)+" x 500kVA kiosk.\"&\"s\r\n" + 
					
							"• Install "+Dao.FIMHVunderground(projectId)+"m of HV underground cable.\"&\"\r\n" + 
							"• Install "+Dao.FIMLVunderground(projectId)+"m of LV underground cable.\"&\"\r\n" + 
							"• Install "+Dao.FIMHVcableheadpole(projectId)+" HV cablehead pole.\"&\"\r\n" + 
							
							"• Install "+Dao.FIMHVstraightjoints(projectId)+" HV straight joints.\"&\"\r\n" + 
							"• Install "+Dao.FIMLVmainsjoints(projectId)+" LV mains joints.\"&\"\r\n" + 
							"• Install "+Dao.FIMLVservicetjoints(projectId)+" LV service t-joints\"&\"\r\n" + 
							
							"• Install "+Dao.FIMpubliclights(projectId)+" public lights.\"&\"\r\n" + 
							"• Install "+Dao.FIMservicepits(projectId)+" service pits\"&\"\r\n\")");
			
			result.setAssumptions("None");
			
			
			
		}else {
			
			
			result.setScope("\"Unless otherwise agreed by the parties, the services listed are hereby expressly excluded from the Works to be carried out by Jemena under this contract and must be provided by the Customer.\"&\"As outlined in drawing JEMEE-DW-UG-\"&\" and summarised below.\"&\"\r\n" + 
					"\r\n" + 
					"• Install "+Dao.FIMacturalQuantity(projectId)+" x 500kVA kiosk.\"&\"s\r\n" + 
					
							"• Install "+Dao.FIMHVunderground(projectId)+"m of HV underground cable.\"&\"\r\n" + 
							"• Install "+Dao.FIMLVunderground(projectId)+"m of LV underground cable.\"&\"\r\n" + 
							"• Install "+Dao.FIMHVcableheadpole(projectId)+" HV cablehead pole.\"&\"\r\n" + 
							
							"• Install "+Dao.FIMHVstraightjoints(projectId)+" HV straight joints.\"&\"\r\n" + 
							"• Install "+Dao.FIMLVmainsjoints(projectId)+" LV mains joints.\"&\"\r\n" + 
							"• Install "+Dao.FIMLVservicetjoints(projectId)+" LV service t-joints\"&\"\r\n" + 
							
							"• Install "+Dao.FIMpubliclights(projectId)+" public lights.\"&\"\r\n" + 
							"• Install "+Dao.FIMservicepits(projectId)+" service pits\"&\"\r\n\")");
			
			result.setExclusions("• Work outside normal hours.\r\n" + 
					"			• Supply Authority Charges.\r\n" + 
					"			• Site agreements, inductions, awards or disability allowances which may become applicable.\r\n" + 
					"			• Site Survey and set out.\r\n" + 
					"			• Any tree or scrub clearing.\r\n" + 
					"			• Supply and installation of special compounds, grouting and drilling through rock and rocklike substances for placing of earthing electrodes.\r\n" + 
					"			• Any civil works within URD stage/customer boundary including substation slab construction, trenching/backfill, conduit supply/installation, pit delivery/installation, bedding sand installation etc.\r\n" + 
					"			• Excavation in rock or rocklike substances.\r\n" + 
					"			• Disposal of contaminated soil.\r\n" + 
					"			• Supply of consolidated medium for back fill around poles.\r\n" + 
					"			• Alterations to existing assets.\r\n" + 
					"			• Traffic Management Plan costs.");
			result.setAssumptions("• Civil works within customer premises will be carried out by customer.\r\n" + 
					"• No geotechnical assessment has been undertaken. Any pricing, scoping or programming set out or referred to in this proposal or the qualified offers does not include any allowance for addressing latent conditions (including, but not limited to, rock and soil contamination) that may be encountered in carrying out the works.\r\n" + 
					"• Customer will provide all necessary land for the works, including, but not limited to, land for substations, cables and overhead lines, including procurement of all required easements, leases and/or licenses.\r\n" + 
					"• No delays in obtaining regulatory approvals, exemptions and consents\r\n" + 
					"• No any environmental assessments has been undertaken. It is assumed there are no environmental, cultural heritage or native title issues.\r\n" + 
					"• Zinfra has not undertaken any community or stakeholder consultation. It is assumed that there are no community or stakeholder issues.\r\n" + 
					"• All requests for electricity outages will be subject to approval by JEN. System operating conditions, weather and other factors outside of Zinfra’s control may cause cancellations / delays in providing access to the network;\r\n" + 
					"• Zinfra has assumed it has unimpeded access to all Zinfra worksites for all construction and operational activities.\r\n" + 
					"• The Developer/Customer is responsible for ensuring their installation is compliant with the prevailing Services & Installation Rules (SIR)\r\n" + 
					"• The customer must engage their preferred retailer for an metering installation requirements.");
		
		}
		return result;
	}
}
