package com.itwill.shape.service;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.shape.domain.UserInfo;
import com.itwill.shape.dto.UserCreateDto;
import com.itwill.shape.dto.UserInfoSelectByIdDto;
import com.itwill.shape.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserInfoService {
	
	private final UserInfoRepository userInfoRepository;
	
	/**
	 * 관리자 생성을 위한 메소드
	 * dto={id, pwd, name}
	 * 
	 * @param dto
	 * @return
	 */
	public int create(UserCreateDto dto) {
		log.info("create(dto = {})", dto);
		
		return userInfoRepository.insertAdmin(dto.toEntityAdmin());
	}
	
	/**
	 * 김세이 06.01
	 * 마이페이지 첫 화면 개인정보를 위한 메소드
	 * dto={name, gender, id, birth, phone, email}
	 * 
	 * @param id
	 * @return
	 */
	public UserInfoSelectByIdDto selectById(String id) {
		log.info("selectById()");
		log.info("id={}", id);
		UserInfo entity = userInfoRepository.selectById(id);
		
		UserInfoSelectByIdDto dto = UserInfoSelectByIdDto.fromEntity(entity);
		
		return dto;
	}

	/**
	 * 김세이 06.02 
	 * 마이페이지 프로필 사진 변경을 위한 메서드 
	 * @param id, imageFile 
	 * @return int 
	 */
	public int imageModify(String id, MultipartFile imageFile) throws IOException {
		log.info("imageModify({})", id);
		
		        // 이미지 파일을 읽어서 byte 배열로 변환
		        byte[] imageData = imageFile.getBytes();

		        // 변환된 byte 배열을 데이터베이스에 저장
		    return userInfoRepository.imageModify(id,imageData);
	}

}
