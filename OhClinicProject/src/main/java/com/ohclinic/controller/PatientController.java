package com.ohclinic.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ohclinic.domain.Doctor;
import com.ohclinic.domain.Patient;
import com.ohclinic.service.DoctorService;
import com.ohclinic.service.PatientService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;




@Slf4j
@Controller
@RequestMapping("/ohclinic")
@MapperScan(basePackages = "com.ohclinic.mapper")
public class PatientController {
	
	@Autowired
	PatientService patientService;
	
	@Autowired
	DoctorService doctorService;
	
	@GetMapping("/patient/list")
	public String patientList(Model model) {
		
		try {
			List<Patient> patientList = patientService.list();
			model.addAttribute("patientList",patientList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/patient/list";
	}
	
	@GetMapping("/patient/createForm")
	public String patientCreateForm(Model model) {
		List<Doctor> doctorList;
		try {
			doctorList = doctorService.list();
			model.addAttribute("doctorList", doctorList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "user/patient/createForm";
	}
	
	@PostMapping("/patient/create")
	public String patientCreate(Patient patient, Model model) {
		
		int count;
		try {
			count = patientService.create(patient);
			
			if(count > 0) {
				return "redirect:/ohclinic/patient/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", "환자 등록 오류입니다."); // 에러 메시지 전달
		return "user/failed";
	}
	
	@GetMapping("/patient/delete")
	public String patientDelete(Patient patient, Model model) {
		int count;
		try {
			count = patientService.delete(patient);
			
			if(count > 0) {
				return "redirect:/ohclinic/patient/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", "환자 등록 오류입니다."); // 에러 메시지 전달
		return "user/failed";
	}
	
	@GetMapping("/patient/updateForm")
	public String patientUpdateForm(Patient p, Model model) {
		log.info("%d".formatted(p.getNo()));
	    try {
	        Patient patient = patientService.read(p);
	        if(patient == null) return "redirect:/ohclinic/patient/list";
	        
	        model.addAttribute("patient", patient);
	        model.addAttribute("doctorList", doctorService.list()); 
	        
	        log.info(patient.toString());
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "user/patient/updateForm";
	}
	
	@PostMapping("/patient/update")
	public String patientUpdate(Patient patient, Model model) {
		try {
	        int count = patientService.update(patient);
	        
	        if(count > 0) {
				return "redirect:/ohclinic/patient/list";
			}
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		model.addAttribute("msg", "환자 수정 오류입니다.");
		return "user/failed";
	}
	
	@GetMapping("/patient/search")
	public String searchPatient(Patient patient, Model model) {
		log.info(patient.toString());
		List<Patient> patientList = null;
		try {
			patientList = patientService.patientSearch(patient);
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info(patientList.toString());
		model.addAttribute("patientList",patientList);
		
		return "user/patient/list";
	}
	
	
}
