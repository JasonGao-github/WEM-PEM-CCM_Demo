package connectionhandover;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsDataPojo;
import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.common.pojo.ConnectionHandoverDataPojo;
import com.wemccm.project.service.AvoidedCostDataService;
import com.wemccm.project.service.ConnectionHandoverDataService;


public class ConnectionHandoverTest {
	@Test
//  @Disabled
//  @DisplayName("getData")
	public void getData() {
		ConnectionHandoverDataService qiService=new ConnectionHandoverDataService();
		int projectId = 1;
		String projectStatus = "exist";

		ConnectionHandoverDataPojo resultPojo = qiService.getData(projectId, projectStatus);
		assertNotNull(resultPojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdatenew")
	public void saveAndUpdatenew() {
		ConnectionHandoverDataService qiService=new ConnectionHandoverDataService();
		ConnectionHandoverDataPojo pojo=new ConnectionHandoverDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("new");
		pojo.setProjectId(projectId);
		
		List<ConnectionHandover> list=new ArrayList<ConnectionHandover>();
		ConnectionHandover entity=new ConnectionHandover();
		entity.setPortalNo(123);
		entity.setProjectId(1);
		entity.setProjectRef("123.0");
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdate(pojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdateexist")
	public void saveAndUpdateexist() {
		ConnectionHandoverDataService qiService=new ConnectionHandoverDataService();
		ConnectionHandoverDataPojo pojo=new ConnectionHandoverDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("exist");
		pojo.setProjectId(projectId);
		
		List<ConnectionHandover> list=new ArrayList<ConnectionHandover>();
		ConnectionHandover entity=new ConnectionHandover();
		entity.setPortalNo(123);
		entity.setProjectId(1);
		entity.setProjectRef("123.0");
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdate(pojo);
	}
	
}
