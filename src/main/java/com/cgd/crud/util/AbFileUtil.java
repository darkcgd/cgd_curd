package com.cgd.crud.util;

import java.io.File;
import java.util.Date;
import java.util.UUID;

/**
 * Created by szmg on 17/9/20.
 */
public class AbFileUtil {
    public static String getFilePath(String baseFolder,String sourceFileName) {
        Date nowDate=new Date();
        // yyyy/MM/dd
        String fileFolder = File.separator + AbDateUtil.getStringByFormat(nowDate,"yyyy") + File.separator + AbDateUtil.getStringByFormat(nowDate,"MM") + File.separator
                + AbDateUtil.getStringByFormat(nowDate,"dd");
        File file = new File(baseFolder + fileFolder);
        if (!file.isDirectory()) {
            // 如果目录不存在，则创建目录
            file.mkdirs();
        }
        // 生成新的文件名
        String fileName = AbDateUtil.getStringByFormat(nowDate,"yyyyMMddhhmmssSSSS") + UUID.randomUUID().toString().substring(0,5)+ getExtName(sourceFileName, '.');
        return fileFolder + File.separator + fileName;
    }



    private static String getExtName(String s, char split) {
        int i = s.indexOf(split);
        int leg = s.length();
        return (i > 0 ? (i + 1) == leg ? " " : s.substring(i, s.length()) : " ");
    }
}
