package com.smart.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@GetMapping("/challenge")
	public ModelAndView challenge() {
		
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("challenge/challengeView");
		
		return mav; 
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage() {
		
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/mypage");
		
		return mav; 
	}
	
	
	@GetMapping("/board")
	public ModelAndView board() {
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardView");
		
		return mav; 
	}
	
	@GetMapping("/challengeWrite")
	public ModelAndView challengeWrite() {
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("challenge/challengeWrite");
		
		return mav; 
	}
	
	@GetMapping("/account")
	public ModelAndView account() {
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/accountView");
		
		return mav; 
	}
	
	
	@GetMapping("/join")
	public ModelAndView join() {
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register/registerJoin");
		
		return mav; 
	}
	
	
	@GetMapping("/login")
	public ModelAndView login() {
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register/LoginPage");
		
		return mav; 
	}
	
	@GetMapping("/FindId")
	public ModelAndView FindId() {
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register/FindID");
		
		return mav; 
	}
	
	
	@GetMapping("/pwSearch")
	public ModelAndView pwSearch() {
		
		//ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register/pwSearch");
		
		return mav; 
	}
	
	
}
