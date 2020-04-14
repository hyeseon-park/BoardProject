package dao;

import java.util.List;
import java.util.Map;

import model.Board;

public interface BoardDao {
	public int insertBoard(Board board);

	public int updateBoard(Board board);

	public int deleteBoard(int num);

	public Board selectBoard(int num);

	public List<Board> selectAllBoards();
	
	public int insertFile(Map<String, Object> fileParam);
}
