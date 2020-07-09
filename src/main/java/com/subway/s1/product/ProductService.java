package com.subway.s1.product;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.subway.s1.menu.menuFile.MenuFileRepository;
import com.subway.s1.menu.menuFile.MenuFileVO;
import com.subway.s1.menuSoldout.MenuSoldoutVO;
import com.subway.s1.util.FileManager;
import com.subway.s1.util.FilePathGenerater;
import com.subway.s1.util.FileSaver;
import com.subway.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;	
	@Autowired
	private MenuFileRepository menuFileRepository;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private FilePathGenerater filePathGenerater;
	@Value("${menu.filePath}")
	private String filePath;
	
	//SK
	//본사 List
	public List<ProductVO> HOproductList(Pager pager)throws Exception{
		if(pager.getKind()==null || pager.getSearch()==null) {
			pager.setKind("menuNum");
			pager.setSearch("M");
		}
		
		//Pager
		pager.makeRow();
		long totalCount = productRepository.totalCount(pager);
		pager.makePage(totalCount);
		
		List<ProductVO> ar = productRepository.productList(pager);
		
		
		return ar;
	}
	//가맹 메뉴 List
		public List<ProductVO> productList(Pager pager,String storeNum)throws Exception{
			if(pager.getKind()==null || pager.getSearch()==null) {
				pager.setKind("menuNum");
				pager.setSearch("M");
			}
			
			//Pager
			pager.makeRow();
			long totalCount = productRepository.totalCount(pager);
			pager.makePage(totalCount);
			
			List<ProductVO> ar = productRepository.productList(pager);
			//품절된 상품 비교
			List<MenuSoldoutVO> soldoutVO = productRepository.soldoutCheck(storeNum);

			for(int i=0;i<ar.size();i++) {
				ar.get(i).setSell(1);
				for(int j=0;j<soldoutVO.size();j++) {
					if(ar.get(i).getMenuNum().equals(soldoutVO.get(j).getMenuNum())) {
						ar.get(i).setSell(0);
						break;
					}
				}
			}
		
			
			return ar;
		}

		
		//update(품절)
		public int salesUpdate(ProductVO productVO)throws Exception{
			if(productVO.getSale()==0) {
				productVO.setSale(1);
			}else {
				productVO.setSale(0);
			}
			return productRepository.salesUpdate(productVO);
		}
		
		//insert
		public int productInsert(ProductVO productVO, MultipartFile[] files)throws Exception{
			File file = filePathGenerater.getUserResourceLoader(filePath);
			int result = productRepository.productInsert(productVO);
			for(MultipartFile multipartFile : files) {
				if(multipartFile.getSize()<=0) {
					continue;
				}
				String fileName = fileManager.saveFileCopy(multipartFile, file);
				MenuFileVO menuFileVO = new MenuFileVO();
				menuFileVO.setMenuNum(productVO.getMenuNum());
				menuFileVO.setFileName(fileName);
				menuFileVO.setOriName(multipartFile.getOriginalFilename());
				
				result = menuFileRepository.menuRegister(menuFileVO);
				System.out.println("fileName : "+fileName);
			
			}
			
			return result;
		}
		
		//update
		public ProductVO getMenu(String menuNum)throws Exception{
			return productRepository.getMenu(menuNum);
		}
		
		public int productUpdate(ProductVO productVO)throws Exception{
			return productRepository.productUpdate(productVO);
		}
		
		//Delete
		public int productDelete(ProductVO productVO)throws Exception{
	
			File file = filePathGenerater.getUserResourceLoader(filePath);
			System.out.println("File_Path : "+file);
			MenuFileVO menuFileVO = new MenuFileVO();
			menuFileVO.setMenuNum(productVO.getMenuNum());
			System.out.println("----------------------------------------");
			System.out.println("productVO-MenuNum : "+productVO.getMenuNum());
			
			menuFileVO=this.fileSelectOne(productVO.getMenuNum());
			FileSaver fileSaver = new FileSaver();
			
			fileSaver.fileDelete(menuFileVO.getFileName(), file);

			int result = menuFileRepository.fileDelete(menuFileVO);
			if(result > 0) {
				System.out.println("DB 삭제 성공");
			}else {
				System.out.println("DB 삭제 실패");
			}
			return productRepository.productDelete(productVO);
		}
		
		public int deletes(List<String> deletes, MultipartFile[] files)throws Exception{
			File file = filePathGenerater.getUserResourceLoader(filePath);
			MenuFileVO menuFileVO = new MenuFileVO();
			for(int i=0;i<deletes.size();i++) {
				menuFileVO.setMenuNum(deletes.get(i));
				menuFileVO=this.fileSelectOne(deletes.get(i));
				if(menuFileVO != null) {
					System.out.println(menuFileVO.getFileName());
					FileSaver fileSaver = new FileSaver();
					fileSaver.fileDelete(menuFileVO.getFileName(), file);
				}
			}
			int result = menuFileRepository.deletes(deletes);
			if(result > 0) {
				System.out.println("DB 삭제 성공");
			}else {
				System.out.println("DB 삭제 실패");
			}
			return productRepository.deletes(deletes);
		}
		
		public MenuFileVO fileSelectOne(String menuNum)throws Exception{
			return menuFileRepository.fileSelectOne(menuNum);
		}
		
}
