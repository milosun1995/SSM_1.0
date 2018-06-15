package com.springboot.receiver;

import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

@Component
public class HelloReceiver {
	@RabbitHandler
	@RabbitListener(queues = "hello")
	public void processs(String hello) {
		System.out.println("Receiver------>:" + hello);
	}
	@RabbitHandler
	@RabbitListener(queues = "hello")
	public void processs2(String hello) {
		System.out.println("Receiver2------>:" + hello);
	}
}
