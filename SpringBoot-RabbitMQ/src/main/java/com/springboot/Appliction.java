package com.springboot;

import java.util.UUID;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class Appliction {
	public static void main(String[] args) {
		ConfigurableApplicationContext ctx= SpringApplication.run(Appliction.class, args);
		ctx.getBean(Appliction.class).runDemo();
		//ctx.close();
	}
	public void runDemo() {
		System.out.println("run demo:"+UUID.randomUUID());
	}
}
