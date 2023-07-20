package com.smart.home.controller;

import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.smart.home.dto.BoardDTO;
import com.smart.home.dto.PagingDTO;
import com.smart.home.service.BoardService;

// @Controller : �𵨺並 ����
//			: ModelAnvView / Model(��) String(view)
// @controller
// @responsebody �̷��� �ϸ� view���� model�� ��ȯ
// @restcontroller�� ���� ������ �ϴµ� �ǹ̴�
// (jsp�ٲ��� �ʰ� ���� jsp���� string, json���� �����͸� �����Ѵ�)

// @RestController : Model�� ���ϵȴ�. 
//				   : Model+viewPage => ModelAndView�� ����


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;
		
	@GetMapping("/boardList")
	
	public ModelAndView boardList(PagingDTO pDTO) {
		System.out.println(pDTO);
	      // �� ���ڵ� �� ����      
	      pDTO.setTotalRecord(service.totalRecord(pDTO));
	      // �ش������� ���ڵ� ����
	      List<BoardDTO> list = service.boardList(pDTO);
	      // ModelAndView
	      System.out.println(list);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list", list); // �Ʒ� jsp���Ͽ��� ����� �� �ִ� ������ ��
	      mav.addObject("pDTO", pDTO); // ����������, �˻���, �˻�Ű
	      mav.setViewName("board/boardList");
	      return mav;
	   }
	
	   // �۾��� ������ �̵�
	   @GetMapping("/qaBoardWrite")
	   public ModelAndView boardWrite() {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("board/qaBoardWrite");
	      return mav;
	   }
	   
	// �۾��� DB���
	   @PostMapping("/boardWriteOk")
	   public ResponseEntity<String> boardWriteOk(BoardDTO dto, HttpServletRequest request) {
	      // HttpServletRequest -> request, HttpSession
	      // HttpSession -> Session��
	      
	      
	      // no, hit, writedate -> ����Ŭ���� ó��
	      // userid -> ����
	      
	      dto.setMemberId((String)request.getSession().getAttribute("logId")); // object ��ü�� ��ȯ�Ǳ� ������ String���� Ÿ��ĳ����
	      // ip - request ��ü�� ����
	      
	      int result = 0;
	      try {
	         result = service.boardWriteOk(dto);
	      } catch(Exception e) {
	         System.out.println("�Խ��� �۵�� ���ܹ߻�..."+ e.getMessage());
	      }
	      // ��ϰ���� ���� ��ũ��Ʈ �����ϱ�
	      String tag = "<script>";
	      if (result>0) { // ���� -> �Խ��Ǹ��
	         tag += "location.href='/home/board/boardlist';";
	      } else { // ���� -> �� ��� ��
	         tag += "alert('�� ����� �����Ͽ����ϴ�.');";
	         tag += "history.back();";
	      }
	      tag += "</script>";
	      
	      // ����Ʈ�� �鿣�忡�� ����
	      //      ResponseEntity ��ü�� ����Ʈ �������� �ۼ��� �� �ִ�.
	      HttpHeaders headers = new HttpHeaders();
	      headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
	      return new ResponseEntity<String>(tag, headers, HttpStatus.OK);
	   }
	   
	   // �۳��� ����
	   @GetMapping("/qaBoardView")
	   public ModelAndView qaBoardView(int no, PagingDTO pDTO) { // pDTO�� nowpage�� ����ϱ� �����ε� �� ���캼��
	      
	      // ��ȸ�� ����
	      service.hitCount(no);
	      // ���ڵ� ����
	      BoardDTO dto = service.getBoard(no);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("dto", dto);
	      mav.addObject("pDTO", pDTO); // �̹� �˻�Ű���� ���� ����?
	      mav.setViewName("board/qaBoardView");
	      
	      return mav;
	   } 
	   
	   // �� �����ϱ�
	   @GetMapping("/qaBoardEdit")
	   public ModelAndView boardEdit(int no) { 
	      // �������������� �������� �ʰ� ���� �������� ���ư���
	      // �������������� ��ϵ��ư��� �������� �˻��� ���� ��� �õ�
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("dto", service.getBoard(no));
	      mav.setViewName("board/qaBoardEdit");
	      return mav;
	      
	   }
	   
	   @PostMapping("/boardEditOk") // no, subject, content
	   public ModelAndView boardEditOk(BoardDTO dto, HttpSession session) {
//	      dto.setMemberId((String)session.getAttribute("logId"));
	      
	      int result = service.boardEdit(dto);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("no", dto.getQANo());
	      if (result>0) { // �ۼ��� ���� -> �۳��뺸��
	         mav.setViewName("redirect:boardView");
	      } else {// �ۼ��� ���� -> ����������
	         mav.setViewName("redirect:qaBoardEdit");
	      }
	      return mav;
	   }
	   
	      // �ۻ���
	      @GetMapping("/boardDel")
	      public ModelAndView boardDel(int no, HttpSession session) {
	         int result = service.boardDel(no, (String)session.getAttribute("logId"));
	         
	         ModelAndView mav = new ModelAndView();
	         if(result>0) { // ���� ���� -> �۸��
	            mav.setViewName("redirect:boardlist");
	         } else { // ���� ���� -> �۳���
	            mav.addObject("no", no);
	            mav.setViewName("redirect:boardView");
	         }
	         return mav;
	   

	      }
}

