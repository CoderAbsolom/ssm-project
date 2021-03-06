//var pageList = [10,20,50,150];
var emaliregexreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;// 邮箱正则表达式
var tphonereg = /^0\d{2,3}-?\d{7,8}$/;// 固定电话号码
var mobilephonereg = /^((13[0-9])|(15[0-9])|(18[0-9])|(15[0-9])|(15[0-9]))[0-9]{8}$/;// 手机号码
var numberreg = /^[0-9]*$/; // 输入数字
var decimalreg =/^([0]\.[0-9]*)|^[1]{1}$/;//小数点
var ipreg =/^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;//ip
var hanzireg = /^[\u4e00-\u9fa5]+$/;//汉字
var characterreg=/^[a-zA-Z_0-9%@-]+$/;
var commonUtil = {
	
	/**
	 * 获取项目路径
	 * 
	 * @returns
	 */
	getRealpath : function() {
		return $("#realpath").val();
	},
	/**
	 * /** 初始化datagrid方法
	 * 
	 * @param tableid
	 *            表格id
	 * @param title
	 *            标题
	 * @param url
	 *            一部提交url
	 * @param keyid
	 *            主键
	 * @param toolbarId
	 *            绑定的（例如：查询条件）div的id
	 * @param ispagination
	 *            是否有分页工具栏（true,false） 默认有
	 * @param issingleSelect
	 *            是否单选（true,false） 默认多选
	 * @param queryParams
	 *            查询参数
	 * @param isclearChecked
	 *           是否在刷新时清除勾选项
	 */
	init_dategrid : function(tableid, title, url, keyid, param, toolbarId,
			ispagination, issingleSelect,isclearChecked,clickFuc) {
		var setting ={
				// title : title,
				width : 'auto',
				height : 'auto',
				fitColumns : true,// True
				// 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
				border : true,
				collapsible : false,// 是否可折叠的
				nowrap : false,
				fit : true,// 自动大小(设置为true时 当最大化窗口也会跟着放大)
				striped : true,// True 就把行条纹化。（即奇偶行使用不同背景色）
				url : url,
				remoteSort : false,
				queryParams : param,
				idField : keyid,
				singleSelect : (issingleSelect == "" || issingleSelect == null) ? false
						: issingleSelect,// 是否单选
				pagination : (ispagination !=false) ? true
						: ispagination,// 分页控件
				rownumbers : true,// 行号
				toolbar : '#' + toolbarId,
				loadMsg : '数据装载中......',
				onBeforeLoad : function() {
					if(isclearChecked!=false){
						$('#' + tableid).datagrid('clearChecked');// 刷新前清空所有勾选的
					}
					
				}
		 };
		if(clickFuc!=null){
			setting=$.extend(true,setting,clickFuc);
		}
		$('#' + tableid).datagrid(setting);
		if((ispagination !=false)){
			// 设置分页控件
			var p = $('#' + tableid).datagrid('getPager');
			$(p).pagination({
				pageSize : 10,// 每页显示的记录条数，默认为10
				pageList : [ 5, 10, 15, 100 ],// 可以设置每页记录条数的列表
				beforePageText : '第',// 页数文本框前显示的汉字
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});
		}
		

	},

	/**
	 * 初始化datagrid方法
	 * 
	 * @param tableid
	 *            表格id
	 * @param title
	 *            标题
	 * @param url
	 *            一部提交url
	 * @param keyid
	 *            主键
	 * @param mergeCellsField
	 *            合并单元格的属性名
	 * @param ispagination
	 *            是否有分页工具栏（true,false）
	 * @param issingleSelect
	 *            是否单选（true,false）
	 * @param queryParams
	 *            查询参数
	 */
	inintmergeCellsDatagrid : function(tableid, title, url, keyid, param,
			mergeCellsField, toolbarId, ispagination, issingleSelect) {
		$('#' + tableid)
				.datagrid(
						{
							width : 'auto',
							height : 'auto',
							// title : title,
							fitColumns : true,// True
							// 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
							border : true,
							collapsible : false,// 是否可折叠的
							nowrap : false,
							fit : true,// 自动大小(设置为true时 当最大化窗口也会跟着放大)
							striped : true,// True 就把行条纹化。（即奇偶行使用不同背景色）
							url : url,
							remoteSort : false,
							idField : keyid,
							queryParams : param,
							singleSelect : (issingleSelect == "" || issingleSelect == null) ? true
									: issingleSelect,// 是否单选
							pagination : (ispagination == "" || ispagination == null) ? true
									: ispagination,// 分页控件
							pageList : [ 10, 20, 50, 150 ],
							rownumbers : true,// 行号
							toolbar : '#' + toolbarId,
							loadMsg : '数据装载中......',
							onBeforeLoad : function() {
								$('#' + tableid).datagrid('clearChecked');
							},
							onLoadSuccess : function(rowData) {// 合并单元格
								commonUtil.MergeCells(tableid, mergeCellsField);
							}
						});

		// 设置分页控件
		var p = $('#' + tableid).datagrid('getPager');
		$(p).pagination({
			pageSize : 10,// 每页显示的记录条数，默认为10
			pageList : [ 5, 10, 15, 100 ],// 可以设置每页记录条数的列表
			beforePageText : '第',// 页数文本框前显示的汉字
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
	},
	/**
	 * EasyUI DataGrid根据字段动态合并单元格
	 * 
	 * @param fldList
	 *            要合并table的id
	 * @param fldList
	 *            要合并的列,用逗号分隔(例如："name,department,office");
	 */
	MergeCells : function(tableID, fldList) {
		var Arr = fldList.split(",");
		var dg = $('#' + tableID);
		var fldName;
		var RowCount = dg.datagrid("getRows").length;
		var span;
		var PerValue = "";
		var CurValue = "";
		var length = Arr.length - 1;
		for (i = length; i >= 0; i--) {
			fldName = Arr[i];
			PerValue = "";
			span = 1;
			for (row = 0; row <= RowCount; row++) {
				if (row == RowCount) {
					CurValue = "";
				} else {
					CurValue = dg.datagrid("getRows")[row][fldName];
				}
				if (PerValue == CurValue) {
					span += 1;
				} else {
					var index = row - span;
					dg.datagrid('mergeCells', {
						index : index,
						field : fldName,
						rowspan : span,
						colspan : null
					});
					span = 1;
					PerValue = CurValue;
				}
			}
		}
	},
	/**
	 * 字典表下拉列表组件（从缓存中取得）
	 * 
	 * @param id
	 * @param headercode 大类代码
	 */
	initDictionaryLinecombobox : function(id, headercode, value, text) {
		$('#' + id).empty();
		var arr = [];
		$.post(commonUtil.getRealpath()+"/dictionaryline/findDictionaryLinebyHeadercode.do", {
			"headercode" : headercode
		}, function(data) {
			var states = data.rows;
			for (var i = 0; i < states.length; i++) {
				arr.push({
					'value' : states[i].value,
					'linename' : states[i].linename
				});
			}
			$('#' + id).combobox({
				valueField : 'value',
				textField : 'linename',
				multiple : false,
				data : arr
			});
			if (value != '' && value != null && value != undefined) {
				var val = $('#' + id).combobox("getData");
				var len = val.length;
				for (var int = 0; int < len; int++) {
					if (val[int].value == value) {
						$('#' + id).combobox("select", val[int].value);
					}
				}
			}

			if (text != '' && text != null && text != undefined) {
				var val = $('#' + id).combobox("getData");
				var len = val.length;
				for (var i = 0; i < len; i++) {
					if (val[i].linename == text) {
						$('#' + id).combobox("select", val[i].value);
					}
				}
			}
		});
	},
	/**
	 * 获取session中存的按钮级别的代码（控制权限）
	 */
	setpermissionbutton : function() {
		var date = $("#permissionSession").val();
		if (date.length > 0) {
			var permission = date.split(",");
			for (var i = 0; i < permission.length; i++) {
				$('#' + $.trim(permission[i])).show();
			}
		}
		//$(".easyui-linkbutton").show();
	},
	/**
	 * 
	 * @param treeid
	 *            表单id
	 * @param data
	 *            封装树的数据
	 * @param isCheck
	 *            是否带复选框
	 * @param isedit
	 *            是否可拖拽
	 * @param isasync
	 *            是否异步
	 * @param chkboxType
	 *            父子关联关系类型 参考ztree参数定义
	 * @param url
	 *            异步的请求地址
	 * @param callbackEvent
	 *            各种事件的定义 例如{ onCheck:
	 *            zTreeOnClick,//zTreeOnClick为自己定义的点击事件的回调函数，其他事件参考ztree onDrop :
	 *            ZTreeMove,//移动事件 onCheck: zTreeOnCheck,
	 *            onExpand:zTreeOnExpand, onDblClick: zTreeOnDblClick }
	 */
	initztree : function(treeid, data, isCheck, isedit, isasync,
			chkboxTypeParam, url, callbackEvent,setParam) {
		var set = {
			data : {
				simpleData : {
					enable : true,
					isSimpleData : true, // 数据是否采用简单 Array 格式，默认false
					treeNodeKey : "id", // 在isSimpleData格式下，当前节点id属性
					treeNodeParentKey : "pId", // 在isSimpleData格式下，当前节点的父节点id属性
					showLine : true
				}
			},
			callback : callbackEvent
		};
		/**
		 * 是否可拖拽
		 */
		if (isedit) {
			set['edit'] = {
				enable : true,
				showRemoveBtn : false,
				showRenameBtn : false,
				drag : {
					inner : false,
					prev : false,
					next : false,
					siMove : true,
					borderMax : 1000
				}

			};
		}
		/**
		 * 是否复选框
		 */
		if (isCheck) {
			set['check'] = {
				enable : true,
				chkStyle : "checkbox",
				chkboxType : chkboxTypeParam
			};
		}
		/**
		 * 是否异步
		 */
		if (isasync) {
			set['async'] = {
				enable : true,
				url : commonUtil.getRealpath()+"/"+url,
				type : "post",
				autoParam : [ "id", 'pId','iconSkin' ]
			};
		}
		if(setParam!=null){
			setting=$.extend(true,set,setParam);
		}
		var zNodes;
		zNodes = data;
		$.fn.zTree.init($("#" + treeid), set, zNodes);
	},
	/**
	 * 弹出框(用于二级弹出框)
	 * 
	 * @param url
	 * @param id
	 * @param title
	 * @param width
	 * @param height
	 */
	openWin : function(url, id, title, width, height,closeCallBack,setParam) {
		var setting ={
            "id" : id,
            lock : true,
            title : title,
            width : width,
            height : height,
            background : '#000', // 背景色
            opacity : 0, // 透明度
            resize : false,
            drag : false,//是否允许拖拽
            max : false,
            min : false,
            close :function () {
                if(null!=closeCallBack){
                    closeCallBack();
                }
            }
        };
        if(setParam!=null){
            setting=$.extend(true,setting,setParam);
        }
		art.dialog.open(url,setting );
	},
    openDialog: function (id, title, divid, width, height) {
        return art.dialog({
            id: id,
            title: title,
            width: width,
            height: height,
            max: false,
            min: false,
            background: '#000', // 背景色
            opacity: 0, // 透明度
            lock :true,
            resize: false,
            drag: false,//是否允许拖拽
            content: document.getElementById(divid)
        });
    },
	/**
	 * confirm弹窗
	 * 
	 * @param title标题
	 * @param msg
	 *            信息
	 * @param callback
	 *            回调函数
	 */
	showConfirm : function(title, msg, callback) {
		$.messager.confirm(title, msg, function(r) {
			if (r) {
				if (jQuery.isFunction(callback))
					callback.call();
			}
		});
	},

	/**
	 * 
	 * @param msg
	 * @param title
	 */
	showProgerss : function(msg, title) {
		if (!title) {
			title = "请稍等";
		}
		if (!msg) {
			msg = "正在保存数据。。。";
		}
		$.messager.progress({
			title : title,
			msg : msg
		});
	},
	/**
	 * easyui弹窗
	 * 
	 * @param msg
	 *            消息体
	 * @param title
	 *            窗口标题
	 * @param isAlert
	 *            可选 是否alert弹窗
	 * @param showType
	 *            可选 是否自动4秒关闭
	 */
	showMessages : function(msg, title, isAlert, showType) {
		var timeout = 0;
		if (!title) {
			title = "温馨提示";
		}
		if (!showType) {
			showType = "slide";
			timeout = 4000;
		}
		if (isAlert !== undefined && isAlert) {
			$.messager.alert(title, msg);
		} else {
			$.messager.show({
				title : title,
				msg : msg,
				timeout : timeout,
				showType : showType,
				style : {
					right : '',
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
					bottom : ''
				}
			});

		}
		$.messager.progress('close');
	},
	/**
	 * 用于弹出层使用 获取选中的列数据
	 * 
	 * @returns
	 */
	getChecked : function(id) {
		var rows = $('#' + id).datagrid('getChecked');
		return rows;
	},
	/**
	 * 用于弹出层使用 获取选中的列数据
	 * 
	 * @returns
	 */
	getSelect : function(id) {
		var rows = $('#' + id).datagrid('getSelected');
		return rows;
	},
	/**
	 * 用于弹出层使用 获取选中的列数据
	 * 
	 * @returns
	 */
	getSelections : function(id) {
		var rows = $('#' + id).datagrid('getSelections');
		return rows;
	},
	/**
	 * 刷新页面 id datagrid的id
	 */
	loadtable : function(id) {
		$("#" + id).datagrid("load");
	},

	/**
	 * 刷新当前页
	 * 
	 * @param id
	 *            datagrid的id
	 */
	reloadtable : function(id) {
		$("#" + id).datagrid("reload");
	},

	/**
	 * 全选
	 * 
	 * allCkb 全选复选框的id items 复选框的name
	 */
	allCheck : function(allCkb, items) {
		$('input[name=' + items + ']:checkbox').attr("checked",
				$("#" + allCkb).is(':checked '));
	},

	/**
	 * 关闭弹出框
	 */
	closedialog : function() {
		art.dialog.open.api.close();
	},
	/**
	 * 得到父类窗口的句柄
	 */
	getParentWindows : function() {
		return art.dialog.open.origin;
	},
	/**
	 * 验证不能为空以及允许为空但在空的情况下验证格式
	 * 
	 * @param showmsg
	 *            显示错误信息的id
	 * @param regex
	 *            验证的正则表达式
	 * @param inputid
	 *            要验证的输入框
	 * @param msg
	 *            错误消息
	 * @param isnull
	 *            是否允许为空
	 * @returns {Boolean}
	 */
	checkinfo : function(showmsg, regex, inputid, msg, isnull,regexmsg) {
		var inputname = $('#' + inputid).val();
		if (isnull == false && (inputname == null || inputname == '')) {
			$('#' + showmsg).empty();
			$('#' + showmsg).append("<font color='red'>" + msg + "</font>");
			$('#' + inputid).focus();
			return false;
		} else if (regex != null && inputname != "" && !regex.test(inputname)) {
			$('#' + showmsg).empty();
			if(regexmsg!=null){
				$('#' + showmsg).append("<font color='red'>" + regexmsg + "</font>");
			}else{
				$('#' + showmsg).append("<font color='red'>" + msg + "</font>");
			}
			$('#' + inputid).val("");
			$('#' + inputid).focus();
			return false;
		}else {
			$('#' + showmsg).empty();
			return true;
		}
	},
	/**
	 * 根据返回的消息 进行相关操作
	 * 
	 * @param issuccess
	 *            是否成功
	 * @param errormsg
	 *            显示错误提示消息
	 * @param successmsg
	 *            成功提示消息
	 * @param focusID
	 *            重新获取焦点的ID
	 * @param showMsgId
	 *            显示错误的id
	 * @param parentid
	 *            父类窗口的 表单id
	 * @returns
	 */
	showmsg : function(issuccess, errormsg, successmsg, focusID, showMsgId,
			parentid) {
		if (issuccess == false) {
			if (errormsg == undefined || errormsg == null) {
				errormsg = "操作失败！";
			}
			$('#' + showMsgId)
					.html("<font color='red'>" + errormsg + "</font>");
			if(focusID!=null){
				$('#' + focusID).val('');
				$('#' + focusID).focus();
			}
			return false;
		} else if (issuccess == true) {
			if (parentid != null) {
				commonUtil.getParentWindows().commonUtil.reloadtable(parentid);
			}
			commonUtil.closedialog();
			return true;
		} else {
			if (errormsg == undefined || errormsg == null) {
				errormsg = "操作失败！";
			}
			$('#' + showMsgId)
					.html("<font color='red'>" + errormsg + "</font>");
			if (focusID != null) {
				$('#' + focusID).val('');
				$('#' + focusID).focus();
			}

			return false;
		}

	},

	/**
	 * 
	 * @param issuccess 是否成功
	 * @param errormsg 错误信息
	 * @param successmsg 成功信息
	 * @param focusID 验证表单id
	 * @param showMsgId 显示错误信息id
	 * @returns {Boolean}
	 */
	checkingshowmsg : function(issuccess, errormsg, successmsg, focusID,
			showMsgId) {
		if (issuccess != true) {
			$('#' + showMsgId)
					.html("<font color='red'>" + errormsg + "</font>");
			if(null!=focusID){
				$('#' + focusID).val('');
				$('#' + focusID).focus();
			}
			return false;
		}else{
			$('#' + showMsgId)
			.html("");
		}
		return true;
	},
	/**
	 * 得到选中的节点
	 * 
	 * @param id
	 * @returns
	 */
	getTreeSelected : function(id) {
		var treeObj = $.fn.zTree.getZTreeObj(id);
		if(treeObj==null){
			return null;
		}
		var nodes = treeObj.getSelectedNodes();
		return nodes;
	},
	/**
	 *  删除操作
	 * @param errormsg  没有选择时的提示信息
	 * @param url  请求地址
	 * @param tableid dategrid表单id
	 * @param customerArray 提交的数据
	 */
	deleteOperate : function(errormsg,url,tableid,pushArrayFuc,successCallBack,confirmMsg,operateFailmsg){
		var rows = commonUtil.getChecked(tableid);
		if (rows == null || rows.length < 1) {
			commonUtil.showMessages(errormsg, "提示");
			return;
		}
		var customerArray = new Array();
		if(pushArrayFuc!=null){
			pushArrayFuc(rows,customerArray);
		}
		var confirmMessage="确认要删除？";
		if(confirmMsg!=null){
			confirmMessage=confirmMsg;
		}
		var operateFailMsg="删除失败！";
		if(operateFailmsg!=null){
			operateFailMsg=operateFailmsg;
		}
		$.messager.confirm("操作提示",confirmMessage,function(data){
			if(!data){
				return false;
			}else{
				$.ajax({
					url : commonUtil.getRealpath()
							+ url,
					type : "POST",
					contentType : 'application/json;charset=utf-8', // 设置请求头信息
					dataType : "json",
					data : JSON.stringify(customerArray), // 将Json对象序列化成Json字符串，JSON.stringify()原生态方法
					success : function(data) {
						if (data.success) {
							if(successCallBack!=null){
                            	successCallBack(rows);
                            }
							commonUtil.reloadtable(tableid);
						} else {
							commonUtil.showMessages(operateFailMsg, '提示');
						}

					},
					error : function(res) {
						commonUtil.showMessages(operateFailMsg, '提示');
					}
				});
			}
		});
	},
	/**
	 * 得到 ftp文件的路径
	 * @param url
	 * @param callback
	 */
	getFileUrl : function(callback){
		var urlstr= commonUtil.getRealpath()+"/fileOperate/getfileurl.do";
		$.ajax({
			url : urlstr,
			type : "POST",
			dataType : "json",
			success : function(data) {
				if (data.success) {
					if(callback!=null){
						callback(data.message);
					}
				} else {
					commonUtil.showMessages("获取失败！", '提示');
				}

			},
			error : function(res) {
				commonUtil.showMessages("获取失败！", '提示');
			}
		});
	},
	/**
	 * ajax 提交
	 * @param url 请求地址
	 * @param errorCallBack 失败返回
	 * @param successCallBack 成功返回
	 */
	ajaxSubmit : function(url,params,errorCallBack,successCallBack){
		$.ajax({
			url : commonUtil.getRealpath()+"/"+url,
			type : "POST",
			dataType : "json",
			data : params,
			success : function(data) {
				if (data.success) {
					if(successCallBack!=null){
						successCallBack(data);
					}
				} else {
					if(errorCallBack!=null){
						errorCallBack(data.message);
					}
				}

			},
			error : function(res) {
				if(errorCallBack!=null){
					errorCallBack("请求失败！",res);
				}
			}
		});
	},
	/**
	 * 提交数组
	 * @param url 提交url
	 * @param pushArrayFuc 
	 * @param successCallBack
	 * @param errorCallBack
	 */
	submitArray : function(urlPath,arrayparams,successCallBack,errorCallBack){
		$.ajax({
			url : commonUtil.getRealpath()
					+ urlPath,
			type : "POST",
			contentType : 'application/json;charset=utf-8', // 设置请求头信息
			dataType : "json",
			data : JSON.stringify(arrayparams), // 将Json对象序列化成Json字符串，JSON.stringify()原生态方法
			success : function(data) {
				if (data.success) {
					if(successCallBack!=null){
                    	successCallBack(data);
                    }
				} else {
					if(errorCallBack!=null){
						errorCallBack(data);
                    }
				}

			},
			error : function(res) {
				if(errorCallBack!=null){
					errorCallBack(res);
                }
			}
		});
	},
	/**
	 * 字符串截取
	 * @param value
	 * @param row
	 * @param index
	 * @returns {String}
	 */
	subString : function(value,row,index){
		if(value.length<20){
			return value;
		}
		if(value!=null&&value!=''){
			value = value.substring(0,20)+".....";
		}
		return value;
	},
	/**
	 * 是否删除
	 * @param value
	 * @param row
	 * @param index
	 * @returns {String}
	 */
	isDelete : function(value,row,index){
		switch (value) {
		case "Y":
			return "";
			break;

		default:
			return "已删除";
			break;
		}
	},
	/**操作成功操作
	 * @param parentid
	 * @returns {boolean}
     */
	successoperate : function(parentid) {
		if (parentid != null) {
			commonUtil.getParentWindows().commonUtil.reloadtable(parentid);
		}
		commonUtil.closedialog();
		return true;

	},
	/**
	 * 是否删除
	 * @param value
	 * @param row
	 * @param index
	 * @returns {String}
	 */
	fileType : function(value,row,index){
		switch (value) {
		case "1":
			return "视频";
			break;

		default:
			return "图片";
			break;
		}
	},
	/**
	 * ajax 提交
	 * @param url 请求地址
	 * @param errorCallBack 失败返回
	 * @param successCallBack 成功返回
	 */
	ajax : function(url,params,errorCallBack,successCallBack){
		$.ajax({
			url : commonUtil.getRealpath()+"/"+url,
			type : "POST",
			dataType : "json",
			data : params,
			success : function(data) {
				if(successCallBack!=null){
					successCallBack(data);
				}
			},
			error : function(res) {
				if(errorCallBack!=null){
					errorCallBack(res);
				}
			}
		});
	},
	/**
	 * 获取下拉列表值 为了过滤用户点击ie上的“x”号出现的bug
	 * @param inputId
	 * @returns
	 */
	comboboxGetValue :function(inputId){
		var text = $("#"+inputId).combobox('getText');
		if(text==null||text==""){
			return "";
		}else{
			return $("#"+inputId).combobox('getValue');
		}
	},
	/**
	 * 解析xml
	 * @param xmlString
	 * @returns
	 */
	loadXML : function(xmlString){
        var xmlDoc=null;
        //判断浏览器的类型
        //支持IE浏览器 
        if(!window.DOMParser && window.ActiveXObject){   //window.DOMParser 判断是否是非ie浏览器
            var xmlDomVersions = ['MSXML.2.DOMDocument.6.0','MSXML.2.DOMDocument.3.0','Microsoft.XMLDOM'];
            for(var i=0;i<xmlDomVersions.length;i++){
                try{
                    xmlDoc = new ActiveXObject(xmlDomVersions[i]);
                    xmlDoc.async = false;
                    xmlDoc.loadXML(xmlString); //loadXML方法载入xml字符串
                    break;
                }catch(e){
                }
            }
        }
        //支持Mozilla浏览器
        else if(window.DOMParser && document.implementation && document.implementation.createDocument){
            try{
                /* DOMParser 对象解析 XML 文本并返回一个 XML Document 对象。
                 * 要使用 DOMParser，使用不带参数的构造函数来实例化它，然后调用其 parseFromString() 方法
                 * parseFromString(text, contentType) 参数text:要解析的 XML 标记 参数contentType文本的内容类型
                 * 可能是 "text/xml" 、"application/xml" 或 "application/xhtml+xml" 中的一个。注意，不支持 "text/html"。
                 */
                domParser = new  DOMParser();
                xmlDoc = domParser.parseFromString(xmlString, 'text/xml');
            }catch(e){
            }
        }
        else{
            return null;
        }

        return xmlDoc;
    },
	   /**
     * 定时刷新 摄像头状态
     * @param treeIds 显示树的id
     */
    reloadCamare : function(treeIds){
    	if(treeIds.length==null||treeIds.length<1){
    		return;
    	}
    	window.setInterval(function(){
    		$.ajax({
    			url : commonUtil.getRealpath()+"/equipment/camare/getOfflineCamare.do",
    			type : "POST",
    			dataType : "json",
    			success : function(res) {
    				if(res==null||res.length==0){
        				return;
        			}
        			var datas= res;
        			for (var i = 0; i < treeIds.length; i++) {
        				var zTree = $.fn.zTree.getZTreeObj(treeIds[i]);
        				//如果树不为空
            			if(null!=zTree){
            				//获取摄像头节点
            				var deptnodes = zTree.getNodesByFilter(function(node){
            					return node.data.equipmenttype=='equipmentCamare';
            				});
            				for (var i in deptnodes) {
            					if(deptnodes[i].data.equipmenttype=='equipmentCamare'){
//            						var iconSkin = deptnodes[i].iconSkin;
            						delete deptnodes[i]["isOffline"];
            						if(datas[deptnodes[i].id]!=null){//修改为离线状态
                						deptnodes[i].iconSkin="equipmentCamare"+deptnodes[i].data.camaretype+"C";
                						deptnodes[i]["isOffline"]='Y';
                					}else{
                						if(deptnodes[i].isopen!=null){//修改为在线状态
                							deptnodes[i].iconSkin="equipmentCamare"+deptnodes[i].data.camaretype+"O";
//                							deptnodes[i]["prestatus"]=iconSkin;
                						}else{
                							deptnodes[i].iconSkin="equipmentCamare"+deptnodes[i].data.camaretype;
//                							deptnodes[i]["prestatus"]=iconSkin;
                						}
                						
//                						
                					}
            						zTree.updateNode(deptnodes[i]);
            					}
            				}
            			
            			}
        			}
    			},
    			error : function(res) {
    				
    			}
    		});
    	}, 10000);
    },
    /**
     * 改变摄像头图标
     * @param treeIds
	 * @param camareid 摄像头id
     */
    changeCamare : function(treeIds,camareid){
    	if(treeIds.length==null||treeIds.length<1){
    		return;
    	}
    	for ( var i in treeIds) {
			var zTree = $.fn.zTree.getZTreeObj(treeIds[i]);
			if(null!=zTree){
//				var deptnodes = zTree.getNodes();
				var deptnodes = zTree.getNodesByFilter(function(node){
					return node.data.equipmenttype=='equipmentCamare';
				});
				for (var i in deptnodes) {
					if(deptnodes[i].data.equipmenttype=='equipmentCamare'){
						if(camareid[deptnodes[i].id]!=null){
							if(camareid[deptnodes[i].id]==''){
								delete deptnodes[i]["isopen"];
								if(deptnodes[i].isOffline!=null){
//									var iconSkin = deptnodes[i].iconSkin;
									deptnodes[i].iconSkin="equipmentCamare"+deptnodes[i].data.camaretype+"C";
//									deptnodes[i]["prestatus"]=iconSkin;
									zTree.updateNode(deptnodes[i]);
								}else{
//									var iconSkin = deptnodes[i].iconSkin;
									deptnodes[i].iconSkin="equipmentCamare"+deptnodes[i].data.camaretype;
//									deptnodes[i]["prestatus"]=iconSkin;
									zTree.updateNode(deptnodes[i]);
								}
//								break;
							}else{
								var iconSkin = deptnodes[i].iconSkin;
								var isOffline="equipmentCamare"+deptnodes[i].data.camaretype+"C";
								if(iconSkin==isOffline){
									deptnodes[i]["isOffline"]='Y';
								}
								deptnodes[i].iconSkin="equipmentCamare"+deptnodes[i].data.camaretype+camareid[deptnodes[i].id];
//								deptnodes[i]["prestatus"]=iconSkin;
								deptnodes[i]["isopen"]='Y';
								zTree.updateNode(deptnodes[i]);
//								break;
							}
							
						}
					}
				}
				
			}
		}
    },
    /**
     * 添加数的根节点
     * @param data
     * @param rootName
     */
    addTreeRoot: function (data, rootName,parentcode) {
        if (data != null) {
            data.push({
                "id": (parentcode!=null&&parentcode!='')?parentcode:"0",
                "pId": "0",
                "name": rootName,
                "open": true,
                data: null,
                nocheck: true
            });
        }
    }
};

/**
 * 选择存放文件路径（ie）
 * @param path
 * @returns {String}
 */
function browseFolder(path) {
    try {
        var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
        var Shell = new ActiveXObject("Shell.Application");
        var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
        //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
        if (Folder != null) {
            Folder = Folder.items(); // 返回 FolderItems 对象
            Folder = Folder.item(); // 返回 Folderitem 对象
            Folder = Folder.Path; // 返回路径
            if (Folder.charAt(Folder.length - 1) != "\\") {
                Folder = Folder + "\\";
            }
            if(path!=null&&path!=''){
            	 document.getElementById(path).value = Folder;
            }
            return Folder;
        }
    }
    catch (e) {
        alert(e.message);
    }
}

//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外
function banBackSpace(e){ 
	  var ev = e || window.event;//获取event对象 
	  var obj = ev.target || ev.srcElement;//获取事件源 
	  var t = obj.type || obj.getAttribute('type');//获取事件源类型 
	  //获取作为判断条件的事件类型
	  var vReadOnly = obj.getAttribute('readonly');
	  //处理null值情况
	  vReadOnly = (vReadOnly == "") ? false : vReadOnly;
	  //当敲Backspace键时，事件源类型为密码或单行、多行文本的，
	  //并且readonly属性为true或enabled属性为false的，则退格键失效
	  var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea") 
	     && vReadOnly=="readonly")?true:false;
	  //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
	  var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")
	     ?true:false;  
	   
	  //判断
	  if(flag2){
	   return false;
	  }
	  if(flag1){ 
	   return false; 
	  } 
}

$(function(){
	 //禁止后退键 作用于Firefox、Opera
	 document.onkeypress=banBackSpace;
	 //禁止后退键 作用于IE、Chrome
	 document.onkeydown=banBackSpace;
});