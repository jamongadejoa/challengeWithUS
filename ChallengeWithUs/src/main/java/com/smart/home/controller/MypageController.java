package com.smart.home.controller;

import com.smart.home.dto.ChallengeDTO;


import com.smart.home.dto.ChallengeDetailDTO;
import com.smart.home.dto.ChallengeListDTO;
import com.smart.home.dto.DepositDTO;
import com.smart.home.dto.MemberAchievementDTO;
import com.smart.home.dto.MemberDTO;
//import com.smart.home.dto.MemberGradeDTO;
import com.smart.home.dto.QaDTO;

import lombok.Data;

import com.smart.home.service.BoardService;
import com.smart.home.service.ChallengeService;
import com.smart.home.service.DepositService;
import com.smart.home.service.MemberAchievementService;
import com.smart.home.service.MemberAchievementServiceImpl;
//import com.smart.home.service.MemberGradeServiceImpl;
import com.smart.home.service.MemberService;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/myPage")
public class MypageController {

    @Autowired
    private ChallengeService Chalservice;
    
    @Autowired
    private MemberService Memservice;
    
    @Autowired
    private DepositService Deposervice;
    
    @Autowired
    private MemberAchievementService MemAchiservice;
    
    @Autowired
    private BoardService Boservice;
    
    // ���ǿ��� ID �޾ƿ��� �޼ҵ� ���� ����
    // gmifs = Get Member Id From Session
    private String gmifs(HttpServletRequest request) {
    	return (String) request.getSession().getAttribute("logId");
    }

    // ���� ç���� �������� �̵�
    
    @GetMapping("/myChallenge")
    public ModelAndView myChallenges(HttpServletRequest request) {
        
    	// 1. �α��� ������� ���̵� (���ǿ��� �޾ƿ��Ƿ� ���� �޾ƿ� �ʿ䰡 ����.)
    	String memberId = gmifs(request);
        
        
        // 2. �α��� ����ڰ� �����ߴ�, ��� ç������ ���� �� �޼�Ƚ���� ȸ����� (DetailDTO�� �������� �ʿ��� �͵鸸 �־ �޾ƿ´�.)
        int myAchievementCnt = MemAchiservice.getmyAchievementCnt(memberId);
        String myGrade = MemAchiservice.getmyGrade(memberId);
    
        // 3. �α��� ������� ���� ���� ��� ç����
        //(�ʿ��� �͵鸸 ���� DTO�� ���� : chalTitle,chalContent, ChalStatus, achievementRate..) 
        // ����Ʈ �������� �޾ƿ´�. 
        List<ChallengeListDTO> myChallenges = Chalservice.getAllChallenges(memberId);
        
        // Model And View
        ModelAndView mav = new ModelAndView();
        
        // 3. <���� ç����>�� ������ �α��� ������� ���̵�, �޼� Ƚ��, ȸ�����
        mav.addObject("memberId", memberId); // �α��� ������� ���̵�
        mav.addObject("myAchievementsCnt", myAchievementCnt); // �޼� Ƚ��
        mav.addObject("myGrade", myGrade); // ȸ�����
   
        // 3. ç���� ����Ʈ (�޼���, ç������, ç���� ���ϸ�, ç���� ������, ç���� ���� ����)�� Model And View�� �߰�
        mav.addObject("myChallenges", myChallenges); 
        
        
        
        mav.setViewName("Mypage/Mychallenge");
        return mav;
    }

    // ��ġ�� ���� �������� �̵�
    @GetMapping("/myDeposit")
    public ModelAndView getMyDeposit(HttpServletRequest request) {
    	
    	// 1. �α��� ������� ���̵� (���ǿ��� �޾ƿ��Ƿ� ���� �޾ƿ� �ʿ䰡 ����.)
    	String memberId = gmifs(request);;
    	
    	// 2. �α��� ������� ��ġ�ݿ� ���� ������ ��ġ�� ������ �޾ƿ´�.
    	int myDepositBalance = Deposervice.getmyBalance(memberId);
    	List<DepositDTO> myDepositTransactions = Deposervice.getMyDepositTransactions(memberId);
    	
    	// Model And view
    	ModelAndView mav = new ModelAndView();
    	
    	// 3. <��ġ�� ����>�� ������ �α��� ������� ���̵�, �� ��ġ��, �����ϱ�(��ư)
    	mav.addObject("memberId", memberId); // �α��� ������� ���̵�
    	mav.addObject("myDepositBalance",myDepositBalance); // ��ġ�� �ܾ�
    	
    	// 3. <��ġ�� ����>�� ������ ��ġ�� ��ȣ, ��ġ�� ����, �ݾ� �� Model And View�� �߰�
    	mav.addObject("myDepositTransactions", myDepositTransactions);
    	
    	
    	
    	mav.setViewName("Mypage/Mydeposit");
    	
        return mav;
    }
    
   
    // ȸ�� ���� ���� �������� �̵�
    @PatchMapping("/myInfo")
    public ModelAndView updateMyMemberInfo(@RequestBody MemberDTO member, HttpServletRequest request) {
        // �α��� ������� ���̵� (���ǿ��� �޾ƿ��Ƿ� ���� �޾ƿ� �ʿ䰡 ����.)
    	String memberId = gmifs(request);
    	member.setMemberId(memberId);

        // �α��� ������� ������ ������Ʈ�Ѵ�. 
        Memservice.memberUpdate(member);
        
        // Model And View
        ModelAndView mav = new ModelAndView();
        
        // ȸ�� ������ Model And View�� �߰�
        mav.addObject("member", member);
        
        mav.setViewName("Mypage/MyInfo");
        
        return mav;
    }

        

    
//    
//    // �� ���� �������� �̵� 
//    @GetMapping("/Qa")
//    public ModelAndView getQaBoard(HttpServletRequest request) {
//    	// 1. �α��� ������� ���̵� (���ǿ��� �޾ƿ��Ƿ� ���� �޾ƿ� �ʿ䰡 ����.)
//    	String memberId = gmifs(request);;
//        
//        // 2. �α��� ������� ���� ������ �޾ƿɴϴ�.
//        List<QaDTO> myQaList = Boservice.getMyQaList(memberId);
//        
//        // Model And view
//        ModelAndView mav = new ModelAndView();
//        
//        // 3. <�� ���� �Խ���>�� ������ QaNO, QaTitle, memberId, QaDate, QaHit
//        mav.addObject("memberId", memberId); // �α��� ������� ���̵�
//        mav.addObject("myQaList", myQaList); // ���� ���� ����Ʈ
//        
//        mav.setViewName("Mypage/Qa");
//        return mav;
//    }
}
