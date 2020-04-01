package com.ssm35.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm35.mapper.DeptMapper;
import com.ssm35.vo.DeptVo;

/**
 * 显示部门信息
 * @author CGQ
 *
 */
@Service
public class DeptService {
	//注入Mapper代理对象
	@Autowired
	private DeptMapper deptMapper;
	
	/**
	 * 
	 * 显示部门信息
	 */
	public List<DeptVo> selDeptMsgService(){
		return deptMapper.selDeptMsg();
		
	}
	
	/**
	 * 
	 * 修改库存信息
	 */
	public int updateDeptMsgByIdService(DeptVo deptVo){
		return deptMapper.updateDeptMsgById(deptVo);
		
	}
}
