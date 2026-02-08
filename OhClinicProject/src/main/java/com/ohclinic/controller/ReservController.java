package com.ohclinic.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohclinic.service.ReservService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ohclinic")
@MapperScan(basePackages = "com.ohclinic.mapper")
public class ReservController {
	
	@Autowired
	ReservService reservService;
	
	
	
}
