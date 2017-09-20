package com.cgd.crud.controller;

import com.cgd.crud.bean.MsgBean;
import com.cgd.crud.util.AbDateUtil;
import com.cgd.crud.util.AbFileUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;
import java.util.logging.Logger;

@RequestMapping("file")
@Controller
public class FileController {
    /**
     * 文件上传功能
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping(value="/upload",method= {RequestMethod.POST, RequestMethod.GET })
    @ResponseBody
    public Object upload(@RequestParam(value = "file")MultipartFile file, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();

        String fileNamePath = AbFileUtil.getFilePath(path,fileName);

        File filePath = new File(path + fileNamePath);

        if(!filePath.exists()){
            filePath.mkdirs();
        }
        //MultipartFile自带的解析方法
        file.transferTo(filePath);
        MsgBean msg = MsgBean.success("上传成功");
        Map<String, Object> data = msg.getData();
        data.put("image", "upload"+fileNamePath);
        return msg;
    }


    @RequestMapping(value = "/uploadMultipartFile", method = RequestMethod.POST)
    @ResponseBody
    public Object uploadMultipartFile(@RequestParam("file") MultipartFile[] file , HttpServletRequest request,HttpServletResponse response) throws Exception {
        MultipartFile multipartFile;
        List<String> list=new ArrayList<>();
        for (int i = 0; i < file.length; i++) {
            multipartFile = file[i];
            String path = request.getSession().getServletContext().getRealPath("upload");
            String fileName = multipartFile.getOriginalFilename();

            String fileNamePath = AbFileUtil.getFilePath(path,fileName);

            File filePath = new File(path + fileNamePath);

            list.add("upload"+fileNamePath);

            if(!filePath.exists()){
                filePath.mkdirs();
            }
            //MultipartFile自带的解析方法
            multipartFile.transferTo(filePath);
        }
        MsgBean msg = MsgBean.success("上传成功");
        Map<String, Object> data = msg.getData();
        data.put("imageList", list);
        return msg;
    }


    /**
     * 文件下载功能
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/down")
    public void down(HttpServletRequest request,HttpServletResponse response) throws Exception{
        //模拟文件，myfile.txt为需要下载的文件
        String fileName = request.getSession().getServletContext().getRealPath("upload")+"/myfile.txt";
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String filename = "下载文件.txt";
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }
}