<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
 <html>
<head>
	<meta charset="utf-8" />
	<title>传送门-传送点</title>
	
	<link href="${pageContext.request.contextPath}/asserts/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/asserts/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/asserts/css/font-awesome/font-awesome.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/asserts/css/bootstrap-table/bootstrap-table.css" rel="stylesheet"type="text/css" />
	<link href="${pageContext.request.contextPath}/asserts/css/messenger/messenger.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/asserts/css/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/asserts/css/messenger/messenger-theme-ice.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/asserts/css/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>


	<script src="${pageContext.request.contextPath}/asserts/js/common.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/bootstrap/bootstrap.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/bootstrap-table/bootstrap-table.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/bootstrap-table/bootstrap-table-zh-CN.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/messenger/messenger.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/messenger/messenger-theme-future.js" type="text/javascript"></script>

	<script src="${pageContext.request.contextPath}/asserts/js/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/bootstrap-select/defaults-zh_CN.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/asserts/js/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>


	<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
	<script type="text/javascript"  src="http://api.map.baidu.com/api?v=2.0&ak=eKfSoepxBKNA7eHrIqtPDmMYIukGaaiG"></script>
	<style>
        @font-face {
            font-family: 'Glyphicons Halflings';
            src: url('${pageContext.request.contextPath}/asserts/font/bootstrap/glyphicons-halflings-regular.eot');
            src: url('${pageContext.request.contextPath}/asserts/font/bootstrap/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('${pageContext.request.contextPath}/asserts/font/bootstrap/glyphicons-halflings-regular.woff') format('woff'), url('${pageContext.request.contextPath}/asserts/font/bootstrap/glyphicons-halflings-regular.ttf') format('truetype'), url('${pageContext.request.contextPath}/asserts/font/bootstrap/glyphicons-halflings-regular.svg#glyphicons_halflingsregular') format('svg');
        }
        
        .fa-sync::before {
   			 content: "\f021";
        }
        
       [data-id=areaSelect] {
       	height:30px;
       }
       
       [data-id=teleporterAdminSelect] {
        height:30px;
       }
       
       [data-id=queryAreaSelect] {
       	height:30px;
       }
	   
	   [data-id=addTeleporterAreaSelect] {
		   height:30px;
	   }
    </style>
</head>
<body>
	<!-- 导航栏 -->
	<ol class="breadcrumb">
	  <li><a href="${pageContext.request.contextPath}/superAdmin_queryGeneralSituation.action">首页</a></li>
	  <li><a href="#">传送点</a></li>
	  <li class="active">查询传送点</li>
	</ol>
	
	<!-- 传送点 -->
	<div class="panel panel-info">
	  <div class="panel-heading"> 传送点管理</div>
	  <div class="panel-body">
	   	
	   	<!-- 查询条件 -->
	    <div class="panel panel-default">
		  <div class="panel-heading"> 查询条件</div>
		  	<div class="panel-body">
		  	
		  	<form action="#" class="form-horizontal" role="form">
		  
				 <div class="form-group">
				 	 <!-- 编号 -->
				    <label class="col-sm-3 control-label">编号</label>
				    <div class="col-sm-2">
				      <input class="form-control" id="queryTeleporterId" type="text"  value="">
				    </div>
				 
				 	 <!-- 录入日期 -->
				 	<label class="col-sm-3 control-label">录入日期</label>
				    <div class='input-group date col-sm-2' id='datetimepicker1'>
	                    <input type='text' class="form-control" disabled="true"/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	                
	             
	           
				 </div>
				 
				
				 <div  class="form-group" >
					<!-- 区域 -->
					<label class="col-sm-3 control-label" >区域</label>
					<div class="col-sm-2">
						<select  id="queryAreaSelect" class="selectpicker"  data-live-search="true">
													   
						</select>
						<button class="btn btn-default" id="clearQueryAreaSelectBtn">
							<span class="glyphicon glyphicon-trash"></span> 清空
						</button>					    
					</div>
					
					 <!-- 地址 -->
				 	<label class="col-sm-3 control-label">地址</label>
				    <div class='input-group date col-sm-2' id='datetimepicker1'>
	                    <input type='text' class="form-control" id="queryAddress"/>
	                    
	                </div>
				</div>
				
			  </form>
			  
		  	</div>
		  </div>
		  
		  <div class="panel-footer" style="text-align:right">
	        <button id="queryTeleporterBtn" type="button" class="btn btn-primary" >
	        	<span class="glyphicon glyphicon-search"></span> 查询
	        </button>
	        
	        <button id="addTeleporterBtn" type="button" class="btn btn-info" >
	        	<span class="glyphicon glyphicon-plus"></span> 新增
	        </button>
		  </div>
		</div>
	   
		<table id="grid"></table>
		
	  </div>
	  <div class="panel-footer">传送门</div>
	</div>
	
	
	<!-- 查看模态框 -->
	<div class="modal fade" id="viewTeleporterDialog" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">传送点详情</h4>
	            </div>
	            <div class="modal-body">
					<form action="#" class="form-horizontal" role="form">
						 <!-- 编号 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">编号</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="teleporterId" type="text" disable value="">
						     </fieldset>
						    </div>
						  </div>
						  
						 <!-- 区域 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">区域</label>
						    <div class="col-sm-9">
						   	 <fieldset disabled>
						      <input class="form-control" id="area" type="text" value="">
						   	 </fieldset>
						    </div>
						 </div>
						 
						 <!-- 地址 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">地址</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="address" type="text" value="">
						     </fieldset>
						    </div>
						 </div>
						 
						 <!-- 录入人 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">录入人</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="inputUser" type="text" value="">
						     </fieldset>
						    </div>
						 </div>
						 
						 <!-- 创建日期 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">创建日期</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="date" type="text" value="">
						     </fieldset>
						    </div>
						 </div>
						 
						 <div class="divider"> </div>
						 <!-- 传送点管理员 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">管理者姓名</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="teleporterName" type="text" value="">
						     </fieldset>
						    </div>
						 </div>
						 
						 <!-- 传送点管理员联系方式 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">管理者电话</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="teleporterPhone" type="text" value="">
						     </fieldset>
						    </div>
						 </div>
						 
						 
					</form>
				</div>
	            <div class="modal-footer">
	                <button id="viewTeleporterDialogOKBtn" type="button" class="btn btn-primary">确定</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>

	
	<!-- 修改传送点模特框 -->
	<div class="modal fade" id="editTeleporterDialog" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">传送点详情</h4>
	            </div>
	            <div class="modal-body">
					<form action="#" class="form-horizontal" role="form">
						 <!-- 编号 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">编号</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="editTeleporterId" type="text" disable value="">
						     </fieldset>
						    </div>
						  </div>
						  
						 <!-- 区域 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">区域</label>
						    <div class="col-sm-9">
							   	 <select  id="areaSelect" class="selectpicker"  data-live-search="true">
								                           
							   	 </select>
						    </div>
						 </div>
						 
						 <!-- 地址 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">地址</label>
						    <div class="col-sm-9">
						    
						      <input class="form-control" id="editAddress" type="text" value="">
			
						    </div>
						 </div>
						 
						 <!-- 录入人 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">录入人</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="editInputUser" type="text" value="">
						     </fieldset>
						    </div>
						 </div>
						 
						 <!-- 创建日期 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">创建日期</label>
						    <div class="col-sm-9">
						     <fieldset disabled>
						      <input class="form-control" id="editDate" type="text" value="">
						     </fieldset>
						    </div>
						 </div>
						 
						 <!-- 管理者 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">管理员</label>
						    <div class="col-sm-9">
							   	 <select id="teleporterAdminSelect" class="selectpicker"  data-live-search="true" id="editTeleporterAdmin">
								                               
							   	 </select>
						    </div>
						 </div>
						 
					</form>
				</div>
	            <div class="modal-footer">
	            	<button id="modifyTeleporterDialogCancelBtn" type="button" class="btn btn-default">取消</button>
	            	
	                <button id="modifyTeleporterDialogOKBtn" type="button" class="btn btn-primary">更新</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	
	<!-- 删除传送点模块框 -->
	<div class="modal fade" id="deleteTeleporterDialog" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">删除传送点</h4>
	            </div>
	            <div class="modal-body">
					您确定删除传送点<label id="deleteTeleporterName"></label>吗?
					<input type="hidden" id="deleteTeleporterId"/>
				</div>
	            <div class="modal-footer">
	            	<button id="deleteTeleporterDialogCancelBtn" type="button" class="btn btn-default">取消</button>
	            	
	                <button id="deleteTeleporterDialogOKBtn" type="button" class="btn btn-danger">删除</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>
	
	
	<!-- 新增模态框 -->
	<div class="modal fade" id="addTeleporterDialog" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">新增传送点</h4>
	            </div>
	            <div class="modal-body">
					<form action="#" class="form-horizontal" role="form">
							  
						 <!-- 区域 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label" style="margin-left:8px;">区域</label>
							<div class="col-sm-2">
								<select  id="addTeleporterAreaSelect" class="selectpicker"  data-live-search="true">
															   
								</select>
													    
							</div>
						 </div>
						 
						 <!-- 地址 -->
						 <div class="form-group">
						    <label class="col-sm-3 control-label">地址</label>
						    <div class="col-sm-9">
							  
						      <input class="form-control" id="addTeleporterAddress" type="text" value="" >
							  
						    </div>
						 </div>
						 
						 
						 
					</form>
				</div>
	            <div class="modal-footer">
	                <button id="addTeleporterDialogOKBtn" type="button" class="btn btn-primary">保存</button>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	</div>

	
	<!-- 等待框 -->
	<div class="modal fade" id="waitDialog">
	  <div class="modal-dialog modal-sm" style="text-align:center">
		
		   <i class="fa fa-spinner fa-pulse fa-5x"></i>
	  </div><!-- /.modal-dialog -->
	</div>

</body>

<script>
var $table;
/**分页查询传送点*/
var QUERY_TELEPORTER_URL = "${pageContext.request.contextPath}/teleporter_queryAllByPage.action";
/**查看传送点详情*/
var TELEPORTER_DETAIL_URL = "${pageContext.request.contextPath}/teleporter_getTeleporterDetailById.action";
/**全部城市*/
var QUERY_CITY_URL = "${pageContext.request.contextPath}/area_getOnlyIncludeCity.action";
/**获取全部管理员*/
var QUERY_TELEPORTER_ADMIN_URL = "${pageContext.request.contextPath}/teleporterAdmin_queryAllTelporterAdmin.action";
/**更新传送点信息*/
var UPDATE_TELEPORTER_URL = "${pageContext.request.contextPath}/teleporter_update.action";
/**删除传送点*/
var DELETE_TELEPORTER_URL = "${pageContext.request.contextPath}/teleporter_deleteTeleporter.action";
/**添加传送点*/
var ADD_TELEPORTER_URL = "${pageContext.request.contextPath}/teleporter_addTeleporter.action";

/**全局城市*/
var global_city = null;
/**全局管理员*/
var global_teleporter_admin = null;

$(function (){
	//初始化表格
	initMainTable();
	
	//初始化提示
	initMessenge();
	
	//初始化管理员数据
	initAdminData();
	
	//初始化区域
	initAreaData();

	//自动补全
	loadMapAutoCommplete("addTeleporterAddress");
	loadMapAutoCommplete("editAddress");


	$('#datetimepicker1').datetimepicker({
	     format : 'yyyy-mm-dd',
	     language : 'zh-CN'
	});
	
	$("#viewTeleporterDialogOKBtn").click(function (){
		$("#viewTeleporterDialog").modal('hide');
	});
	
	$("#modifyTeleporterDialogOKBtn").click(function (){
		updateTeleporter();
	});
	
	$("#modifyTeleporterDialogCancelBtn").click(function (){
		$("#editTeleporterDialog").modal('hide');
	});
	
	$("#deleteTeleporterDialogCancelBtn").click(function (){
		$("#deleteTeleporterDialog").modal('hide');
	})
	
	$("#deleteTeleporterDialogOKBtn").click(function (){
		deleteTeleporter();
	});
	
	$("#queryTeleporterBtn").click(function (){
		queryTeleporter();
	});
	
	$("#clearQueryAreaSelectBtn").click(function (){
		$('#queryAreaSelect').selectpicker('val','');
	});
	
	$("#addTeleporterBtn").click(function (){
		$("#addTeleporterDialog").modal();
	});
	
	$("#addTeleporterDialogOKBtn").click(function (){
		addTeleporter();
	});
});

/***
 * 初始提示框
 */
function initMessenge() {
	$._messengerDefaults = {
		    extraClasses: 'messenger-fixed messenger-theme-ice messenger-on-top'
	}
}


//初始化bootstrap-table的内容
function initMainTable () {
    //记录页面bootstrap-table全局变量$table，方便应用
    $table = $('#grid').bootstrapTable({
        url: QUERY_TELEPORTER_URL,                      //请求后台的URL（*）
        method: 'GET',                      //请求方式（*）
        //toolbar: '#toolbar',              //工具按钮用哪个容器
        striped: false,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 5,                     //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        search: false,                      //是否显示表格搜索
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列（选择显示的列）
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "teleporterId",                     //每一行的唯一标识，一般为主键列
        showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表
        //得到查询的参数
        queryParams : function (params) {
            //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            var temp = {   
                rows: params.limit,                         //页面大小
                page: (params.offset / params.limit) + 1,   
                
            };
            
          	//获取查询条件
        	var teleporterId = $("#queryTeleporterId").val();
        	var inputDate = $("#datetimepicker1").find("input").val();
        	var area = $("#queryAreaSelect").selectpicker('val');
            var address = $("#queryAddress").val();
			
        	temp['teleporterQueryCondition.ids'] = teleporterId;
        	temp['teleporterQueryCondition.date'] = inputDate;
        	temp['teleporterQueryCondition.areas'] = area;
			temp['teleporterQueryCondition.address'] = address;
            return temp;
        },
        columns: [{
            checkbox: true,  
            visible: true                  //是否显示复选框  
        }, {
            field: 'teleporterId',
            title: '编号',
            align: 'center',
            valign: 'middle',
           
        }, {
        	  field: 'area.name',
              title: '区域',
              align: 'center',
              valign: 'middle',
             
        }, {
            field: 'address',
            title: '地址',
            align: 'center',
            valign: 'middle',
            
        }, {
            field: 'superAdmin.username',
            title: '录入人',
            align: 'center',
            valign: 'middle',
       
        }, {
            field: 'createDate',
            title: '创建日期',
            align: 'center',
            valign: 'middle',
            
        }, {
            field:'teleporterId',
            title: '操作',
            width: 120,
            align: 'center',
            valign: 'middle',
            formatter: actionFormatter
        }, ],
        onLoadSuccess: function () {
        },
        onLoadError: function () {
        	 $.globalMessenger().post({
	                message: "数据加载失败",//提示信息
	                type: 'info',//消息类型。error、info、success
	                hideAfter: 5,//多长时间消失
	                showCloseButton:true,//是否显示关闭按钮
	                hideOnNavigate: true //是否隐藏导航
	
	 		});
        },
        onDblClickRow: function (row, $element) {
            var id = row.teleporterId;
            
            viewById(id, 'view');
        },
        rowStyle: function (row, index) {
             var classesArr = ['success', 'info'];
             var strclass = "";
             if (index % 2 === 0) {//偶数行
                  strclass = classesArr[0];
             } else {//奇数行
                 strclass = classesArr[1];
             }
              return { classes: strclass };
        },//隔行变色
    });
};

