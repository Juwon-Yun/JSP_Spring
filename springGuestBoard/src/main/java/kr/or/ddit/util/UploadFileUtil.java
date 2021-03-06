package kr.or.ddit.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;


public class UploadFileUtil {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(UploadFileUtil.class);
	
	public static String uploadFolder = "E:\\Java_workspace\\6.jspSpring\\springGuestBoard\\src\\main\\webapp\\resources\\images";
	
	// 내가 작성한 메소드
	public static String uploadFile(MultipartFile file) {
		String path = "E:\\Java_workspace\\6.jspSpring\\springGuestBoard\\src\\main\\webapp\\resources\\images";
		String fileName = file.getOriginalFilename();
		File target = new File(path, fileName);
		
		if ( ! new File(path).exists()) {
            new File(path).mkdirs();
        }
		
		if(target.exists()) {
			UUID uuid = UUID.randomUUID();
			fileName = uuid.toString() + fileName ;
			File target2 = new File(path, fileName);
			//변환된 파일명으로 생성
			try {file.transferTo(target2);} catch(Exception e) {e.printStackTrace();}    
		}else {
			//파일명 그대로 생성
			try {file.transferTo(target);} catch(Exception e) {e.printStackTrace();}    
		}
		
        return fileName;
	}
	// 선생님이 작성한 메소드
	//날짜 계층형 폴더
	public static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		//str : 2021-11-02
		String str = sdf.format(date);
		//2021폴더 > 11폴더 > 02폴더
		return str.replace("-", File.separator);
	}
	
	//이미지의 경우에만 섬네일 제작
	public static boolean checkImageType(File file) {
		//MIME 타입을 통해 이미지 여부 확인
		//file.toPath() : 파일 객체를 path객체로 변환
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			logger.info("contentType : " + contentType);
			//MIME 타입 정보가 image로 시작하는지 여부를 return
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//이 파일은 이미지가 아니다.
		return false;
	}
}
