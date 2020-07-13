package com.subway.s1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.subway.s1.menuSoldout.MenuSoldoutVO;
import com.subway.s1.util.Pager;

@Repository
@Mapper
public interface ProductRepository {
	
	
		public List<ProductVO> productList(Pager pager)throws Exception;
		
		public List<MenuSoldoutVO> soldoutCheck(String storeNum)throws Exception;
		
		public long totalCount(Pager pager)throws Exception;
		
		public int salesUpdate(ProductVO productVO)throws Exception;
		
		public int productInsert(ProductVO productVO)throws Exception;
		
		public ProductVO getMenu(String menuNum)throws Exception;
		
		public int productUpdate(ProductVO productVO)throws Exception;
		
		public int productDelete(ProductVO productVO)throws Exception;
		
		public int deletes(List<String> menuNums)throws Exception;
}
