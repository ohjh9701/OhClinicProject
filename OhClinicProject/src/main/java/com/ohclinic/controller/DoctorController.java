package com.ohclinic.controller;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohclinic.domain.Doctor;
import com.ohclinic.service.DoctorService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ohclinic")
@MapperScan(basePackages = "com.ohclinic.mapper")
public class DoctorController {
	
	@Autowired
	DoctorService doctorService;
	
	@PostMapping("/doctorLogin")
	public String doctorLogin(Doctor doctor_, Model model, HttpSession session) {
		try {
			Doctor doctor = doctorService.read(doctor_);
			session.setAttribute("loginDoctor", doctor);
			return "user/doctorMain";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/failed";
	}
}
