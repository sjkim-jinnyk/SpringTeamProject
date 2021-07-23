package com.spring.member;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	private String uploadPath = "C:\\NCS\\workspace(spring)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SpringProject\\resources\\ckUpload";
	
	@RequestMapping("imageUpload.do")
	@ResponseBody
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws IOException {
		
		logger.info("imageUpload 컨트롤러 진입 =========================================================");
		
		OutputStream os = null;
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		try {
			
			String fileName = System.currentTimeMillis() + "_" + upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			String ckUploadPath = uploadPath + File.separator + fileName;
			
			os = new FileOutputStream(new File(ckUploadPath));
			os.write(bytes);
			os.flush();
			
			String callback = request.getParameter("CKEditorFuncNum");
			out = response.getWriter();
			String fileUrl = "resources/ckUpload/" + fileName;
			
			out.println("<script> window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "', '이미지를 업로드하였습니다.') </script>");
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(os != null) os.close();
				if(out != null) out.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return;
		
	}
}
