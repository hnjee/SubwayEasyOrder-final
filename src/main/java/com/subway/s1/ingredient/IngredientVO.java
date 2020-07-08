package com.subway.s1.ingredient;

import java.util.List;


import lombok.Data;

@Data
public class IngredientVO {

	private String ingreNum;
	private String ingreCode;
	private String name;
	private int price;
	private int sale;
	
	
	private String kind;
	private String search;
	
	
	public String getKind() {
		if(this.kind==null) {
			this.kind="in";
		}	
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public String getSearch() {
		if(this.search==null) {
			this.search="I";
		}
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

}
