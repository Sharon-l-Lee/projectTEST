package com.project.mylog.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.mylog.model.BoardTag;
import com.project.mylog.service.BoardTagService;
import com.project.mylog.service.HashtagService;

@Controller
@RequestMapping(value = "hashtag")
public class HashtagController {

	@Autowired
	private HashtagService hashtagservice;
	@Autowired
	private BoardTagService btagservice;

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test() {

		return "hashtag/test";

	}

	@RequestMapping(value = "testplus", method = RequestMethod.GET)
	public String testplus(String hname, Model model) {
		model.addAttribute("hname", hname);
		hashtagservice.hashtagWrite(hname);
		model.addAttribute("hno", hashtagservice.getHno(hname));
	
		return "hashtag/testplus";

	}

	@RequestMapping(value = "boardtag", method = RequestMethod.POST)
	@ResponseBody
	public String boardtag(@RequestParam(value="hnames[]") ArrayList<String> hnames, Model model, BoardTag boardtag) {
		for(String hname : hnames) {
			System.out.println(1);
			model.addAttribute("hname", hname);
			btagservice.BoardTagConnect(boardtag, hname);
		}
		System.out.println(2);

		
		return "review/list";
		
	}
	
	
//	@RequestMapping(value="delete", method= RequestMethod.GET)
//	public String testdelete(@RequestParam("tno") int tno, Model model) {
//		model.addAttribute("tno", tno);
//		model.addAttribute("tagdelete",hashtagservice.hashtagDelete(tno));
//		
//		return "hashtag/testdelete";
//		
//	}
}
