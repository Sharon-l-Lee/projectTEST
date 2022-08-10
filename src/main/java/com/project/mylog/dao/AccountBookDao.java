package com.project.mylog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.mylog.model.AccountBook;


@Mapper
public interface AccountBookDao {
	public int dailyAccountCnt(AccountBook accountBook);
	public List<AccountBook> dailyAccount(AccountBook accountBook);
	public int monthlyAccountCnt(AccountBook accountBook);
	public List<AccountBook> monthlyAccount(AccountBook accountBook);
	
	public AccountBook dailyTotal(AccountBook accountBook);
	public List<AccountBook> dailyCategoryTotal(AccountBook accountBook);
	public AccountBook mothlyTotal(AccountBook accountBook);
	public List<AccountBook> monthlyCategoryTotal(AccountBook accountBook);
	
	public int accountWrite(AccountBook accountBook);
	public AccountBook getAccount(int ano);
	public int accountModify(AccountBook accountBook);
	public int accountDelete(int ano);
}
