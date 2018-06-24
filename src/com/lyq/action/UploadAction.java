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
	// �����ṩ���ֶ�
	private File myfile;
	// struts2���ļ��ϴ�ʱ�ṩ������
	private String myfileFileName;// �ϴ����ļ������ϴ��ֶ�����+FileName ע���Сд
	private String myfileContentType;// �ϴ��ļ���MIME���͡��ϴ��ֶ�����+ContentType ע���Сд

	private Map<String,Object> request;
	
	private Goods goods;
	@SuppressWarnings("unchecked")
	public String upload() {
		//��ȡҪ�����ļ��е�����·��(����·��)
        String realPath=ServletActionContext.getServletContext().getRealPath("/upload");
        File file = new File(realPath+"\\"+new Date().getTime());
        System.out.println(realPath+"\\"+new Date().getTime());
        //���Դ˳���·������ʾ���ļ���Ŀ¼�Ƿ���ڡ��������ڣ������˳���·����ָ����Ŀ¼���������б��赫�����ڵĸ�Ŀ¼��
        if(!file.exists())file.mkdirs();
        
        try {
            //�����ļ�
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
