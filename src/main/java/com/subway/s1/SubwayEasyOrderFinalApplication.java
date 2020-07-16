package com.subway.s1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SubwayEasyOrderFinalApplication {

	public static void main(String[] args) {
		SpringApplication.run(SubwayEasyOrderFinalApplication.class, args);
	}

}
