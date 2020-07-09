package kr.co.sol.admin.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.sol.admin.dto.AdminDTO;

@Mapper
public interface AdminDAO {
	String logon(AdminDTO adto) {
		return null;
	}

}
