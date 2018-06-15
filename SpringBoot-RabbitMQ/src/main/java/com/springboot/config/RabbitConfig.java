package com.springboot.config;

import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitConfig {
	private final String QueueName="hello";
	
	@Bean
	public Queue queue() {
		return new Queue(QueueName);
	}
}
