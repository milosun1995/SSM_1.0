package com.springboot.send;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HelloSender {
	@Autowired
	private AmqpTemplate amqpTemplate;

	public void send(String message) {
		String context = "spirng boot neo queue"+" ****** "+message;
		System.out.println("Sender : " + context);
		this.amqpTemplate.convertAndSend("hello", message);
	}
}
