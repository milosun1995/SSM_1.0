<%@ page contentType="text/html; charset=UTF-8"%>
				"processing": true,
				"serverSide": true,
				"autoWidth": true,
				dom:	"<'row'<'col-sm-12'l>>" + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-7'p><'col-sm-5'i>>", 
				searching : true,
				responsive : true,
				ordering : false,
				pagingType : "full_numbers",
				createdRow: function( row, data, dataIndex ) {
                    $(row).children('td').attr('style', 'text-align: center;')
                },	
				language : {
							lengthMenu: "_MENU_",
							processing: "处理中 ...",
							search: "<i class='fa fa-search fa-fw'></i>",
							zeroRecords: "查无资料",				
							info : "显示_START_到_END_ 共:_TOTAL_",
							sInfoFiltered : " - 从 _MAX_ 笔资料中过滤 ",
							infoEmpty: " ",
							zeroRecords: "<div class='alert alert-danger' role='alert' style='text-align:center;'>查无资料</div>",				
							paginate : {first : '<<', previous : '<', next : '>', last : '>>'}
				},
