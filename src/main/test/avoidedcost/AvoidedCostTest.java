package avoidedcost;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsDataPojo;
import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.login.service.LoginService;
import com.wemccm.project.service.AvoidedCostDataService;

public class AvoidedCostTest {
	@Test
//  @Disabled
//  @DisplayName("getData")
	public void getData() {
		AvoidedCostDataService qiService=new AvoidedCostDataService();
		int projectId = 1;
		String projectStatus = "exist";

		AvoidedCostassetReplacementItermDataPojo resultPojo = qiService.getData(projectId, projectStatus);
		assertNotNull(resultPojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdatenew")
	public void saveAndUpdatenew() {
		AvoidedCostDataService qiService=new AvoidedCostDataService();;
		AvoidedCostAssetReplacementCostsDataPojo pojo=new AvoidedCostAssetReplacementCostsDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("new");
		pojo.setProjectId(projectId);
		
		List<AvoidedCostAssetReplacementCosts> list=new ArrayList<AvoidedCostAssetReplacementCosts>();
		AvoidedCostAssetReplacementCosts entity=new AvoidedCostAssetReplacementCosts();
		entity.setAvoidedCostassetReplacementItermId(123);
		entity.setProjectId(1);
		entity.setPresentValueRC(123.0);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdate(pojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdateexist")
	public void saveAndUpdateexist() {
		AvoidedCostDataService qiService=new AvoidedCostDataService();
		AvoidedCostAssetReplacementCostsDataPojo pojo=new AvoidedCostAssetReplacementCostsDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("exist");
		pojo.setProjectId(projectId);
		
		List<AvoidedCostAssetReplacementCosts> list=new ArrayList<AvoidedCostAssetReplacementCosts>();
		AvoidedCostAssetReplacementCosts entity=new AvoidedCostAssetReplacementCosts();
		entity.setAvoidedCostassetReplacementItermId(123);
		entity.setProjectId(1);
		entity.setPresentValueRC(123.0);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdate(pojo);
	}
	
	
	
	
	
	
	
}
