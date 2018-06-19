package com.hitrust.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hitrust.util.PBJspContextServices;
import com.hitrust.util.SystemHelper;

/**
 * Created on 2004-11-12 13:04:24
 * 
 * @Copyright (C) 1999-2004 ECC Tech
 * @description ����ҳ����ʾ������롣
 * @author zhangrui@echannels.com.cn
 */
public class VerifyImageDisplayForLoginServlet extends HttpServlet {

	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=null;
		try {
			out=response.getWriter();
			out.write((String)request.getSession(true).getAttribute("verifyObj"));
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	protected void postGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}