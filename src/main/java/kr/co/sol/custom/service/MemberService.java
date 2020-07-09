package kr.co.sol.custom.service;

import kr.co.sol.member.dto.MemberDTO;

public interface MemberService {
	//인터페이스는 기본적으로 접근 제한자가 public이다
	int idCheck(String id);
	int memberJoin(MemberDTO mdto);
	String logonProc(MemberDTO mdto);
	int memberUpdate(MemberDTO mdto);
	MemberDTO memberSelect(MemberDTO mdto);
}