//连接字段格式化
function linkFormatter(value, row, index) {                
    return "<a href='" + value + "' title='单击打开连接' target='_blank'>" + value + "</a>";
}
//Email字段格式化
function emailFormatter(value, row, index) {
    return "<a href='mailto:" + value + "' title='单击打开连接'>" + value + "</a>";
}

//性别字段格式化
function sexFormatter(value) {
    if (value == "女") { color = 'Red'; }
    else if (value == "男") { color = 'Green'; }
    else { color = 'Yellow'; }

    return '<div  style="color: ' + color + '">' + value + '</div>';
}

//操作栏的格式化
function actionFormatter(value, row, index) {
    var id = value;
    var result = "";
    result += "<a href='javascript:;' class='btn btn-xs green' onclick=\"viewById('" + id + "')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
    result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"editViewById('" + id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
    result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"deleteById('" + id + "','" + row.address + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";

    return result;
}

/**
 * 获取所有传送点管理员数据
 */
function initAdminData(){
	$.ajax({
		url:QUERY_TELEPORTER_ADMIN_URL,
		type:'POST',
		dataType:'json',
		success:function (result) {
			if (200 == result.code) {
				global_teleporter_admin = result.message;
				
				//初始化管理员区域
				for (var i = 0 ; i < global_teleporter_admin.length; i++){
					   var option = $('<option></option>');
					   option.attr('value', global_teleporter_admin[i].teleporterAdminId);
		               option.text(global_teleporter_admin[i].username+" "+global_teleporter_admin[i].tel);
		               $('#teleporterAdminSelect').append(option);
					  
				}
				
				$('#teleporterAdminSelect').selectpicker('refresh');  
			    $('#teleporterAdminSelect').selectpicker('render');
			}else {
				$.globalMessenger().post({
	                message: result.message,//提示信息
	                type: 'error',//消息类型。error、info、success
	                hideAfter: 2,//多长时间消失
	                showCloseButton:true,//是否显示关闭按钮
	                hideOnNavigate: true //是否隐藏导航
	
	 			});
			}
		}
	});
		
}

