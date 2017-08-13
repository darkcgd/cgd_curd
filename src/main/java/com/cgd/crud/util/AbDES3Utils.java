package com.cgd.crud.util;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;


/**
 * 	
 * 名称：AbDES3Utils.java 
 * 描述：DES3工具类.
 * @author cgd
 * @date 2016-01-11
 * 
 */
public class AbDES3Utils {
	private static Key key;    
    
    public AbDES3Utils(String str) {    
        setKey(str);// 生成密匙    
    }    
    
    public AbDES3Utils() {
        setKey("abc123.*abc123.*abc123.*abc123.*");
    }

    /**   
     * 根据参数生成KEY   
     */    
    public static void setKey(String strKey) {
        try {   
            //对比DES  
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DESede");    
            key  = keyFactory.generateSecret(new DESedeKeySpec(strKey.getBytes("UTF8")));    
        } catch (Exception e) {    
            throw new RuntimeException(    
                    "Error initializing SqlMap class. Cause: " + e);    
        }
    }    
    
        
    /**   
     * 加密String明文输入,String密文输出   
     */    
    public static String encrypt(String strMing) {    
        byte[] byteMi = null;    
        byte[] byteMing = null;    
        String strMi = "";    
        try {    
            byteMing = strMing.getBytes("UTF8");    
            byteMi = getEncCode(byteMing);    
            strMi = AbBase64.encode(byteMi);    
        } catch (Exception e) {    
            throw new RuntimeException(    
                    "Error initializing SqlMap class. Cause: " + e);    
        } finally {    
            byteMing = null;    
            byteMi = null;    
        }    
        return strMi;    
    }    
    
    /**   
     * 解密 以String密文输入,String明文输出   
     *    
     * @param strMi   
     * @return   
     */    
    public static String decrypt(String strMi) {    
        byte[] byteMing = null;    
        byte[] byteMi = null;    
        String strMing = "";    
        try {    
            byteMi = AbBase64.decode(strMi);    
            byteMing = getDesCode(byteMi);    
            strMing = new String(byteMing, "UTF8");    
        } catch (Exception e) {    
            throw new RuntimeException(    
                    "Error initializing SqlMap class. Cause: " + e);    
        } finally {    
            byteMing = null;    
            byteMi = null;    
        }    
        return strMing;    
    }    
    
    /**   
     * 加密以byte[]明文输入,byte[]密文输出   
     *    
     * @param byteS   
     * @return   
     */    
    private static byte[] getEncCode(byte[] byteS) {    
        byte[] byteFina = null;    
        Cipher cipher;    
        try {//对比DES   
            cipher = Cipher.getInstance("DESede");
            if(key==null){
                setKey("abc123.*abc123.*abc123.*abc123.*");
            }
            cipher.init(Cipher.ENCRYPT_MODE, key,SecureRandom.getInstance("SHA1PRNG"));    
            byteFina = cipher.doFinal(byteS);    
        } catch (Exception e) {    
            throw new RuntimeException(    
                    "Error initializing SqlMap class. Cause: " + e);    
        } finally {    
            cipher = null;    
        }    
        return byteFina;    
    }    
    
    /**   
     * 解密以byte[]密文输入,以byte[]明文输出   
     *    
     * @param byteD   
     * @return   
     */    
    private static byte[] getDesCode(byte[] byteD) {    
        Cipher cipher;    
        byte[] byteFina = null;    
        try {//对比DES  
            cipher = Cipher.getInstance("DESede");
            if(key==null){
                setKey("abc123.*abc123.*abc123.*abc123.*");
            }
            cipher.init(Cipher.DECRYPT_MODE, key,SecureRandom.getInstance("SHA1PRNG"));    
            byteFina = cipher.doFinal(byteD);    
        } catch (Exception e) {    
            throw new RuntimeException(    
                    "Error initializing SqlMap class. Cause: " + e);    
        } finally {    
            cipher = null;    
        }    
        return byteFina;    
    }    
    
        
    
    public static void main(String args[])  {    
    
        String str1 = "12345678";
        // DES加密    
        String str2 = AbDES3Utils.encrypt(str1);
        String deStr = decrypt(str2);//bZMHZN5iofs=    
        //String deStr = des1.decrypt("ED5wLgc3Mnw=");    
        System.out.println("密文:" + str2);    
        // DES解密    
        System.out.println("明文:" + deStr);  
         
    }    
    
}
