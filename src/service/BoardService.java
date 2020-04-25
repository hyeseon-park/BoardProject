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
		if (file.isEmpty()) {
			return true;
		} else {
			String changedName = writeFile(file);
			Map<String, Object> fileParam = new HashMap<String, Object>();
			fileParam.put("title", board.getTitle());
			fileParam.put("content", board.getContent());
			fileParam.put("pass", board.getPass());
			fileParam.put("name", board.getName());
			fileParam.put("fName", changedName);
			if (boardDao.insertBoard(fileParam) > 0) {
				return true;
			}
		}
		return false;
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
