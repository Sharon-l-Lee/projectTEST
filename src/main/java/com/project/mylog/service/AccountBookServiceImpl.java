package com.project.mylog.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mylog.dao.AccountBookDao;
import com.project.mylog.model.AccountBook;
import com.project.mylog.model.Member;
import com.project.mylog.util.Paging;

@Service
public class AccountBookServiceImpl implements AccountBookService {
	
	@Autowired
	private AccountBookDao abDao;

	@Override
	public List<AccountBook> dailyAccount(Date adate, String pageNum, HttpSession session) {
		if(pageNum == null) {
			pageNum = "1";
		}
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		Paging paging =  new Paging(abDao.dailyAccountCnt(accountBook), pageNum, 15, 10);
		accountBook.setStartRow(paging.getStartRow());
		accountBook.setEndRow(paging.getEndRow());
		return abDao.dailyAccount(accountBook);
	}

	@Override
	public List<AccountBook> monthlyAccount(Date adate, String pageNum, HttpSession session) {
		if(pageNum == null) {
			pageNum = "1";
		}
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		Paging paging =  new Paging(abDao.monthlyAccountCnt(accountBook), pageNum, 15, 10);
		accountBook.setStartRow(paging.getStartRow());
		accountBook.setEndRow(paging.getEndRow());
		return abDao.monthlyAccount(accountBook);
	}

	@Override
	public int dailyAccountCnt(Date adate, HttpSession session) {
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		return abDao.dailyAccountCnt(accountBook);
	}

	@Override
	public int monthlyAccountCnt(Date adate, HttpSession session) {
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		return abDao.monthlyAccountCnt(accountBook);
	}

	@Override
	public AccountBook dailyTotal(Date adate, HttpSession session) {
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		return abDao.dailyTotal(accountBook);
	}

	@Override
	public List<AccountBook> dailyCategoryTotal(Date adate, HttpSession session) {
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		return abDao.dailyCategoryTotal(accountBook);
	}

	@Override
	public AccountBook mothlyTotal(Date adate, HttpSession session) {
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		return abDao.mothlyTotal(accountBook);
	}

	@Override
	public List<AccountBook> monthlyCategoryTotal(Date adate, HttpSession session) {
		AccountBook accountBook = new AccountBook();
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		accountBook.setAdate(Timestamp.valueOf(adate+ " 00:00:00"));
		return abDao.monthlyCategoryTotal(accountBook);
	}

	@Override
	public int accountWrite(AccountBook accountBook, HttpSession session) {
		accountBook.setMid(((Member) session.getAttribute("member")).getMid());
		System.out.println(accountBook);
		return abDao.accountWrite(accountBook);
	}

	@Override
	public int accountModify(AccountBook accountBook) {
		return abDao.accountModify(accountBook);
	}

	@Override
	public int accountDelete(int ano) {
		return abDao.accountDelete(ano);
	}

	@Override
	public AccountBook getAccount(int ano) {
		return abDao.getAccount(ano);
	}


}
