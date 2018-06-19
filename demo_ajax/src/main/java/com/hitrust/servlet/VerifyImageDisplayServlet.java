package com.hitrust.servlet;

import java.io.IOException;
import java.io.OutputStream;

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
public class VerifyImageDisplayServlet extends HttpServlet {

	/**
	 * Comment for <code>serialVersionUID</code>
	 */
	private static final long	serialVersionUID	= 1L;
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String strCodeLen = request.getParameter("codeLen");
		int intCodeLen = 4;
		if ( strCodeLen != null && !strCodeLen.equals("") ) {
			intCodeLen = Integer.parseInt(strCodeLen);
		}
		// ���������֤�ַ�ͼƬ
		String verifyStr = SystemHelper.getNewRandomCode(intCodeLen);
		// �����ɵ�ͼƬ��֤�����session
		HttpSession hSession=request.getSession(true);
		hSession.setAttribute("verifyObj", verifyStr);
		OutputStream outputStream = null;
		try {
			outputStream = response.getOutputStream();
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/jpeg");
			PBJspContextServices.genColorGraphics(verifyStr, outputStream);
			outputStream.flush();
		}
		catch (IOException ex) {
			throw ex;
		}
		finally {
			if (outputStream != null) {
				try {
					outputStream.close();
				}
				catch (IOException ex) {
				}
			}
		}
	}
}