/**
 * 初始化区域
 */
function initAreaData(){
	$.ajax({
		url:QUERY_CITY_URL,
		type:'POST',
		dataType:'json',
		beforeSend:function (){
			$("#waitDialog").modal();
		},
		success:function (result){
			console.log(result);
			$("#waitDialog").modal('hide');
			if (200 == result.code){
				global_city = result.message;
				
				//初始化区域
				for (var i = 0 ; i < global_city.length; i++){
					   var option = $('<option></option>');
		               option.attr('value', global_city[i].id);
		               option.text(global_city[i].name);
		               
		               $('#areaSelect').append(option);
		               
		              
				}
				
				$('#areaSelect').selectpicker('refresh');  
			    $('#areaSelect').selectpicker('render');
			    
			    //初始化条件区域
				for (var i = 0 ; i < global_city.length; i++){
					   var option = $('<option></option>');
		               option.attr('value', global_city[i].id);
		               option.text(global_city[i].name);
		               $('#queryAreaSelect').append(option);
		               
					  
				} 
				$('#queryAreaSelect').selectpicker('val','');
			   
			    $('#queryAreaSelect').selectpicker('refresh'); 
			    $('#queryAreaSelect').selectpicker('render');
				
				//初始化新增区域
				for (var i = 0 ; i < global_city.length; i++){
					   var option = $('<option></option>');
		               option.attr('value', global_city[i].id);
		               option.text(global_city[i].name);
		               $('#addTeleporterAreaSelect').append(option);
					  
				} 
				$('#addTeleporterAreaSelect').selectpicker('val','');
			   
			    $('#addTeleporterAreaSelect').selectpicker('refresh'); 
			    $('#addTeleporterAreaSelect').selectpicker('render');
			   
			}else {
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'error',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
			}
		},
		error:function (){
            $.globalMessenger().post({
                message: "操作失败",//提示信息
                type: 'error',//消息类型。error、info、success
                hideAfter: 5,//多长时间消失
                showCloseButton:true,//是否显示关闭按钮
                hideOnNavigate: true //是否隐藏导航

 			});
			$("#waitDialog").modal('hide');
		}
	});
}

