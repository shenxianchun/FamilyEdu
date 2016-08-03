package com.sxc.web.ValidateAction;


import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;


public class VCode {
	private int w=70;
	private int h=35;
	//private Color bgcolor=new Color(240,240,240);
	private Random random=new Random(); 
	
	private StringBuilder code=new StringBuilder(4);
	
	
	private BufferedImage createImage() {
		/*
		 * 1.创建图片
		 * 2.设置背景
		 * 
		 * */
		BufferedImage img=new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
		//设置笔画颜色
		img.getGraphics().setColor(getRandColor(180, 250));
		//填充背景与图片一样大小的矩形，即设置背景
		img.getGraphics().fillRect(0, 0, w, h);
		
		return img;
	}
	
	private void drawLine(BufferedImage img){//干扰线	Graphics2D g=(Graphics2D)img.getGraphics();
		Graphics g=img.getGraphics();
		g.setColor(getRandColor(50, 100));
		((Graphics2D) g).setStroke(new BasicStroke(1.5F));
		for(int i=0;i<12;i++){
			int x1 = random.nextInt(w);
			int y1 = random.nextInt(h);
			int x2 = random.nextInt(9);
			int y2 = random.nextInt(9);
			g.drawLine(x1, y1, x1 + x2, y1 + y2);
		}
	}
	
	private Color randomColor(){//随机颜色
		int r=random.nextInt(256);
		int g=random.nextInt(256);
		int b=random.nextInt(256);
		return new Color(r,g,b);
	}
	//字体名，样式，字�?
	private String[] fontName={"微软雅黑","宋体","隶书","黑体"};
	//private int[] fontStyles={0,1,2,3};//样式只有�?个�?
	private int[] fontSize={24,25,26,27,28};//字号范围
	private Font randomFont(){				//字体随机
		int index=random.nextInt(fontName.length);
		String name=fontName[index];
		
		int style=random.nextInt(4);
		
		index=random.nextInt(fontSize.length);
		int size=fontSize[index];
		
		
		return new Font(name,style,size);
		
	}
	private String codes="0123456789";
	private String randomChar(){
		int index=random.nextInt(codes.length());
		return codes.charAt(index)+"";
	}
	//用户迪调用这个方法获取图�?
	public BufferedImage getImage(){
		//写字符，随机生成0-9，a-z，A-Z
		//字体，宋体，隶书，都是随机，包括大小
		//字符的颜色也随机
		BufferedImage img=createImage();
		Graphics g=img.getGraphics();
		//画东�?
		for(int i=0;i<4;i++){
			String ch=this.randomChar();
			code.append(ch);
			g.setColor(this.randomColor());
			g.setFont(this.randomFont());
			g.drawString(ch, w/4*i, h-5);
		}
		this.drawLine(img);//添加干扰
		return img;
	}
	//这个方法必须在图片生成getImage()之前调用
	public String getCode(){
		return code.toString();
	}
//	public static void saveImage(BufferedImage img,OutputStream out) throws IOException{
//		ImageIO.write(img,"JPEG",out);
//	}
	// 产生�?��随机的颜�?其中，min:颜色分量�?���?;max:颜色分量�?���?
			public Color getRandColor(int min, int max) {
				Random random = new Random();
				if (min > 255) {
					min = 255;
				}
				if (max > 255) {
					max = 255;
				}
				int R = min + random.nextInt(max - min);
				int G = min + random.nextInt(max - min);
				int B = min + random.nextInt(max - min);
				/**
				 * 0~255   兰色�?~7 �?      绿色�?~15�?       红色�?6~23�?
				 */
				return new Color(R, G, B);
			}
}
