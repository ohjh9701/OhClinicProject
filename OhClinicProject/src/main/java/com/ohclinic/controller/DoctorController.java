package com.ohclinic.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohclinic.domain.Doctor;
import com.ohclinic.domain.Patient;
import com.ohclinic.service.DoctorService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;



@Slf4j
@Controller
@RequestMapping("/ohclinic")
@MapperScan(basePackages = "com.ohclinic.mapper")
public class DoctorController {
	
	@Autowired
	DoctorService doctorService;
	
	@GetMapping("/doctor/manage")
	public String doctorManageList(Model model) {
		
		try {
			List<Doctor> doctorList = doctorService.list();
			log.info(doctorList.toString());
			model.addAttribute("doctorList",doctorList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/doctor/manageList";
	}
	
	@GetMapping("/doctor/registerForm")
	public String doctorRegisterForm(Model model) {
		return "user/doctor/registerForm";
	}
	
	@PostMapping("/doctor/register")
	public String postMethodName(Doctor doctor, Model model) {
		
		int count;
		try {
			count = doctorService.create(doctor);
			
			if(count > 0) {
				return "redirect:/ohclinic/doctor/manage";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", "의사 등록 오류입니다."); // 에러 메시지 전달
		return "user/failed";
	}
	
	@GetMapping("/doctor/updateForm")
	public String doctorUpdateForm(Doctor doctor, Model model) {
		Doctor doctor_ = null;
		try {
			doctor_ = doctorService.readDoctor(doctor);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("doctor", doctor_);
		return "user/doctor/updateForm";
	}
	
	@PostMapping("/doctor/update")
	public String doctorUpdate(Doctor doctor, Model model) {
		try {
	        int count = doctorService.update(doctor);
	        
	        if(count > 0) {
				return "redirect:/ohclinic/doctor/manage";
			}
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		model.addAttribute("msg", "의사 수정 오류입니다.");
		return "user/failed";
	}
	
	@GetMapping("/doctor/delete")
	public String doctorDelete(Doctor doctor, Model model) {
		try {
	        int count = doctorService.delete(doctor);
	        
	        if(count > 0) {
				return "redirect:/ohclinic/doctor/manage";
			}
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		model.addAttribute("msg", "의사 삭제 오류입니다.");
		return "user/failed";
	}
	
	
	
}
