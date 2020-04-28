package dao;

import java.util.List;

import model.Member;

public interface MemberDao {
	public int insertMember(Member member);

	public Member selectMember(int num);

	public Member selectMemberByMID(String mID);
	
	public int insertAuthority(int mNum);
	
	public List<String> selectAuthoritiesByMNum(int mNum);
}
