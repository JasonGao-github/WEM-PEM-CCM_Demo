package com.wemccm.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;
import com.wemccm.common.entity.UserType;
import com.wemccm.common.pojo.ChangePasswordPojo;
import com.wemccm.common.pojo.UserListPojo;
import com.wemccm.common.pojo.wholeUserPojo;

@Mapper
public interface UserDao {

	public List<wholeUserPojo> getWholeUser(String usertype);

	public List<User> leaderid(int leaderid);

	public List<UserListPojo> listAllUser();

	public void deleteUser(int id);

	public User getUserById(int userId);

	public void updatePassword(ChangePasswordPojo pojo);

	public List<UserType> listAllUserType();

	public List<User> listUserByType(int userTypeId);

}
