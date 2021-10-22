package fiminput;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsDataPojo;
import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.common.pojo.FIMAllPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.project.service.AvoidedCostDataService;
import com.wemccm.project.service.FIMInputDataService;


public class FIMInputTest {
	@Test
//  @Disabled
//  @DisplayName("getData")
	public void getData() {
		FIMInputDataService qiService=new FIMInputDataService();
		int projectId = 1;
		String projectStatus = "exist";

		FIMinputItermSubTypeTypeDataPojo resultPojo = qiService.getData(projectId, projectStatus);
		assertNotNull(resultPojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdatenew")
	public void saveAndUpdatenew() {
		FIMInputDataService qiService=new FIMInputDataService();
		FIMinputItermSubTypeTypeDataPojo pojo=new FIMinputItermSubTypeTypeDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("new");
		pojo.setProjectId(projectId);
		
		List<FIMAllPojo> list=new ArrayList<FIMAllPojo>();
		FIMAllPojo entity=new FIMAllPojo();
		entity.setfIMinputItermId(123);
		entity.setProjectId(1);
		entity.setActuralSubTotal(123.0);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdate(pojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdateexist")
	public void saveAndUpdateexist() {
		FIMInputDataService qiService=new FIMInputDataService();
		FIMinputItermSubTypeTypeDataPojo pojo=new FIMinputItermSubTypeTypeDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("exist");
		pojo.setProjectId(projectId);
		
		List<FIMAllPojo> list=new ArrayList<FIMAllPojo>();
		FIMAllPojo entity=new FIMAllPojo();
		entity.setfIMinputItermId(123);
		entity.setProjectId(1);
		entity.setActuralSubTotal(123.0);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdate(pojo);
	}
}
