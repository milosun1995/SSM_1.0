package com.hitrust.util;

public class SystemHelper {
	
	/**
	 * @description ���ݳ�����������롣
	 * @param codeLen
	 *            ����볤�ȡ�
	 * @return �����͵�����롣
	 */
	public static String getNewRandomCode(int codeLen) {
		//���ȶ����������Դ
		//������Ҫ�õ���������ĳ��ȷ�������ַ���
		java.util.Random randomCode = new java.util.Random();
		String strCode = "";
		while (codeLen > 0) {
			int intCode = randomCode.nextInt(9);
			strCode += intCode;
			codeLen--;
		}
		return strCode;
	}
}