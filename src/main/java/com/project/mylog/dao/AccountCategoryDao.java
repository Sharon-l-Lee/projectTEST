package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.AccountCategory;

@Mapper
public interface AccountCategoryDao {
	public List<AccountCategory> categoryList();
}
