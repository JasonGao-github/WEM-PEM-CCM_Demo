
package com.wemccm.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wemccm.common.entity.User;
import com.wemccm.common.page.FindPageRequestDto;
import com.wemccm.common.page.PageResult;
import com.wemccm.common.page.PageUtils;
import com.wemccm.project.dao.ProjectDao;

@Service
public class ProjectService {

	@Autowired
	private ProjectDao Dao;

	// 封装分页查询结果返回对象，在分页查询中，前端需要知道当前分页的页码及其他参数以便计算下一页的参数。
	public PageResult findPage(FindPageRequestDto dto) {
		return PageUtils.getPageResult(dto, getPageInfo(dto));
	}

	// 利用分页参数及PageHelper从数据库中取值
	private PageInfo<User> getPageInfo(FindPageRequestDto dto) {
		int pageNum = dto.getPageNum();
		int pageSize = dto.getPageSize();
		PageHelper.startPage(pageNum, pageSize);
		List<User> Users = Dao.selectPage(dto);
		
//		pageResult.setPageNum(pageInfo.getPageNum());
//		pageResult.setPageSize(pageInfo.getPageSize());
//		pageResult.setTotalSize(pageInfo.getTotal());
//		pageResult.setTotalPages(pageInfo.getPages());
//		pageResult.setContent(pageInfo.getList());
		

		return new PageInfo<User>(Users);
	}

//	public List<User> listUser(DemoPageRequestDto dto) {
//		return demoMapper.selectPage(dto);
//	}

}