package common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
	private File file;

	public DownloadView(File file) {
		this.file = file;
		setContentType("application/download;UTF-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentLengthLong(file.length());
		String fName = file.getName();
		int index = fName.indexOf("_") + 1;
		String fileName = fName.substring(index);
		fileName = URLEncoder.encode(fileName, "UTF-8");
		request.getHeader("User-Agent");
		response.setHeader("Content-Disposition", "attachement; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		FileInputStream in = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		FileCopyUtils.copy(in, out);
		out.flush();
	}
}
