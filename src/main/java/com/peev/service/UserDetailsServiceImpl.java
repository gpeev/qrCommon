package com.peev.service;


import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;

@Service
public class UserDetailsServiceImpl implements UserDetailsService
{

	@Override
	public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException
	{
		return null;  //To change body of implemented methods use File | Settings | File Templates.
	}
}
