package com.ohclinic.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohclinic.domain.Doctor;
import com.ohclinic.domain.Patient;
import com.ohclinic.domain.Reserv;
import com.ohclinic.service.DoctorService;
import com.ohclinic.service.PatientService;
import com.ohclinic.service.ReservService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;



@Slf4j
@Controller
@RequestMapping("/ohclinic")
@MapperScan(basePackages = "com.ohclinic.mapper")
public class ReservController {
	
	@Autowired
	ReservService reservService;
	
	@Autowired
	DoctorService doctorService;
	
	@Autowired
	PatientService patientService;
	
	@GetMapping("/reserv/list")
	public String getMethodName(Model model) {
		try {
			List<Reserv> reservList = reservService.list();
			log.info(reservList.toString());
			model.addAttribute("reservList",reservList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/reserv/list";
	}
	
	@GetMapping("/reserv/registerForm")
	public String reservRegisterForm(Model model) {
		
		try {
			List<Doctor> doctorList = doctorService.list();
			List<Patient> patientList = patientService.list();
			
			model.addAttribute("patientList",patientList);
			model.addAttribute("doctorList",doctorList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/reserv/registerForm";
	}
	
	@PostMapping("/reserv/register")
	public String postMethodName(Reserv reserv, Model model) {
		int count;
		try {
			count = reservService.create(reserv);
			
			if(count > 0) {
				return "redirect:/ohclinic/reserv/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", "의사 등록 오류입니다."); // 에러 메시지 전달
		return "user/failed";
	}
	
	
	
	
}
