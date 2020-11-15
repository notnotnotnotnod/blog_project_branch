package com.study.springboot.service;

import java.io.FileOutputStream;
import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dao.IMemberDao;

import com.study.springboot.dto.MemberDto;

@Service
public class FileUploadService {
	
	@Autowired
	IMemberDao memberDao;
	
	@Autowired
	MemberDto memberDto;
	
	@Autowired
	IBoardService board_service;
	
	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
	private static String SAVE_PATH = "/upload/"; // 디폴트는 C:/upload폴더에 생성됨.
	private static String PREFIX_URL = "/upload/";

	String filename;
	public String restore(MultipartFile multipartFile,String name,String number) {



		try {
			String savepath = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			savepath = savepath.replace("\\", "/");
			savepath = savepath.replace("/bin/main/static", "/src/main/resources/static");
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;

			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());


			// 서버에서 저장 할 파일 이름
			filename = name+"_"+number+"_"+genSaveFileName(extName);

			writeFile(multipartFile, filename);

		} catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();
			throw new RuntimeException(e);
		}
		return "main";
	}
	
	public String getname() {
		
		return filename;
	}

	int i = 1;

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		
		
		fileName += i;
		fileName += extName;
		i++;

		return fileName;
	}

	// 파일을 실제로 write 하는 메서드
	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		System.out.println("savefile:" + SAVE_PATH + "/" + saveFileName);

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();

		return;
	}
}