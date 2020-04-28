package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemberDao;
import model.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;

	public boolean signUpMember(Member member) {
		if (memberDao.insertMember(member) > 0) {
			if (memberDao.insertAuthority(member.getmNum()) > 0) {
				return true;
			}
			return false;
		}
		return false;
	}

	public Member getMember(int num) {
		return memberDao.selectMember(num);
	}

	public Member getMemberByMID(String mID) {
		return memberDao.selectMemberByMID(mID);
	}

	public List<String> getAuthoritiesByMNum(int mNum) {
		return memberDao.selectAuthoritiesByMNum(mNum);
	}
}