/**
 * 查看传送点详情
 */
function viewById(id) {
	console.log('sd');
	var requestParam = {
			"teleporter.teleporterId":id
	};
	$.ajax({
		url:TELEPORTER_DETAIL_URL,
		type:'POST',
		data:requestParam,
		dataType:'json',
		beforeSend:function (){
			$("#waitDialog").modal();
		},
		success:function (result){
			console.log(result);
			$("#waitDialog").modal('hide');
			if (200 == result.code){
				//填充数据
				var teleporter = result.message;
				//编号
				$("#teleporterId").val(teleporter.teleporterId);
				//区域
				$("#area").val(teleporter.area.name);
				//地址
				$("#address").val(teleporter.address);
				//录入人
				$("#inputUser").val(teleporter.superAdmin.username);
				//创建日期
				$("#date").val(teleporter.createDate);
				//传送点管理员
				console.log(teleporter.teleporterAdmin);
				if (null != teleporter.teleporterAdmin){
					$("#teleporterName").val(teleporter.teleporterAdmin.username);
					$("#teleporterPhone").val(teleporter.teleporterAdmin.tel);
				}else {
					$("#teleporterName").val("此传送点暂无管理员");
					$("#teleporterPhone").val("");
				}
				//显示对话框
				$("#viewTeleporterDialog").modal();
					
				
			}else {
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'error',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
			}
			
		},
		error:function (){
	            $.globalMessenger().post({
	                message: "操作失败",//提示信息
	                type: 'error',//消息类型。error、info、success
	                hideAfter: 5,//多长时间消失
	                showCloseButton:true,//是否显示关闭按钮
	                hideOnNavigate: true //是否隐藏导航
	
	 		});
			$("#waitDialog").modal('hide');
		}
	});
	
}

