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

// @Controller : 모델뷰를 리턴
//			: ModelAnvView / Model(모델) String(view)
// @controller
// @responsebody 이렇게 하면 view없이 model만 반환
// @restcontroller와 같은 역할을 하는데 의미는
// (jsp바뀌지 않고 같은 jsp에서 string, json같은 데이터만 전송한다)

// @RestController : Model이 리턴된다. 
//				   : Model+viewPage => ModelAndView로 리턴


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService service;
		
	@GetMapping("/boardList")
	
	public ModelAndView boardList(PagingDTO pDTO) {
		System.out.println(pDTO);
	      // 총 레코드 수 선택      
	      pDTO.setTotalRecord(service.totalRecord(pDTO));
	      // 해당페이지 레코드 선택
	      List<BoardDTO> list = service.boardList(pDTO);
	      // ModelAndView
	      System.out.println(list);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list", list); // 아래 jsp파일에서 사용할 수 있는 변수가 됨
	      mav.addObject("pDTO", pDTO); // 현재페이지, 검색어, 검색키
	      mav.setViewName("board/boardList");
	      return mav;
	   }
	
	   // 글쓰기 폼으로 이동
	   @GetMapping("/qaBoardWrite")
	   public ModelAndView boardWrite() {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("board/qaBoardWrite");
	      return mav;
	   }
	   
	// 글쓰기 DB기록
	   @PostMapping("/boardWriteOk")
	   public ResponseEntity<String> boardWriteOk(BoardDTO dto, HttpServletRequest request) {
	      // HttpServletRequest -> request, HttpSession
	      // HttpSession -> Session만
	      
	      
	      // no, hit, writedate -> 오라클에서 처리
	      // userid -> 세션
	      
	      dto.setMemberId((String)request.getSession().getAttribute("logId")); // object 객체로 반환되기 때문에 String으로 타입캐스팅
	      // ip - request 객체에 있음
	      
	      int result = 0;
	      try {
	         result = service.boardWriteOk(dto);
	      } catch(Exception e) {
	         System.out.println("게시판 글등록 예외발생..."+ e.getMessage());
	      }
	      // 등록결과에 따른 스크립트 생성하기
	      String tag = "<script>";
	      if (result>0) { // 성공 -> 게시판목록
	         tag += "location.href='/home/board/boardlist';";
	      } else { // 실패 -> 글 등록 폼
	         tag += "alert('글 등록이 실패하였습니다.');";
	         tag += "history.back();";
	      }
	      tag += "</script>";
	      
	      // 프론트언어를 백엔드에서 구현
	      //      ResponseEntity 객체는 프론트 페이지를 작성할 수 있다.
	      HttpHeaders headers = new HttpHeaders();
	      headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
	      return new ResponseEntity<String>(tag, headers, HttpStatus.OK);
	   }
	   
	   // 글내용 보기
	   @GetMapping("/qaBoardView")
	   public ModelAndView qaBoardView(int no, PagingDTO pDTO) { // pDTO의 nowpage를 사용하기 위함인데 잘 살펴볼것
	      
	      // 조회수 증가
	      service.hitCount(no);
	      // 레코드 선택
	      BoardDTO dto = service.getBoard(no);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("dto", dto);
	      mav.addObject("pDTO", pDTO); // 이미 검색키워드 저장 존재?
	      mav.setViewName("board/qaBoardView");
	      
	      return mav;
	   } 
	   
	   // 글 수정하기
	   @GetMapping("/qaBoardEdit")
	   public ModelAndView boardEdit(int no) { 
	      // 수정페이지에서 수정하지 않고 이전 페이지로 돌아가고
	      // 이전페이지에서 목록돌아가기 눌렀을때 검색어 유지 기능 시도
	      
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
	      if (result>0) { // 글수정 성공 -> 글내용보기
	         mav.setViewName("redirect:boardView");
	      } else {// 글수정 실패 -> 수정폼으로
	         mav.setViewName("redirect:qaBoardEdit");
	      }
	      return mav;
	   }
	   
	      // 글삭제
	      @GetMapping("/boardDel")
	      public ModelAndView boardDel(int no, HttpSession session) {
	         int result = service.boardDel(no, (String)session.getAttribute("logId"));
	         
	         ModelAndView mav = new ModelAndView();
	         if(result>0) { // 삭제 성공 -> 글목록
	            mav.setViewName("redirect:boardlist");
	         } else { // 삭제 실패 -> 글내용
	            mav.addObject("no", no);
	            mav.setViewName("redirect:boardView");
	         }
	         return mav;
	   

	      }
}

