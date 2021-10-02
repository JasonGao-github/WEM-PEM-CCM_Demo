package com.wemccm.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.Notice;
import com.wemccm.common.pojo.NoticePojo;

@Mapper
public interface NoticeDao {

	public void createNotice(NoticePojo requestPojo);

	public List<Notice> getNotice(NoticePojo requestPojo);

}
