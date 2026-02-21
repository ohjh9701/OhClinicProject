package com.ohclinic.service;

import java.util.List;

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

	@Override
	public List<Doctor> list() throws Exception {
		return doctorMapper.list();
	}

	@Override
	public int create(Doctor doctor) throws Exception {
		return doctorMapper.create(doctor);
	}

	@Override
	public Doctor readDoctor(Doctor doctor) throws Exception{
		return doctorMapper.readDoctor(doctor);
	}

	@Override
	public int update(Doctor doctor) throws Exception {
		return doctorMapper.update(doctor);
	}

	@Override
	public int delete(Doctor doctor) throws Exception {
		return doctorMapper.delete(doctor);
	}

}
