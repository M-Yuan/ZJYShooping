/**
 * @FileName:    OrdersBean.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月24日下午9:01:08
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月24日        Administrator  1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

import java.util.*;

/**
 * @author M.Yuan
 *
 */
public class OrdersBean {
	// 定义orders表字段
	private long _ordersId ;
	private long _userId;  
	private java.util.Date _orderDate;
	private String _payMode ;
	private byte _isPayed;
	private float _totalPrice ;
	
	public long get_ordersId() {
		return _ordersId;
	}
	public void set_ordersId(long _ordersId) {
		this._ordersId = _ordersId;
	}
	public long get_userId() {
		return _userId;
	}
	public void set_userId(long _userId) {
		this._userId = _userId;
	}
	public java.util.Date get_orderDate() {
		return _orderDate;
	}
	public void set_orderDate(java.util.Date _orderDate) {
		this._orderDate = _orderDate;
	}
	public String get_payMode() {
		return _payMode;
	}
	public void set_payMode(String _payMode) {
		this._payMode = _payMode;
	}
	public byte get_isPayed() {
		return _isPayed;
	}
	public void set_isPayed(byte _isPayed) {
		this._isPayed = _isPayed;
	}
	public float get_totalPrice() {
		return _totalPrice;
	}
	public void set_totalPrice(float _totalPrice) {
		this._totalPrice = _totalPrice;
	}
	
	
}
