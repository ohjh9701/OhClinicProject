package com.ohclinic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohclinic.domain.Doctor;
import com.ohclinic.mapper.DoctorMapper;

@Service
public class DoctorServiceImpl implements DoctorService {
	
	@Autowired
	DoctorMapper doctorMapper;

	@Override
	public Doctor read(Doctor doctor) throws Exception {
		return doctorMapper.read(doctor);
	}

}
