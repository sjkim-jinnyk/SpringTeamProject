package com.spring.model;

import java.io.File;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class Upload {
	
	private String filePath = "C:\\NCS\\workspace(spring)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\SpringProject\\resources\\img\\upload";

	public HashMap fileUpload(MultipartHttpServletRequest mRequest) {
		
		HashMap hm = new HashMap();
		boolean isUpload = false;
		String fileName = "";
		
		String uploadPath = filePath;
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			
			fileName = originalFileName;
			
			File path = new File(uploadPath);
			
			if(!path.exists()) {	// 폴더가 없는 경우 폴더 생성
				path.mkdirs();
			}
			
			if(fileName != null && !fileName.equals("")) {
				fileName = System.currentTimeMillis() + "_" + fileName;
				
				try {
					File origin = new File(uploadPath+"/"+fileName);
					mFile.transferTo(origin);
					
					isUpload = true;
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			hm.put("isUpload", isUpload);
			hm.put("fileName", fileName);
		}
	
		return hm;
	}
}
