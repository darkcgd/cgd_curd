package com.cgd.crud.util;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;
public class TokenUtil {
	private static final String TOKEN_LIST_NAME = "tokenList";
	public static final String TOKEN_STRING_NAME = "token";

	private static ArrayList getTokenList(HttpSession session) {
		Object obj = session.getAttribute(TOKEN_LIST_NAME);
		if (obj != null) {
			return (ArrayList) obj;
		} else {
			ArrayList tokenList = new ArrayList();
			session.setAttribute(TOKEN_LIST_NAME, tokenList);
			return tokenList;
		}
	}

	private static void saveTokenString(String tokenStr, HttpSession session) {
		ArrayList tokenList = getTokenList(session);
		tokenList.add(tokenStr);
		session.setAttribute(TOKEN_LIST_NAME, tokenList);
	}

	private static String generateTokenString(){
		return new Long(System.currentTimeMillis()).toString();
	}

	/** *//**
	 * Generate a token string, and save the string in session, then return the token string.
	 * @param HttpSession session
	 * @return a token string used for enforcing a single request for a particular transaction.
	 */

	public static String getTokenString(HttpSession session) {
		String tokenStr = generateTokenString();
		saveTokenString(tokenStr, session);
		return tokenStr;
	}

	/** *//**

	 * check whether token string is valid. if session contains the token string, return true.
	 * otherwise, return false.
	 * @param String tokenStr
	 * @param HttpSession session
	 * @return true: session contains tokenStr; false: session is null or tokenStr is id not in session
	 */

	public static boolean isTokenStringValid(String tokenStr, HttpSession session) {
		boolean valid = false;
		if(session != null){
			ArrayList tokenList = getTokenList(session);
			if (tokenList.contains(tokenStr)) {
				valid = true;
				tokenList.remove(tokenStr);
			}
		}
		return valid;
	}




	/*
    * 自己写  生成token
    * */
	public void generateToken(Integer userId,HttpSession session){
		String uuid = UUID.randomUUID().toString().replaceAll("-","");
		long nowTime=new Date().getTime();
		String str=userId+uuid+nowTime;
		String md5Str = AbMd5.MD5(str);
		session.setAttribute(String.valueOf(userId), md5Str);
	}

	/**
	 * 验证token是否有效
	 * @param userId
	 * @param requestToken
	 * @param session
	 * @return
	 */
	public static boolean isValidWithToken(Integer userId, String requestToken , HttpSession session) {
		boolean valid = false;
		if(session != null){
			String saveToken = (String)session.getAttribute(String.valueOf(userId));
			if(saveToken!=null&&requestToken!=null&&saveToken.equals(requestToken)){
				valid=true;
			}
		}
		return valid;
	}

}
