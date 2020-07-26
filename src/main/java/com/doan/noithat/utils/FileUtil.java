package com.doan.noithat.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	private static final String DIR_UPLOAD = "uploads";

	public static String upload(MultipartFile multipartFile, HttpServletRequest request) throws IllegalStateException, IOException {
		String webPath = request.getServletContext().getRealPath("");
		String dirPath = webPath + DIR_UPLOAD;
		if (new File(dirPath).exists()) {
			new File(dirPath).mkdir();
		}
		String fileName = multipartFile.getOriginalFilename();
		System.out.println(fileName);
		String pathFile = dirPath + File.separator + fileName;
				multipartFile.transferTo(new File(pathFile));
				System.out.println(pathFile);
		return fileName;
	}
}
