package com.smhrd.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.smhrd.entity.Test;

@Mapper
public interface User_info {


	public void join(com.smhrd.entity.User_info vo);

	public com.smhrd.entity.User_info login(com.smhrd.entity.User_info vo);

	public com.smhrd.entity.User_info id(com.smhrd.entity.User_info vo);

	public void pw(com.smhrd.entity.User_info vo);

	public void userUpdate(com.smhrd.entity.User_info vo);

	public void userGoodbye(com.smhrd.entity.User_info vo);

	public List<com.smhrd.entity.User_info> userlist();

	public void deleteUser(String user_id);

	public void editUser(com.smhrd.entity.User_info vo);

	public void review(String user_id);


	
	
}
