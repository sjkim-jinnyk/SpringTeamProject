package com.spring.member;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@RequestMapping("imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		
		// 이미지가 저장될 폴더(배포 디렉토리)
		String uploadPath = "C:\\NCS\\workspace(spring)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SpringProject\\resources\\img\\upload";
		
		OutputStream outStream = new FileOutputStream(new File(uploadPath+fileName));
		outStream.write(bytes);
		outStream.flush();
		
		String callback = request.getParameter("CKEditorFuncNum");
		
		String fileURL = request.getContextPath() + "/img/upload/" + fileName;
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ", '" + fileURL + "',' 이미지가 업로드되었습니다.'");
		out.println("</script>");
		
		out.flush();
		
	}
}
