package com.smart.home.dao;

import java.util.List;
import com.smart.home.dto.BoardDTO;
import com.smart.home.dto.PagingDTO;

public interface BoardDAO {
	// 글등록 
	public int boardWriteOk(BoardDTO dto);
	// 글목록선택 (paging, search)
	public List<BoardDTO> boardList(PagingDTO pDTO);
	// 총 레코드 수
	public int totalRecord(PagingDTO pDTO);
	// 1개 레코드 선택(글내용보기)
	public BoardDTO getBoard(int no);
	// 조회수 증가
	public void hitCount(int no);
	// 글 수정(update)
	public int boardEdit(BoardDTO dto);
	public int boardDel(int no, String userid);
	
}
