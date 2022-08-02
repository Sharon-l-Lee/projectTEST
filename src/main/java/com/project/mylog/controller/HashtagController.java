package com.project.mylog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.mylog.service.HashtagService;

@Controller
@RequestMapping(value="hashtag")
public class HashtagController {
	
	@Autowired
	private HashtagService hashtagservice;


	@RequestMapping(value="test", method= RequestMethod.GET)
	public String test() {
		
		return "hashtag/test";
		
	}
	
	@RequestMapping(value="testplus", method= RequestMethod.GET)
	public String testplus(@RequestParam("tname") String tname, Model model) {
		model.addAttribute("tname", tname);
		model.addAttribute("tag",hashtagservice.hashtagWrite(tname));
		
		return "hashtag/testplus";
		
	}
	
	@RequestMapping(value="delete", method= RequestMethod.GET)
	public String testdelete(@RequestParam("tno") int tno, Model model) {
		model.addAttribute("tno", tno);
		model.addAttribute("tagdelete",hashtagservice.hashtagDelete(tno));
		
		return "hashtag/testdelete";
		
	}
}
