<%@ page contentType="text/html; charset=UTF-8"%>
<script>
	// delete the main record, not real delete, write a record to trans and wait for confirm
	function doDelete(id, url) {
		if(id!=""){
			bootbox.confirm({
				message : "确认删除？",
	            title: '提醒',  
				buttons : {
					confirm : {
						label : 'Yes',
						className : 'btn-success'
					},
					cancel : {
						label : 'No',
						className : 'btn-danger'
					}
				},
				callback : function(result) {
					if (result) {
							$.ajax({
								url : url,
								data : {
									ids : id
								},
								success : function(data) {
									var dataObj=eval("("+data+")");//转换为json对象 
									console.log(dataObj.success);
									if (dataObj.success){
										//onRejectOk();
										//当点击ok以后，再次利用ajax打回来，可以实现页面不回缩--<拒绝成功>  
										$.ajax({
										 success : function(data) {
											bootbox.alert({
												message : "删除成功！",
									            title: '提醒',  
												buttons : {
													ok : {
														label : 'Ok',
														className : 'btn-danger'
													}
												},
												callback : function(result) {
													$('#ht-dataTables').DataTable().ajax.reload(null, true); // callback, resetPaging
													$('#select-all').prop('checked',false);
												}
											});
										}
									 })
									}else 
										//onRejectFail();
										//当点击ok以后，再次利用ajax打回来，可以实现页面不回缩--<拒绝失败> 
										$.ajax({
										 success : function(data) {
											bootbox.alert({
												message : "删除失败",
									            title: '提醒',  
												buttons : {
													ok : {
														label : 'Ok',
														className : 'btn-danger'
													}
												},
												callback : function(result) {
													$('#ht-dataTables').DataTable().ajax.reload(null, true); // callback, resetPaging
													$('#select-all').prop('checked',false);
												}
											});
										}
									})
									 
								}
							})
					}
				}
			});
		}
		
		if(id==""){
			var a=$("input[name=selected]:checked");
			if(a.val()==null){
				bootbox.alert({  
		            buttons: {  
		               ok: {
		                    label: 'Ok',  
		                    className: 'btn-danger'  
		                }  
		            },  
		            message: "请至少选择一条数据！",  
		            callback: function() {  },  
		            title: '提醒',  
		        });  			
				return;
			}
			
			bootbox.confirm({
				message : "确认删除？",
	            title: '提醒',  
				buttons : {
					confirm : {
						label : 'Yes',
						className : 'btn-success'
					},
					cancel : {
						label : 'No',
						className : 'btn-danger'
					}
				},
				callback : function(result) {
					if (result) {
						
							//$("#btn-confirm-all").prop('disabled', true);
							var inputs = document.getElementsByName("selected");
							var selectedId = new Array();
							for (var i = 0; i < inputs.length; i++) {
								if (inputs[i].checked){
									selectedId.push(inputs[i].value);
								}
							}
							$.ajax({
								url : url,
								traditional: true,
								data : {
									ids : selectedId
								},
								success : function(data) {
									var dataObj=eval("("+data+")");//转换为json对象 
									console.log(dataObj.success);
									if (dataObj.success){
										//onRejectOk();
										//当点击ok以后，再次利用ajax打回来，可以实现页面不回缩--<勾选-拒绝成功> 
										$.ajax({
										  success : function(data) {
											bootbox.alert({
												message : "删除成功！",
									            title: '提醒',  
												buttons : {
													ok : {
														label : 'Ok',
														className : 'btn-danger'
													}
												},
												callback : function(result) {
													$('#ht-dataTables').DataTable().ajax.reload(null, true); // callback, resetPaging
													$('#select-all').prop('checked',false);
												}
											});
										}
									 })
									}else 
										//onRejectFail();
										//当点击ok以后，再次利用ajax打回来，可以实现页面不回缩--<勾选-拒绝失败> 
										$.ajax({
											success : function(data) {
												bootbox.alert({
													message : "删除失败",
										            title: '提醒',  
													buttons : {
														ok : {
															label : 'Ok',
															className : 'btn-danger'
														}
													},
													callback : function(result) {
														$('#ht-dataTables').DataTable().ajax.reload(null, true); // callback, resetPaging
														$('#select-all').prop('checked',false);
													}
											});
										}
									})
								 
								}
							})
					}
				}
			});
		}
	}

</script>