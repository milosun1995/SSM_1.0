package org.blog.milo.web.admin;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.blog.milo.utils.StringUtil;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin")
public class UeditorUploadController {

	@RequestMapping(value = "/ueditorUpload")
	public void uploadUEditorImage(@RequestParam(value = "upfile", required = false) MultipartFile file,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		JSONObject json = new JSONObject();
		PrintWriter out = response.getWriter();

		try {
			String root = "C:\\images";
			String fileName = file.getOriginalFilename();
			String fileSuffix = fileName.substring(fileName.indexOf(".") + 1);

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			String directory = "\\static\\userImages\\" + dateFormat.format(new Date()) + "\\";
			// Util.getRandomString(int length)：返回由length个任意字母组成的字符串
			String path = directory + StringUtil.getRandomString(12) + "." + fileSuffix;
			new File(root + directory).mkdir();
			file.transferTo(new File(root + path));

			json.put("state", "SUCCESS");
			json.put("title", file.getName());
			System.out.println(root+"----------"+path);
			json.put("url", path);// 图片访问路径
			json.put("original", file.getName());
		} catch (Exception e) {
			json.put("state", "上传图片出错");
		}
		out.print(json.toString());
	}
	
//	public static void main(String[] args) {
//		String root = "F:\\images";
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
//		String directory = "\\static\\userImages\\" + dateFormat.format(new Date()) + "\\";
//		boolean file=new File(root + directory).mkdir();
//		System.out.println(root + directory);
//		System.out.println(file);
//	}
}
