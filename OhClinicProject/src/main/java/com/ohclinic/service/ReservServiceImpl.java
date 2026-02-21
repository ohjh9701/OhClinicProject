package com.ohclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohclinic.domain.Reserv;
import com.ohclinic.mapper.ReservMapper;

@Service
public class ReservServiceImpl implements ReservService{
	
	@Autowired
	ReservMapper reservMapper;

	@Override
	public int create(Reserv reserv) throws Exception {
		return reservMapper.create(reserv);
	}

	@Override
	public Reserv read(Reserv reserv) throws Exception {
		return null;
	}

	@Override
	public int update(Reserv reserv) throws Exception {
		return 0;
	}

	@Override
	public int delete(Reserv reserv) throws Exception {
		return 0;
	}

	@Override
	public List<Reserv> list() throws Exception {
		return reservMapper.list();
	}
	
	
	
}
