/* ModelDialog对象 */
//构造函数
var ShowDateHelper = function() {
	this.timerID = null;
	this.timerRunning = false;
	this.lang = 0;//0(中文) | 1(英文)
	//语言包，可自由扩展
	this.language = {
		"weeks":[
			["\u65e5","\u4e00","\u4e8c","\u4e09","\u56db","\u4e94","\u516d"],
			["SUN","MON","TUR","WED","THU","FRI","SAT"]
		],
		"meridiem":[
			["\u4e0a\u5348","\u4e0b\u5348"],
			["AM","PM"]
		]
	};
	this.format = [
		"yyyy\u5e74MM\u6708dd\u6708 \u661f\u671fw P HH:mm:ss",
		"yyyy-MM-dd HH:mm:ss",
		"HH:mm:ss"
	];
}

ShowDateHelper.prototype = {
	/**
	 * 格式化日期
	 * @param d the delimiter
	 * @param p the pattern of your date
	 */
	formatDate:function(date, style) {
		var o = {
			"P{1}":((date.getHours() >= 12) ? (this.language["meridiem"][this.lang][1]) : (this.language["meridiem"][this.lang][0])),
			"M{2}":(date.getMonth() + 1),
			"d{2}":(date.getDate()),
			"H{2}":(date.getHours()),
			"m{2}":(date.getMinutes()),
			"s{2}":(date.getSeconds()),
			"w{1}":(this.language["weeks"][this.lang][date.getDay()])
		};
		if(/(y{4})/.test(style)) {
			style = style.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
		}
		for(var k in o) {
			if(new RegExp("("+ k +")").test(style)) {
				style = style.replace(RegExp.$1,
						RegExp.$1.length == 1 ? o[k] :
							(RegExp.$1.length == 3 ? ("000" + o[k]).substr(("" + o[k]).length) :
									("00" + o[k]).substr(("" + o[k]).length)
							)
						);
			}
		}
		return style;
	},
	curdate:function(style) {
		var today = new Date();
		var msg = this.formatDate(today, style);
		return msg;
	},
	//停止计时
	stopclock:function() {
		if (this.timerRunning) {
			clearTimeout(this.timerID);
		}
		this.timerRunning = false;
	},
	/*
	 * 调用方法：
	 * 生成一个对象，默认已经生成下面对象
	 * var __ShowDate__ = new ShowDateHelper();
	 * 调用方式：__ShowDate__.showtime(args1, args2);
	 * 1、参数args1：目前支持参数：inner对象 或 'inner的ID'
	 * 2、参数args2：可选object对象{}
	 * 目前支持参数：
	 * @param lang Integer 0(中文)|1(英语) 可自由扩充
	 * @param type Integer 0,1,2 预定义显示格式
	 * @param format String "yyyy-MM-dd HH:mm:ss w P"
	 * 格式（注意大小写并且存在多个相同格式时只匹配第一个）：yyyy→年，MM→月，dd→天，HH→24小时制，mm→分钟，ss→秒，w→周几，P→上午/下午
	 */
	showtime:function(datePanelId) {
		var args = arguments[1] || {};
		if(args.lang == null) {args.lang = 0;}
		this.lang = args.lang;
		if(args.type == null) {args.type = 0;}
		if(args.format == null) {args.format = this.format[args.type];}
		var _ShowDateInstance = this;
		if(typeof(datePanelId) == 'object'){
			datePanelId.innerHTML = this.curdate(args.format);
		}
		else if(typeof(datePanelId) == 'string') {
			document.getElementById(datePanelId).innerHTML = this.curdate(args.format);
		}
		//window.status = timeValue;
		this.timerID = setTimeout(function () {
			_ShowDateInstance.showtime(datePanelId, args);
		}, 1000);
		this.timerRunning = true;
	}
}
var __ShowDate__ = new ShowDateHelper();//默认生成一个对象,可供直接使用