package com.lyq.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.lyq.bean.Goods;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 表单上提供的字段
	private File myfile;
	// struts2在文件上传时提供的属性
	private String myfileFileName;// 上传的文件名。上传字段名称+FileName 注意大小写
	private String myfileContentType;// 上传文件的MIME类型。上传字段名称+ContentType 注意大小写

	private Map<String,Object> request;
	
	private Goods goods;
	@SuppressWarnings("unchecked")
	public String upload() {
		//获取要保存文件夹的物理路径(绝对路径)
        String realPath=ServletActionContext.getServletContext().getRealPath("/upload");
        File file = new File(realPath+"\\"+new Date().getTime());
        System.out.println(realPath+"\\"+new Date().getTime());
        //测试此抽象路径名表示的文件或目录是否存在。若不存在，创建此抽象路径名指定的目录，包括所有必需但不存在的父目录。
        if(!file.exists())file.mkdirs();
        
        try {
            //保存文件
            FileUtils.copyFile(myfile, new File(file,myfileFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        goods.setPath(file.getAbsolutePath()+"\\"+myfileFileName);
		request =(Map<String,Object>)ActionContext.getContext().get("request");
		request.put("goods", goods);
		return "SUCCESS";
	}

	public File getMyfile() {
		return myfile;
	}

	public void setMyfile(File myfile) {
		this.myfile = myfile;
	}

	public String getMyfileFileName() {
		return myfileFileName;
	}

	public void setMyfileFileName(String myfileFileName) {
		this.myfileFileName = myfileFileName;
	}

	public String getMyfileContentType() {
		return myfileContentType;
	}

	public void setMyfileContentType(String myfileContentType) {
		this.myfileContentType = myfileContentType;
	}

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
