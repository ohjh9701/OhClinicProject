package com.ohclinic.service;

import java.util.List;

import com.ohclinic.domain.Reserv;

public interface ReservService {
	
	public int create(Reserv reserv) throws Exception;
	public Reserv read(Reserv reserv) throws Exception;
	public int update(Reserv reserv) throws Exception;
	public int delete(Reserv reserv) throws Exception;
	public List<Reserv> list() throws Exception;
	
}
