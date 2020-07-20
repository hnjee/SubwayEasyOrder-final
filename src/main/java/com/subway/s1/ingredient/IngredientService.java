package com.subway.s1.ingredient;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.subway.s1.ingredient.ingreSoldout.IngreSoldoutRepository;
import com.subway.s1.ingredient.ingreSoldout.IngreSoldoutVO;
import com.subway.s1.ingredient.ingredientFile.IngredientFileRepository;
import com.subway.s1.ingredient.ingredientFile.IngredientFileVO;
import com.subway.s1.member.MemberVO;
import com.subway.s1.menu.MenuVO;
import com.subway.s1.menuSoldout.MenuSoldoutVO;
import com.subway.s1.product.ProductVO;
import com.subway.s1.util.FileManager;
import com.subway.s1.util.FilePathGenerater;
import com.subway.s1.util.FileSaver;
import com.subway.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class IngredientService {
	@Autowired
	private IngredientRepository ingredientRepository;
	@Autowired
	private IngredientFileRepository ingredientFileRepository;
	@Autowired
	private IngreSoldoutRepository ingreSoldoutRepository;
	@Autowired
	private FileManager fileManager;//실제 파일을 하드디스크 저장
	@Autowired
	private FilePathGenerater pathGenerater;//파일의 경로

	
	@Value("${ingredient.filePath}")
	private String filePath;
	
	//현지님
	public List<IngredientVO> ingreList() throws Exception{
		return ingredientRepository.ingreList();
	}
	
	//sihyun
	
	//본사 list
	
	public List<IngredientVO> headOfficeIngredientList(Pager pager) throws Exception{
		if(pager.getKind()==null) {
			pager.setKind("in");
		}
		if(pager.getSearch()==null) {
			pager.setSearch("I");
		}
		pager.makeRow();
		long totalCount=ingredientRepository.headIngredientCount(pager);
		pager.makePage(totalCount);
		return ingredientRepository.headOfficeIngredientList(pager);
		
	}
	//가맹점 list
	public List<IngredientVO> ingredientList(Pager pager,String storeNum,HttpSession session) throws Exception{
		if(pager.getKind()==null||pager.getSearch()==null) {
			pager.setKind("in");
			pager.setSearch("I");
		}
		//pager
		pager.makeRow();
		long totalCount=ingredientRepository.ingredientCount(pager);
		pager.makePage(totalCount);
		//리스트 타입으로 담기
		List<IngredientVO> ar = ingredientRepository.ingredientList(pager);
		//품절 상품 
		storeNum = ((MemberVO)session.getAttribute("member")).getStoreNum();
		//storeNum="S09";
		List<IngreSoldoutVO> soldoutVO = ingredientRepository.soldoutCheck(storeNum);
		System.out.println("soldoutVO:"+soldoutVO);
		for(int i=0;i<ar.size();i++) {
			ar.get(i).setSell(1);
			for(int j=0;j<soldoutVO.size();j++) {
				if(ar.get(i).getIngreNum().equals(soldoutVO.get(j).getIngreNum())) {
					ar.get(i).setSell(0);
					break;
				}
			}
			System.out.println("for:"+ar);
		}
		return ar;
	
	}
	//재료등록
	public int ingredientRegister(IngredientVO ingredientVO,MultipartFile[] files) throws Exception{
		File file= pathGenerater.getUserResourceLoader(filePath);
		int result= ingredientRepository.ingredientRegister(ingredientVO);
		for(MultipartFile multipartFile: files) {
			if(multipartFile.getSize()<=0) {
				continue;
			}
			String fileName= fileManager.saveFileCopy(multipartFile, file);
			IngredientFileVO vo =new IngredientFileVO();
			vo.setIngreNum(ingredientVO.getIngreNum());
			vo.setFileName(fileName);
			vo.setOriName(multipartFile.getOriginalFilename());
			
			result=ingredientFileRepository.ingredientRegister(vo);
			System.out.println("fileName:"+fileName);
		}
		return result;
	}
	//가맹점 list
	public List<IngredientVO> ingredientList(Pager pager) throws Exception{
		if(pager.getKind()==null) {
			pager.setKind("in");
		}
		if(pager.getSearch()==null) {
			pager.setSearch("I");
		}
		pager.makeRow();
		long totalCount=ingredientRepository.ingredientCount(pager);
		pager.makePage(totalCount);

		return ingredientRepository.ingredientList(pager);
	}
	
	
	public IngredientVO ingredientSelectOne(IngredientVO ingredientVO)throws Exception{
		return ingredientRepository.ingredientSelectOne(ingredientVO);
	}
	public int ingredientUpdate(IngredientVO ingredientVO)throws Exception{
		return ingredientRepository.ingredientUpdate(ingredientVO);
	}
	//본사 단종
	public int ingredientSoldOut(IngredientVO ingredientVO)throws Exception{
		return ingredientRepository.ingredientSoldOut(ingredientVO);
	}	
	//본사 단종 해제
	public int ingredientUnsold(IngredientVO ingredientVO)throws Exception{
		return ingredientRepository.ingredientUnsold(ingredientVO);
	}
	
	//재료 삭제
	public int ingredientDelete(IngredientVO ingredientVO)throws Exception{
		File file= pathGenerater.getUserResourceLoader(filePath);
		System.out.println("FILE_PATH:"+file); //지워졌나 확인 path
		IngredientFileVO ingredientFileVO = new IngredientFileVO();
		ingredientFileVO.setIngreNum(ingredientVO.getIngreNum());
		ingredientFileVO=this.fileSelectOne(ingredientFileVO.getIngreNum());		
		
		FileSaver fileSaver = new FileSaver();
		fileSaver.fileDelete(ingredientFileVO.getFileName(), file);
		int result=ingredientFileRepository.fileDelete(ingredientFileVO);
		if(result>0) {
			System.out.println("데이터베이스 삭제 성공");
		}else {
			System.out.println("데이터베이스 삭제 실패");
		}
		return ingredientRepository.ingredientDelete(ingredientVO);
	}
	
	//재료 여러개 삭제+ 파일
	public int deletes(List<String> deletes, MultipartFile[] files) throws Exception{
		File file= pathGenerater.getUserResourceLoader(filePath);
		System.out.println("FILE_PATH:"+file); //지워졌나 확인 path
		IngredientFileVO ingredientFileVO = new IngredientFileVO();
		for(int i=0;i<deletes.size();i++) {
			ingredientFileVO.setIngreNum(deletes.get(i));
			ingredientFileVO=this.fileSelectOne(deletes.get(i));
			if(ingredientFileVO != null) {
				System.out.println(ingredientFileVO.getFileName());
				FileSaver fileSaver = new FileSaver();
				fileSaver.fileDelete(ingredientFileVO.getFileName(), file);
			}
		}
			int result=ingredientFileRepository.deletes(deletes);
			if(result > 0) {
				System.out.println("DB 삭제 성공");
			}else {
				System.out.println("DB 삭제 실패");
			}
		return ingredientRepository.deletes(deletes);
	}

	public IngredientFileVO fileSelectOne(String ingreNum)throws Exception{
		return ingredientFileRepository.fileSelectOne(ingreNum);
	}

	

	
}
