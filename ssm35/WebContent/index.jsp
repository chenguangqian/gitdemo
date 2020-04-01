<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="css/styleM.css">
<link rel="stylesheet" href="css/styleclock.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "selDeptMsg.do",
			type : "POST",
			success : function(data) {
				$("#depttable").append(
						"<tr><th>部门编号</th><th>部门名</th><th>部门地址</th></tr>")
				$.each(data, function(i, deptlist) {
					$("#depttable").append(
							"<tr><th>" + deptlist.deptno + "</th>" + "<th>"
									+ deptlist.dname + "</th>" + "<th>"
									+ deptlist.loc + "</th>"
									+"<th><div class='up' name='deptno' id='upd&"+deptlist.deptno+"' onclick='update(this)'>修改</div></th></tr>");
				});
			}
		});
	});
	
	//修改的弹框跳出
	function update(obj) {
		//show弹框
		$('#myModal').modal();
		//获取修改信息的ID
		var getno = obj.id.split('&');
		var deptno = getno[1];
		//将ID存入div中
		$("#deptno").val(deptno);
	}

	//修改的方法
	function bu() {
		//获取deptno
		var deptno = $("#txt_deptno").val();
		//获取文本框内的值
		var dname = $("#txt_dname").val();
		var loc = $("#txt_loc").val();
		$.ajax({
			url : "updateDeptMsgById.do",
			type : "POST",
			data : {
				deptno : deptno,
				dname : dname,
				loc : loc
			},
			//dataType:"",
			success : function(data) {
				alert("修改成功");
			},
			error : function(data) {
				alert("fail");
			}
		});
	}
	
</script>
</head>
<body>

	<table id="depttable">

	</table>
	
	<!--修改弹窗，默认隐藏 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改部门信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="txt_departmentname">部门编号</label>
                        <input type="text" name="txt_deptno" class="form-control" id="txt_deptno" placeholder="部门编号" disabled="disabled">
                    </div>
                    <div class="form-group">
                        <label for="txt_departmentname">部门名称</label>
                        <input type="text" name="txt_dname" class="form-control" id="txt_dname" placeholder="部门名称">
                    </div>
                    <div class="form-group">
                        <label for="txt_parentdepartment">部门地址</label>
                        <input type="text" name="txt_loc" class="form-control" id="txt_loc" placeholder="部门地址">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>关闭</button>
                    <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>