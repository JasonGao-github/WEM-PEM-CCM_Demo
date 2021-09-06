package com.wemccm.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;
import com.wemccm.common.pojo.wholeUserPojo;

@Mapper
public interface UserDao {

	public List<wholeUserPojo> getWholeUser(String usertype);

	public List<User> leaderid(int leaderid);

}
