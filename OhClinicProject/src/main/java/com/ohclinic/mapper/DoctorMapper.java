package com.ohclinic.mapper;

import java.util.List;

import com.ohclinic.domain.Doctor;

public interface DoctorMapper {

	public Doctor read(Doctor doctor) throws Exception;
	public List<Doctor> list() throws Exception;
	public int create(Doctor doctor) throws Exception;
	public Doctor readDoctor(Doctor doctor) throws Exception;
	public int update(Doctor doctor) throws Exception;
	public int delete(Doctor doctor) throws Exception;
}
