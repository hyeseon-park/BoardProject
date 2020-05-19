package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import common.DownloadView;
import dao.BoardDao;
import model.Board;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	private static final String UPLOAD_PATH = "c:\\files";

	public boolean writeBoard(Board board, MultipartFile file) {
		Map<String, Object> boardMap = new HashMap<String, Object>();
		if (!file.isEmpty()) {			
			String changedName = writeFile(file);
			boardMap.put("fName", changedName);
		} 
		boardMap.put("bTitle", board.getbTitle());
		boardMap.put("bContent", board.getbContent());
		boardMap.put("bPW", board.getbPW());
		boardMap.put("bName", board.getbName());
		
		if (boardDao.insertBoard(boardMap) > 0) {
			return true;
		} else {			
			return false;
		}
	}

	private String writeFile(MultipartFile file) {
		UUID uuid = UUID.randomUUID();
		String changedName = null;
		changedName = uuid.toString() + "_" + file.getOriginalFilename();
		File targetFile = new File(UPLOAD_PATH, changedName);
		try {
			FileCopyUtils.copy(file.getBytes(), targetFile);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return changedName;
	}

	public boolean modifyBoard(Board board) {
		if (boardDao.updateBoard(board) > 0) {
			return true;
		}
		return false;
	}

	public boolean removeBoard(int bNum) {
		if (boardDao.deleteBoard(bNum) > 0) {
			return true;
		}
		return false;
	}

	public Board getBoard(int bNum) {
		return boardDao.selectBoard(bNum);
	}

	public List<Board> getAllBoards() {
		return boardDao.selectAllBoards();
	}

	public Map<String, Object> getSearchedBoards(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<String, Object>();
		int type = (Integer) param.get("type");
		String keyword = (String) param.get("keyword");
		if (type == 1) {
			param.put("title", keyword);
		} else if (type == 2) {
			param.put("content", keyword);
		} else if (type == 3) {
			param.put("title", keyword);
			param.put("content", keyword);
		} else if (type == 4) {
			param.put("name", keyword);
		}
		List<Board> boardList = boardDao.selectSearchedBoards(param);
		result.put("boardList", boardList);
		return result;
	}

	public View getAttachment(int num) {
		Board board = boardDao.selectBoard(num);
		File file = new File(UPLOAD_PATH, board.getfName());
		View view = new DownloadView(file);
		return view;
	}
}
