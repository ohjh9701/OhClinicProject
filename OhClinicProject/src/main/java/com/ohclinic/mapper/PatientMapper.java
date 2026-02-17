package com.ohclinic.mapper;

import java.util.List;

import com.ohclinic.domain.Patient;


public interface PatientMapper {

	public int create(Patient patient) throws Exception;
	public Patient read(Patient patient) throws Exception;
	public int update(Patient patient) throws Exception;
	public int delete(Patient patient) throws Exception;
	public List<Patient> list() throws Exception;
	public List<Patient> patientSearch(Patient patient) throws Exception;
	
}
