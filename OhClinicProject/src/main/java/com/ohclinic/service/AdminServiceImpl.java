package com.ohclinic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohclinic.domain.Admin;
import com.ohclinic.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	@Override
	public Admin read(Admin admin) throws Exception {
		return adminMapper.read(admin);
	}

}
