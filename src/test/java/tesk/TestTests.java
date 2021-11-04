package tesk;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.shopmoon.domain.AttachImageVO;
import org.shopmoon.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestTests {

	@Autowired
	private AdminMapper adminmapper;

	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	@Test
	public void taskTests() {
		
		List<AttachImageVO> fileList = adminmapper.checkFileList();
		
		List<Path> checkFilePath = new ArrayList<Path>();
		
		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\shopMoonUpload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});
		
		// 썸네일 이미지 추가
		System.out.println("checkFilePath : ");
		checkFilePath.forEach(list -> System.out.println(list));
		System.out.println("========================================");
	
		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\shopMoonUpload", vo.getUploadPath(), "s_" +  vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});
		
		System.out.println("checkFilePath(썸네일 이미지 정보 추가 후) : ");
		checkFilePath.forEach(list -> System.out.println(list));
		System.out.println("========================================");
		
		// 파일 타겟팅
		File targetDir = Paths.get("C:\\shopMoonUpload", getFolderYesterDay()).toFile();
		File[] targetFile = targetDir.listFiles();
		
		System.out.println("targetFile : ");
		for(File file : targetFile) {
			System.out.println(file);
		}
		System.out.println("========================================");
		
		
		// 타겟 파일 삭제
		List<File> removeFileList = new ArrayList<File>(Arrays.asList(targetFile));
		
		System.out.println("removeFileList(필터 전) : ");		
		removeFileList.forEach(file -> {
			System.out.println(file);
		});		
		System.out.println("========================================");		
		
		for(File file : targetFile){
			checkFilePath.forEach(checkFile ->{
				if(file.toPath().equals(checkFile)) 
					removeFileList.remove(file);	
			});
		}
		
		System.out.println("removeFileList(필터 후) : ");
		removeFileList.forEach(file -> {
			System.out.println(file);
		});
		System.out.println("========================================");
	
	}
	
	
}
