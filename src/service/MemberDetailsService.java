package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import model.Member;
import model.MemberDetails;

@Component
public class MemberDetailsService implements UserDetailsService {
	@Autowired
	private MemberService memberService;

	@Override
	public UserDetails loadUserByUsername(String mID) throws UsernameNotFoundException {
		Member originalMember = memberService.getMemberByMID(mID);
		String mPW = originalMember.getmPW();
		int mNum = originalMember.getmNum();
		
		MemberDetails member = new MemberDetails();
		member.setmID(mID);
		member.setmPW(mPW);
		
		List<String> authList = memberService.getAuthoritiesByMNum(mNum);
		for (String auth : authList) {
			member.addAuth(auth);
		}
		return member;
	}
}
