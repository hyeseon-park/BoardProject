package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDao;
import model.Board;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;

	public boolean writeBoard(Board board) {
		if (boardDao.insertBoard(board) > 0) {
			return true;
		}
		return false;
	}

	public boolean modifyBoard(Board board) {
		if (boardDao.updateBoard(board) > 0) {
			return true;
		}
		return false;
	}

	public boolean removeBoard(Board board) {
		if (boardDao.deleteBoard(board.getNum()) > 0) {
			return true;
		}
		return false;
	}

	public Board getBoard(int num) {
		return boardDao.selectBoard(num);
	}

	public List<Board> getAllBoards() {
		return boardDao.selectAllBoards();
	}
}