/**
 * 编辑传送门
 */
function editViewById(id) {
	
	if (null == global_teleporter_admin) {
		initAdminData();
	}
	
	//第一次获取城市获取请求，后面请求不需要了。
	 if (null == global_city) {
		
		$.ajax({
			url:QUERY_CITY_URL,
			type:'POST',
			success:function (result){
				if (200 == result.code) {
					global_city = result.message;
					
					//初始化区域
					for (var i = 0 ; i < global_city.length; i++){
						   var option = $('<option></option>');
			               option.attr('value', global_city[i].id);
			               option.text(global_city[i].name);
			               $('#areaSelect').append(option);
						  
					}
					
					$('#areaSelect').selectpicker('refresh');  
				    $('#areaSelect').selectpicker('render');
					editEleporterHandle(id);
				}else {
					$.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'info',//消息类型。error、info、success
		                hideAfter: 2,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 			});
				}
			}
		});
	}else{
		editEleporterHandle(id);
	}
	
	
} 

/**
 * 编辑传送点处理方法
 */
function editEleporterHandle(id){
	console.log("one");
	var requestParam = {	
			"teleporter.teleporterId":id
	}
	$.ajax({
		url:TELEPORTER_DETAIL_URL,
		type:'POST',
		data:requestParam,
		dataType:'json',
		async : false,
		beforeSend:function (){
			$("#waitDialog").modal();
		},
		success:function (result){
			console.log(result);
			$("#waitDialog").modal('hide');
			if (200 == result.code){
				//填充数据
				var teleporter = result.message;
				//编号
				$("#editTeleporterId").val(teleporter.teleporterId);
				
				$('#areaSelect').selectpicker('val',teleporter.area.id);
				
				//地址
				$("#editAddress").val(teleporter.address);
				//录入人
				$("#editInputUser").val(teleporter.superAdmin.username);
				//创建日期
				$("#editDate").val(teleporter.createDate);
				/* //传送点管理员
				console.log(teleporter.teleporterAdmin);
				if (null != teleporter.teleporterAdmin){
					$("#teleporterName").val(teleporter.teleporterAdmin.username);
					$("#teleporterPhone").val(teleporter.teleporterAdmin.tel);
				}else {
					$("#teleporterName").val("此传送点暂无管理员");
					$("#teleporterPhone").val("");
				} */
				console.log(teleporter.teleporterAdmin);
				if (null != teleporter.teleporterAdmin) {
					$('#teleporterAdminSelect').selectpicker('val',teleporter.teleporterAdmin.teleporterAdminId);
					console.log("设置选中的值"+teleporter.teleporterAdmin.teleporterAdminId); 
				}else {
					$('#teleporterAdminSelect').selectpicker('val',['noneSelectedText'])
					$("#teleporterAdminSelect").selectpicker('refresh');  
				    $('#teleporterAdminSelect').selectpicker('render');
				}
				$("#editTeleporterDialog").modal();
				
			}else {
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'error',//消息类型。error、info、success
		                hideAfter: 2,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
			}
			
		},
		error:function (){
	            $.globalMessenger().post({
	                message: "操作失败",//提示信息
	                type: 'error',//消息类型。error、info、success
	                hideAfter: 5,//多长时间消失
	                showCloseButton:true,//是否显示关闭按钮
	                hideOnNavigate: true //是否隐藏导航
	
	 		});
			$("#waitDialog").modal('hide');
		}
	});
	
}

