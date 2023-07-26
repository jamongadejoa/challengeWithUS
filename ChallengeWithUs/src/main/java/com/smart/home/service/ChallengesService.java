package com.smart.home.service;

import java.util.List;

import com.smart.home.dto.ChallengesDTO;
import com.smart.home.dto.ChallengesPagingDTO;

public interface ChallengesService {

	public List<ChallengesDTO> ChallengesList(ChallengesPagingDTO pDTO);

	public int ChallengesTotalRecord(ChallengesPagingDTO pDTO);

	public List<ChallengesDTO> ChallengesListMore(ChallengesPagingDTO pDTO);

	public int ChallengeInsert(ChallengesDTO dto);

	public ChallengesDTO ChallengeSelect(int chalNo);

	public String ChallengeFileSelect(int chalNo);

	public int ChallengeUpdate(ChallengesDTO dto);

	public int ChallengeDelete(int chalNo);

	

}
