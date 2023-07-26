package com.smart.home.dao;

import java.util.List;

import com.smart.home.dto.ChallengesDTO;
import com.smart.home.dto.ChallengesPagingDTO;

public interface ChallengesDAO {
	// ç���� ����Ʈ ��ȸ 
	public List<ChallengesDTO> ChallengesList(ChallengesPagingDTO pDTO);

	public int ChallengesTotalRecord(ChallengesPagingDTO pDTO);
	
	public List<ChallengesDTO> ChallengesListMore(ChallengesPagingDTO pDTO);
	
	// ç���� ���
	public int ChallengeInsert(ChallengesDTO dto);
	
	
	public ChallengesDTO ChallengeSelect(int chalNo);
	
	
	public String ChallengeFileSelect(int chalNo);
	
	
	public int ChallengeUpdate(ChallengesDTO dto);
	
	// ç���� ���� 
	public int ChallengeDelete(int chalNo);
}