/**
 * 通过id删除传送点点击事件
 */
function deleteById(id,teleporterName){
	$("#deleteTeleporterId").val(id);
	$("#deleteTeleporterName").html(teleporterName);
	
	//显示删除框
	$("#deleteTeleporterDialog").modal();
}


/*******增删改查请求区*********/
/**
 * 查询传送点
 */
function queryTeleporter(){
	//获取查询条件
	var teleporterId = $("#queryTeleporterId").val();
	var inputDate = $("#datetimepicker1").find("input").val();
	console.log("时间:"+$("#datetimepicker1").find("input").val());
	var area = $("#queryAreaSelect").selectpicker('val');
	var address = $("#queryAddress").val();
	
	
	
	var requestParam = {
			"teleporterQueryCondition.ids":	teleporterId,
			"teleporterQueryCondition.date":inputDate,
			"teleporterQueryCondition.areas":area,
			"teleporterQueryCondition.address" : address.trim(),
			"page":1,
			"rows":5
	}
	$.ajax({
		url:QUERY_TELEPORTER_URL,
		method:'POST',
		data:requestParam,
		dataType:'json',
		beforeSend:function (){
			$("#waitDialog").modal();
		},
		success:function (result){
			
			$("#waitDialog").modal('hide');
			if (200 == result.code){
				$("#grid").bootstrapTable('load',result);
			}else {
				$.globalMessenger().post({
	                message: "请求错误",//提示信息
	                type: 'error',//消息类型。error、info、success
	                hideAfter: 5,//多长时间消失
	                showCloseButton:true,//是否显示关闭按钮
	                hideOnNavigate: true //是否隐藏导航
	
	 			});
			}
		},
		error:function (){
			$("#waitDialog").modal('hide');
			$.globalMessenger().post({
                message: "操作失败",//提示信息
                type: 'error',//消息类型。error、info、success
                hideAfter: 5,//多长时间消失
                showCloseButton:true,//是否显示关闭按钮
                hideOnNavigate: true //是否隐藏导航

 			});
		}
		
		
	});
	
}


