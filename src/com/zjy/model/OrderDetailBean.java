/**
 * @FileName:    OrderDetailBean.java
 * @Description: TODO(用一句话描述该文件做什么)
 * @Copyright:   Copyright(C) 1998-2017
 * @Createdate:  2017年7月25日下午1:31:08
 *
 * Modification  History:
 * Date          Author         Version    Discription
 * -----------------------------------------------------------------------------------
 * 2017年7月25日        Administrator  1.0        1.0
 * Why & What is modified: <修改原因描述>
 */
package com.zjy.model;

/**
 * @ClassName:   OrderDetailBean
 * @Description: 定义订单信息方法
 */
public class OrderDetailBean {
	/**
	 * @Description: 定义orderDetail表字段
	 */
	long _ordersId;
	long _goodsId;
	int _goodsNums;
	
	public long get_ordersId() {
		return _ordersId;
	}
	public void set_ordersId(long _ordersId) {
		this._ordersId = _ordersId;
	}
	public long get_goodsId() {
		return _goodsId;
	}
	public void set_goodsId(long _goodsId) {
		this._goodsId = _goodsId;
	}
	public int get_goodsNums() {
		return _goodsNums;
	}
	public void set_goodsNums(int _goodsNums) {
		this._goodsNums = _goodsNums;
	}
}
