package com.hitrust.util;


import java.awt.image.BufferedImage;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import java.util.*;

public class PBJspContextServices {
	/**
	 * @description ����������ɫͼƬ�������ָ��������С�
	 * @param exPwd
	 *            ����롣
	 * @param out
	 *            �������
	 * @throws java.io.IOException
	 */
	public static void genColorGraphics(String exPwd, java.io.OutputStream out)
			throws java.io.IOException {
		int len = exPwd.length();
		int imageWidth = len*11;
		int imageHeight = 20;
		BufferedImage image = new BufferedImage(imageWidth, imageHeight,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		g.setColor(getRandColor(200,250));
		g.fillRect(0, 0, imageWidth, imageHeight);
		g.setFont(new Font("Times New Roman",Font.PLAIN,18));
		g.setColor(getRandColor(160,200));
		Random random = new Random();
		for (int i=0;i<155;i++)	{
		        int x = random.nextInt(imageWidth);
		        int y = random.nextInt(imageHeight);
		        int xl = random.nextInt(12);
		        int yl = random.nextInt(12);
		        g.drawLine(x,y,x+xl,y+yl);
		}	
		FontMetrics metrics = g.getFontMetrics();
		java.awt.geom.Rectangle2D rect = metrics.getStringBounds(exPwd, g);
		int x = (new Double((imageWidth - rect.getWidth()) / 2 - rect.getX()))
				.intValue();
		int y = (new Double((imageHeight - rect.getHeight()) / 2 - rect.getY()))
				.intValue();			
		for(int i=0;i<len;i++){
			g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
			g.drawString(exPwd.substring(i, i+1),9*i+x+6,y);
		}
		g.dispose();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(image);
	}
	
	/**
	 * @description ���������ɫ��
	 * @param fc
	 *            ��ɫ��
	 * @param bc
	 *            ��ɫ��
	 * @
	 */
	private static Color getRandColor(int fc,int bc){
        Random random = new Random();
        if(fc>255) fc=255;
        if(bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
     }
}
