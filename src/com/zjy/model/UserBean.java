/**
 * @FileName:    UserBean.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月13日 上午10:01:14

 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月13日       Administrator  1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

/**
 * @ClassName:   UserBean
 * @Description: Users info
 */
public class UserBean {
	private long _userId; 
	private String _userName;
	private String _userTruename;
	private String _userPasswd;
	private String _userEmail;
	private String _userPhone;
	private String _userAddress;
	private String _userPostcode;
	private int _userGrade;
	public long get_userId() {
		return _userId;
	}
	public void set_userId(long _userId) {
		this._userId = _userId;
	}
	public String get_userName() {
		return _userName;
	}
	public void set_userName(String _userName) {
		this._userName = _userName;
	}
	public String get_userTruename() {
		return _userTruename;
	}
	public void set_userTruename(String _userTruename) {
		this._userTruename = _userTruename;
	}
	public String get_userPasswd() {
		return _userPasswd;
	}
	public void set_userPasswd(String _userPasswd) {
		this._userPasswd = _userPasswd;
	}
	public String get_userEmail() {
		return _userEmail;
	}
	public void set_userEmail(String _userEmail) {
		this._userEmail = _userEmail;
	}
	public String get_userPhone() {
		return _userPhone;
	}
	public void set_userPhone(String _userPhone) {
		this._userPhone = _userPhone;
	}
	public String get_userAddress() {
		return _userAddress;
	}
	public void set_userAddress(String _userAddress) {
		this._userAddress = _userAddress;
	}
	public String get_userPostcode() {
		return _userPostcode;
	}
	public void set_userPostcode(String _userPostcode) {
		this._userPostcode = _userPostcode;
	}
	public int get_userGrade() {
		return _userGrade;
	}
	public void set_userGrade(int _userGrade) {
		this._userGrade = _userGrade;
	}
	
	
}
