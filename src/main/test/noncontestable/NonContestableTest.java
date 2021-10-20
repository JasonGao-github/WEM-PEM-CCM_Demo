package noncontestable;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.FIMAllPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsDataPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemTypeDataPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentTypeDataPojo;
import com.wemccm.common.pojo.ProjectNonContestableProjectComponentData;
import com.wemccm.project.service.FIMInputDataService;
import com.wemccm.project.service.NonContestableDataService;


public class NonContestableTest {
	@Test
//  @Disabled
//  @DisplayName("getDataOC")
	public void getDataOC() {
		NonContestableDataService qiService=new NonContestableDataService();
		int projectId = 1;
		String projectStatus = "exist";

		NonContestableOtherCostsItemTypeDataPojo resultPojo = qiService.getDataNonContestableOtherCostsIterm(projectId, projectStatus);
		assertNotNull(resultPojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdatenewOC")
	public void saveAndUpdatenewOC() {
		NonContestableDataService qiService=new NonContestableDataService();
		NonContestableOtherCostsDataPojo pojo=new NonContestableOtherCostsDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("new");
		pojo.setProjectId(projectId);
		
		List<NonContestableOtherCosts> list=new ArrayList<NonContestableOtherCosts>();
		NonContestableOtherCosts entity=new NonContestableOtherCosts();
		entity.setNonContestableOtherCostsItemId(123);
		entity.setProjectId(1);
		entity.setQuantity(123);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdateNonContestableOtherCostsIterm(pojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdateexistOC")
	public void saveAndUpdateexistOC() {
		NonContestableDataService qiService=new NonContestableDataService();
		NonContestableOtherCostsDataPojo pojo=new NonContestableOtherCostsDataPojo();
		int projectId = 1;
		pojo.setProjectStatus("exist");
		pojo.setProjectId(projectId);
		
		List<NonContestableOtherCosts> list=new ArrayList<NonContestableOtherCosts>();
		NonContestableOtherCosts entity=new NonContestableOtherCosts();
		entity.setNonContestableOtherCostsItemId(123);
		entity.setProjectId(1);
		entity.setQuantity(123);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdateNonContestableOtherCostsIterm(pojo);
	}
	
	
	//-----------------------------------------------------------------------------------------------------------------------------
	
	
	
	
	@Test
//  @Disabled
//  @DisplayName("getDataPC")
	public void getDataPC() {
		NonContestableDataService qiService=new NonContestableDataService();
		int projectId = 1;
		String projectStatus = "exist";

		NonContestableProjectComponentTypeDataPojo resultPojo = qiService.getDataNonContestableProjectComponent(projectId, projectStatus);
		assertNotNull(resultPojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdatenewPC")
	public void saveAndUpdatenewPC() {
		NonContestableDataService qiService=new NonContestableDataService();
		ProjectNonContestableProjectComponentData pojo=new ProjectNonContestableProjectComponentData();
		int projectId = 1;
		pojo.setProjectStatus("new");
		pojo.setProjectId(projectId);
		
		List<ProjectNonContestableProjectComponent> list=new ArrayList<ProjectNonContestableProjectComponent>();
		ProjectNonContestableProjectComponent entity=new ProjectNonContestableProjectComponent();
		entity.setNonContestableProjectComponentId(123);
		entity.setProjectId(1);
		entity.setHours(123);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdateNonContestableProjectComponent(pojo);
	}
	
	
	@Test
//  @Disabled
//  @DisplayName("saveAndUpdateexistPC")
	public void saveAndUpdateexistPC() {
		NonContestableDataService qiService=new NonContestableDataService();
		ProjectNonContestableProjectComponentData pojo=new ProjectNonContestableProjectComponentData();
		int projectId = 1;
		pojo.setProjectStatus("exist");
		pojo.setProjectId(projectId);
		
		List<ProjectNonContestableProjectComponent> list=new ArrayList<ProjectNonContestableProjectComponent>();
		ProjectNonContestableProjectComponent entity=new ProjectNonContestableProjectComponent();
		entity.setNonContestableProjectComponentId(123);
		entity.setProjectId(1);
		entity.setHours(123);
		
		list.add(entity);
		pojo.setProjectData(list);
		
		
		qiService.saveAndUpdateNonContestableProjectComponent(pojo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
