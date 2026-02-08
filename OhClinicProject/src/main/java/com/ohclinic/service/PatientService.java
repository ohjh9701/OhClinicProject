package com.ohclinic.service;

import java.util.List;

import com.ohclinic.domain.Patient;

public interface PatientService {
	
	public int create(Patient patient) throws Exception;
	public Patient read(Patient patient) throws Exception;
	public int update(Patient patient) throws Exception;
	public int delete(Patient patient) throws Exception;
	public List<Patient> list() throws Exception;
	
}
