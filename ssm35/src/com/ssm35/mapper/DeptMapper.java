package com.ssm35.mapper;

import java.util.List;

import com.ssm35.vo.DeptVo;

/**
 * 修改部门信息
 * 显示部门信息
 * @author CGQ
 *
 */
public interface DeptMapper {
	/**
	 * 显示部门信息
	 * 
	 */
	public List<DeptVo> selDeptMsg();
	/**
	 * 
	 * 修改部门信息
	 */
	public int updateDeptMsgById(DeptVo deptVo);
}
