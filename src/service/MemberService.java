package service;

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
			return true;
		}
		return false;
	}

	public Member getMember(int num) {
		return memberDao.selectMember(num);
	}

	public Member getMemberByID(String mID) {
		return memberDao.selectMemberByID(mID);
	}
}
