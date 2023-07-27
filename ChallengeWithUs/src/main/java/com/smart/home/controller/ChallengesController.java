package com.smart.home.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.ChallengesDTO;
import com.smart.home.dto.ChallengesPagingDTO;
import com.smart.home.service.ChallengesService;

@Controller
@RequestMapping("/yj")
public class ChallengesController {
	
	@Autowired
	ChallengesService service;
	
	// 챌린지 리스트 조회
//	@GetMapping("/ChallengesList")
//	public ModelAndView ChallengesList(ChallengesPagingDTO pDTO) {
//
//		pDTO.setTotalRecord(service.ChallengesTotalRecord(pDTO));
//		List<ChallengesDTO> list = service.ChallengesList(pDTO);
//		
//		ModelAndView mav = new ModelAndView();
//
//		mav.addObject("list", list);
//		mav.addObject("pDTO", pDTO);
//		mav.setViewName("yj/ChallengesList");
//		return mav;
//	}
	

	
	
	
}











