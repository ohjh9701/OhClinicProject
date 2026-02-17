package com.ohclinic.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohclinic.domain.Admin;
import com.ohclinic.service.AdminService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;



@Slf4j
@Controller
@RequestMapping("/ohclinic")
@MapperScan(basePackages = "com.ohclinic.mapper")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@PostMapping("/adminLogin")
	public String adminLogin(Admin admin, Model model) {
		try {
			adminService.read(admin);
			return "user/adminMain";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/failed";
	}
	
	@GetMapping("/adminMain")
	public String adminMain() {
	    return "user/adminMain"; 
	}
	
	
	
}
