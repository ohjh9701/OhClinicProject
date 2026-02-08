package com.ohclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohclinic.domain.Patient;
import com.ohclinic.mapper.PatientMapper;

@Service
public class PatientServiceImpl implements PatientService {
	
	@Autowired
	PatientMapper patientMapper;

	@Override
	public int create(Patient patient) throws Exception {
		return patientMapper.create(patient);
	}

	@Override
	public Patient read(Patient patient) throws Exception {
		return null;
	}

	@Override
	public int update(Patient patient) throws Exception {
		return 0;
	}

	@Override
	public int delete(Patient patient) throws Exception {
		return patientMapper.delete(patient);
	}

	@Override
	public List<Patient> list() throws Exception {
		return patientMapper.list();
	}

}
