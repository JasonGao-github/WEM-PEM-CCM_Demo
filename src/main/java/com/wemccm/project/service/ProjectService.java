
package com.wemccm.project.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wemccm.common.entity.CustomerContributionPrice;
import com.wemccm.common.entity.CustomerContributionPriceType;
import com.wemccm.common.entity.Project;
import com.wemccm.common.entity.User;
import com.wemccm.common.page.FindPageRequestDto;
import com.wemccm.common.page.FindPageRequestDtoPojo;
import com.wemccm.common.page.PageResult;
import com.wemccm.common.page.PageUtils;
import com.wemccm.common.pojo.AddCurrentoccupyPojo;
import com.wemccm.common.pojo.ProjectListPojo;
import com.wemccm.common.pojo.projectPojo;
import com.wemccm.common.util.SR;
import com.wemccm.customercontribution.dao.CustomerContributionDao;
import com.wemccm.customercontribution.dao.CustomerContributionPriceDao;
import com.wemccm.customercontribution.dao.CustomerContributionPriceTypeDao;
import com.wemccm.project.dao.ProjectDao;

@Service
public class ProjectService {

	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private CustomerContributionDao ccDao;
	@Autowired
	private CustomerContributionPriceTypeDao ccPriceTypeDao;
	@Autowired
	private CustomerContributionPriceDao ccPriceDao;

	// 封装分页查询结果返回对象，在分页查询中，前端需要知道当前分页的页码及其他参数以便计算下一页的参数。
	public PageResult findPage(FindPageRequestDtoPojo dto) {
		return PageUtils.getPageResult(dto, getPageInfo(dto));
	}

	// 利用分页参数及PageHelper从数据库中取值
	private PageInfo<FindPageRequestDto> getPageInfo(FindPageRequestDtoPojo dto) {
		int pageNum = dto.getPageNum();
		int pageSize = dto.getPageSize();
		PageHelper.startPage(pageNum, pageSize);
		List<FindPageRequestDto> dprdto = projectDao.selectPage(dto);

		for (FindPageRequestDto dp : dprdto) {
			if (dp != null) {
				Integer id = dp.getUserId();

				System.out.println("id" + id);
				User u = projectDao.getUser(id);
				System.out.println("user" + u);
				if (u != null) {
					dp.setLastName(u.getFirstName());
					dp.setFirstName(u.getLastName());
				}
			}
		}

//		System.out.println(dprdto.get(0).getId());
//		pageResult.setPageNum(pageInfo.getPageNum());
//		pageResult.setPageSize(pageInfo.getPageSize());
//		pageResult.setTotalSize(pageInfo.getTotal());
//		pageResult.setTotalPages(pageInfo.getPages());
//		pageResult.setContent(pageInfo.getList());

		return new PageInfo<FindPageRequestDto>(dprdto);
	}

	public int addProject(projectPojo pojo) {

		// save to project table;
		Project project = new Project();
		project.setCreateDate(new Date());
		project.setStatues(SR.PROJECT_STATUS_NEW);
		project.setVersion("0");
		projectDao.addProject(project);
		int projectId = projectDao.getNewestId();

		// save to cc;
		pojo.setProjectId(projectId);
		ccDao.addcustomercontribution(pojo);

		// save price
		int ccid = ccDao.getNewestId();
		List<CustomerContributionPriceType> ccPricetypeList = ccPriceTypeDao.listAll();
		for (CustomerContributionPriceType customerContributionPriceType : ccPricetypeList) {
			CustomerContributionPrice ccPrice = new CustomerContributionPrice();
			ccPrice.setCustomerContributionId(ccid);
			ccPrice.setCustomerContributionPriceTypeId(customerContributionPriceType.getId());
			ccPrice.setOriginalPrice(0d);
			ccPrice.setRevisedPrice(0d);
			ccPriceDao.save(ccPrice);

		}

		return projectId;

	}

	public void addCurrentoccupy(AddCurrentoccupyPojo addCurrentoccupyPojo) {
		// TODO Auto-generated method stub
		projectDao.addCurrentoccupy(addCurrentoccupyPojo);
	}

	public List<ProjectListPojo> listByApprover(int userId) {

		return projectDao.listByApprover(userId);

	}

}