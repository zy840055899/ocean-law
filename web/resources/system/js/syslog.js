$(function(){
	$('#dg').datagrid({
	    url:$webURI+"/system/sysuser/sysUserLog.action",    
	    width:'99%',
	    pagination:true,
	    rownumbers:true,
	    singleSelect:true,
	    pageSize: 15,
	    pageList:[5,10,15,30],
	    columns:[[    
	        {field:'uno',title:'编号',width:'25%'},    
	        {field:'nicname',title:'登陆用户',width:'25%'},    
	        {field:'ip',title:'登陆ip',width:'25%'},    
	        {field:'btime',title:'登陆时间',width:'25%',formatter: function(value,row,index){return value.substr(0,19);}}    
	    ]]    
	});
	
	log = {
		search:function(){
			var tempin={
					uno:$("#seauno").val(),
					nicname:$("#seaname").val(),
					btime:$("#btime").val(),
					etime:$("#etime").val()
			};
			$('#dg').datagrid({
				queryParams: tempin
			});
		}
	};
});