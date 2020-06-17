package com.happyhouse.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.happyhouse.domain.QnA;
import com.happyhouse.repository.QnARepository;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnARepository repository;

	private static final String SAVE_PATH = "/Users/seok/Desktop/seok/git/spring/STS-WorkSpace/HouseDeal/HappyHouse/src/main/resources/static/images";
	private static final String PREFIX_URL = "/Users/seok/Desktop/seok/git/spring/STS-WorkSpace/HouseDeal/HappyHouse/src/main/resources/static/images";
	
	@Override
	public List<QnA> findAll(String key, String word) throws Exception {
		HashMap<String, String> map = new HashMap<>();
		map.put("key", key);
		map.put("word", word);
		return repository.selectAll(map);
	}

	@Override
	public QnA findByQnANo(int no) throws Exception {
		return repository.select(no);
	}

	@Override
	public int regitry(MultipartFile file, QnA qna) throws Exception {
		String url = null;
		int result = 0;
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = null;
			try {
				extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				Long size = file.getSize();
				// 서버에서 저장 할 파일 이름
				String saveFileName = genSaveFileName(extName);
				System.out.println(size);
				writeFile(file, saveFileName);
				url = PREFIX_URL + saveFileName;
				qna.setQnaImage(saveFileName);
				result = repository.insert(qna);
			} catch (Exception e) {
				qna.setQnaImage("no_image.png");
				result = repository.insert(qna);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return result;
	}

	@Override
	public List<QnA> selectReply(int no) throws Exception {
		List<QnA> list = repository.selectReply(no);
		return list;
	}

	@Override
	public int modify(QnA qua) throws Exception {
		return repository.update(qua);
	}

	@Override
	public int remove(int no) throws Exception {
		System.out.println(no);
		return repository.delete(no);
	}

	@Override
	public int regitryReply(QnA qna) throws Exception {
		return repository.insertReply(qna);
	}

	@Override
	public int modifyReply(QnA qna) throws Exception {
		return repository.updateReply(qna);
	}

	@Override
	public int removeReply(int no) throws Exception {
		return repository.deleteReply(no);
	}

	@Override
	public QnA getReplyCount(int no) throws Exception {
		return repository.getReplyCount(no);
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}

	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();

		return result;
	}

}
