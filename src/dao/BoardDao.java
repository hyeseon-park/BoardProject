package dao;

import java.util.List;
import java.util.Map;

import model.Board;

public interface BoardDao {
	public int insertBoard(Map<String, Object> fileParam);

	public int updateBoard(Board board);

	public int deleteBoard(int num);

	public Board selectBoard(int num);

	public List<Board> selectAllBoards();
	
	public List<Board> searchBoardList(Map<String, Object> param);
}
