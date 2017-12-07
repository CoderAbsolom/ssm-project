var util = {
    name :null,
	checkNull : function(str) {
		if(str == undefined || str == null||str==''||str=='null'){
			str = "";
		}
		return str;
	},
	/**
	 * 获取项目路径
	 * @param name  路径?后面的名称
	 * @returns
	 */
	getQueryString : function(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) return unescape(r[2]); return null;
	},
	/**
	 * 性别
	 */
	sexFormatter : function(value,row,index){
		switch (value) {
		case "1":
			return "男";
			break;

		default:
			return "女";
			break;
		}
	},
	formatter : function(value,row,index){
		switch (value) {
		case "1":
			return "视频";
			break;

		default:
			return "图片";
			break;
		}
	},
	showMessage : function(msg,id,time){
		if(time == null || time == '' || time == undefined){
			time = 1300;
		}
		$.messager.show({
	   		 title : '温馨提示',
			 msg : msg,
			 timeout:time,
	   		 style:{
	   			 right:'',
	   			 top:document.body.scrollTop+document.documentElement.scrollTop,
	   			 bottom:''
	   		 }
		});
		if(util.checkIsNull(id)){
			$(id).focus();
			$(id).val('');
		}
	},
	/**
	 * 
	 * @param title  标题
	 * @param method 方法
	 * @returns {String}
	 */
	returnStrByA:function(title,method,icon){
		return '<a href="javascript:void(0)" class="a-icon-cls a-icon-'+icon+'" onclick='+method+'>'+title+'</a>';
	},
	checkIsNull : function(str){
		if(str!='' && str!=null && str!=undefined){
			return true;
		}else{
			return false;
		}
	},
	/**
	 * 常量定义
	 */
	constant :{
		usericon : 'usericon',//用户照片
		mapimage : 'mapimage',//用户照片
		news : 'newsImage',//新闻的存放文件夹名
		knowledge : 'knowledgeImage',//知识库的存放文件夹名
		noticeTemplate : 'noticeTemplate',//模板公共
		notice : 'notice',//模板公共
		noticeImage : 'noticeImage',//公告内容图片
		apk : 'apk',//apk所在目录
		orginfo : 'orginfoImgage',//机构目录
		knowledge : 'knowledgeFile',//模板公共
		train : 'trainFile',//模板公共
		video : 'preinspectionVideo',//视频目录
	}
	

};