/**
 * 更新传送点信息
 */
function updateTeleporter(){
	//传送点id
	var teleporterId = $("#editTeleporterId").val();
	//区域
	var areaId = $("#areaSelect").selectpicker('val');
	//地址
	var address = $("#editAddress").val();
	//管理员
	var teleporterAdminId = $("#teleporterAdminSelect").selectpicker('val');
	
	if (null == teleporterId || teleporterId == "") {
		$.globalMessenger().post({
            message: "传送点ID不能为空",//提示信息
            type: 'error',//消息类型。error、info、success
            hideAfter: 5,//多长时间消失
            showCloseButton:true,//是否显示关闭按钮
            hideOnNavigate: true //是否隐藏导航

		});
		return;
	}
	
	var requestParam = {
		"teleporter.teleporterId":	teleporterId,
		"teleporter.address":address,
		"teleporter.teleporterAdmin.teleporterAdminId":teleporterAdminId,
		"teleporter.area.id":areaId
	};
	
	$.ajax({
		url:UPDATE_TELEPORTER_URL,
		method:'POST',
		data:requestParam,
		dataType:'json',
		beforeSend:function (){
			$("#waitDialog").modal();
		},
		success:function (result){
			console.log(result);
			$("#waitDialog").modal('hide');
			if (200 == result.code){
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'success',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
				//关闭当前对话框
				$("#editTeleporterDialog").modal('hide');
				//刷新当前页
				$('#grid').bootstrapTable('refresh');
			}else {
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'error',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
			}
			
		},
		error:function (){
	         $.globalMessenger().post({
	                message: "操作失败",//提示信息
	                type: 'error',//消息类型。error、info、success
	                hideAfter: 5,//多长时间消失
	                showCloseButton:true,//是否显示关闭按钮
	                hideOnNavigate: true //是否隐藏导航
	
	 		});
			$("#waitDialog").modal('hide');
		}
	});
	
}

