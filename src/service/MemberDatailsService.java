package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import model.Member;
import model.MemberDatails;

@Service
public class MemberDatailsService implements UserDetailsService{
	@Autowired
	private MemberService memberService;
	
	@Override
	public UserDetails loadUserByUsername(String mID) throws UsernameNotFoundException {
		Member originalMember = memberService.getMemberByID(mID);
		String mPass = originalMember.getmPass();
		int mNum = originalMember.getmNum();
		List<String> authList = memberService.getAuthoritiesByMNum(mNum);
		MemberDatails member = new MemberDatails();
		member.setmID(mID);
		member.setmPass(mPass);
		for(String auth: authList) {
			member.addAuth(auth);
		}
		return member;
	}
}
