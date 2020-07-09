package kr.co.sol.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.admin.dao.AdminDAO;
import kr.co.sol.admin.dto.AdminDTO;
import kr.co.sol.admin.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO adminDao;
	
	@Override
	public String Logon(AdminDTO adto) {
		return adminDao.logon(adto);
	}
}