/**
 * 删除传送点
 */
function deleteTeleporter(){
	//传送点id
	var teleporterId = $("#deleteTeleporterId").val();
	
	//校验id
	if (null == teleporterId || "" == teleporterId.trim()) {
		$.globalMessenger().post({
            message: "传送点ID不能为空!",//提示信息
            type: 'error',//消息类型。error、info、success
            hideAfter: 5,//多长时间消失
            showCloseButton:true,//是否显示关闭按钮
            hideOnNavigate: true //是否隐藏导航

		});
		return;
	}
	
	var requestParam = {
		"teleporter.teleporterId":	teleporterId
	};
	$.ajax({
		url:DELETE_TELEPORTER_URL,
		method:'POST',
		data:requestParam,
		dataType:'json',
		beforeSend:function (){
			$("#waitDialog").modal();
		},
		success:function (result){
			console.log(result);
			$("#waitDialog").modal('hide');
			if (200 == result.code){
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'success',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
				//关闭当前对话框
				$("#deleteTeleporterDialog").modal('hide');
				//刷新当前页
				$('#grid').bootstrapTable('refresh');
			}else {
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'error',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
			}
			
		},
		error:function (){
	         $.globalMessenger().post({
	                message: "操作失败",//提示信息
	                type: 'error',//消息类型。error、info、success
	                hideAfter: 5,//多长时间消失
	                showCloseButton:true,//是否显示关闭按钮
	                hideOnNavigate: true //是否隐藏导航
	
	 		});
			$("#waitDialog").modal('hide');
		}
	});
}

/**
 * 添加传送点
 */
function addTeleporter(){
	//区域
	var area = $("#addTeleporterAreaSelect").selectpicker('val');
	//地址
	var address = $("#addTeleporterAddress").val();
	
	if (null == area || "" == area.trim()) {
		$.globalMessenger().post({
            message: "区域不能为空!",//提示信息
            type: 'error',//消息类型。error、info、success
            hideAfter: 5,//多长时间消失
            showCloseButton:true,//是否显示关闭按钮
            hideOnNavigate: true //是否隐藏导航

		});
		return;
	}
	
	if (null == address || "" == address.trim()) {
		$.globalMessenger().post({
            message: "地址不能为空!",//提示信息
            type: 'error',//消息类型。error、info、success
            hideAfter: 5,//多长时间消失
            showCloseButton:true,//是否显示关闭按钮
            hideOnNavigate: true //是否隐藏导航

		});
		return;
	}
	
	var requestParam = {
		"teleporter.address" : address,
		"teleporter.area.id" : area
	};
	
	$.ajax({
		url:ADD_TELEPORTER_URL,
		type:'POST',
		data:requestParam,
		dataType:'json',
		beforeSend:function (){
			$("#waitDialog").modal();
		},
		success:function (result){
			$("#waitDialog").modal('hide');
			if (200 == result.code){
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'success',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
				//关闭当前对话框
				$("#addTeleporterDialog").modal('hide');
			}else {
				 $.globalMessenger().post({
		                message: result.message,//提示信息
		                type: 'error',//消息类型。error、info、success
		                hideAfter: 5,//多长时间消失
		                showCloseButton:true,//是否显示关闭按钮
		                hideOnNavigate: true //是否隐藏导航
		
		 		});
			}
		},
		error:function (){
			 $("#waitDialog").modal('hide');
			 $.globalMessenger().post({
						message: result.message,//提示信息
						type: 'error',//消息类型。error、info、success
						hideAfter: 5,//多长时间消失
						showCloseButton:true,//是否显示关闭按钮
						hideOnNavigate: true //是否隐藏导航
		
				});
		}
	});
}
</script>