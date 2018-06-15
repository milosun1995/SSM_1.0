package org.dubbo.spring.controller;

import org.dubbo.spring.api.DemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

@Controller
public class ConsumerController {
	
	@Autowired
	DemoService demoService;

	/**
	 * 测试 JSON 接口；
	 * 
	 * @param name
	 *            名字
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/test/{name}")
	public JSONObject testJson(@PathVariable("name") String name) {
		JSONObject jsonObject = new JSONObject();
		String testStr = this.demoService.sayHello(name);
		jsonObject.put("str", testStr);
		return jsonObject;
	}
	
	@ResponseBody
	@RequestMapping("/test/string/{name}")
	public String testString(@PathVariable("name") String name) {
		String testStr = this.demoService.sayHello(name);
		return testStr;
	}
}
