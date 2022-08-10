package com.project.mylog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.AccountCategoryDao;
import com.project.mylog.model.AccountCategory;

@Service
public class AccountCategoryServiceImpl implements AccountCategoryService {
	@Autowired
	AccountCategoryDao acDao;
	
	@Override
	public List<AccountCategory> categoryList() {
		return acDao.categoryList();
	}

}
