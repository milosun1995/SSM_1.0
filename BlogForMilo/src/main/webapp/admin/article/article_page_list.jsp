<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/include/page_delete.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="/admin/blog/delete.do" method="post" >
        <h1 class="page-header">操作</h1>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/admin/blog/newPage.html">增加文章</a></li>
        </ol>
        <h1 class="page-header">管理 </h1>
        <div class="table-responsive">
          <table width="100%"  class="table table-striped table-bordered table-hover" id="ht-dataTables">
            <thead>
              <tr>
               <!-- width="20px" --> <th style="text-align: center;" ><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
               <!-- width="20px" --> <th style="text-align: center;" ><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">编号</span></th>
               <!-- width="200px" --><th style="text-align: center;" ><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">标题</span></th>
               <!-- width="50px" --> <th style="text-align: center;" ><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">发布日期</span></th>
               <!-- width="50px" --> <th style="text-align: center;" ><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">博客类别</span></th>
               <!-- width="50px" --> <th style="text-align: center;" ><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
              
            </tbody> 
          </table>
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> <a class="btn btn-default" onClick="noselect()">不选</a> </div>
              <div class="btn-group" role="group">
                <button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete" onclick='doDelete("","${pageContext.request.contextPath}/admin/blog/delete.do")'>删除</button>
              </div>
            </div>
          </nav>
        </footer>
      </form>
    </div>
    <script>
    $(document).ready(function() {
    	$('#ht-dataTables').DataTable({
			<%@ include file="/admin/include/dt.jsp"%>
			"ajax":{
				url: "${pageContext.request.contextPath}/admin/blog/list.html",
				type: "POST"
			},
			 fnDrawCallback: function(settings){
	            	$('#select-all').prop('checked', false);    
					$('.dataTables_empty').prop('colspan', '7');                	
	            },		
	        columns: [
	        	{ "data": null,
	            	render: function(data,type,row,meta){
	            		/* console.log(data); */
	           		    var str="<div class=\"checkbox checkbox-info\"><input class=\"styled\" type=\"checkbox\" name='selected'  value='" + row.id + "'><label for=\"checkbox\"></label></div>";
	            		return str;
	            	}
	            },
	        	{ "data": "id"},
	        	{ "data": "title"},
	        	{ "data": "releaseDate"},
	        	{ "data": "blogType.typeName"},
	        	{ "data": null,
	            	render: function(data,type,row,meta){
	            		var str = "<div style='text-align:center;'>"+
					            		"<button type='button' id='btn-update' class='btn btn-normal btn-xs' onclick='doUpdate(" +  '"' + row.id + '","${pageContext.request.contextPath}/admin/blog/updatePage.html"'	 + ")'>" +  
											"修改" + 
										"</button>"+ 
										"&nbsp;" + 
										"<button type='button' id='btn-delete' class='btn btn-danger btn-xs' onclick='doDelete(" +  '"' + row.id + '","${pageContext.request.contextPath}/admin/blog/delete.html"'	 + ")'>" +  
											"删除" + 
										"</button>"+
									"</div>";
	           		    return str;
	            	}
	            }
	            ],
	            columnDefs: [ 
		        	{ "defaultContent": "-", "targets": "_all" } 
		        ]
    	 });
    });
    function doUpdate (id,url){
    	location.href=url+"?id="+id;
    }

    </script>