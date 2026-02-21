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
	
	@GetMapping("/adminMain")
	public String adminMain() {
	    return "user/adminMain"; 
	}
	
	
	
}
