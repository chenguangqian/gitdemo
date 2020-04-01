package com.ssm35.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm35.service.DeptService;
import com.ssm35.vo.DeptVo;

/**
 * 显示库存信息
 * @author CGQ
 *
 */
@Controller
public class DeptController {
	//注入Service代理对象
	@Autowired
	private DeptService deptService;
	
	/**
	 * 显示所有库存信息
	 * 
	 */
	@RequestMapping(value = "/selDeptMsg.do", method = RequestMethod.POST)
	@ResponseBody
	public List<DeptVo> selDeptMsgController() {
		// 调用方法
		List<DeptVo> deptlist = deptService.selDeptMsgService();
		// 返回值
		return deptlist;
	}
	
	/**
	 * 修改库存信息
	 */
	@RequestMapping(value = "/updateDeptMsgById.do", method = RequestMethod.POST)
	public int updateDeptMsgByIdController(DeptVo deptVo) {
		// 调用方法
		int i= deptService.updateDeptMsgByIdService(deptVo);
		// 返回值
		return i;
	}

}
