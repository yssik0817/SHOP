package kr.co.sol.custom.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.member.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	int idCheck(String id);

	int memberJoin(MemberDTO mdto);

	String logonProc(MemberDTO mdto);

}
