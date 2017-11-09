<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div
	class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main"
	id="main">
	<div class="row">
		<div class="col-md-9">
			<h1 class="page-header">撰写新文章</h1>
			<div class="form-group">
				<label for="article-title" class="sr-only">标题</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${bean.title }" placeholder="在此处输入标题" required autofocus
					autocomplete="off">
			</div>
			<div class="form-group" style="width: 100%">
				<label for="article-content" class="sr-only">内容</label>
				<script id="article-content" name="content" type="text/plain"></script>
			</div>
			<div class="add-article-box">
				<h2 class="add-article-box-title">
					<span>描述</span>
				</h2>
				<div class="add-article-box-content">
					<textarea class="form-control" name="describe" autocomplete="off"
						id="summary">${bean.summary }</textarea>
					<span class="prompt-text">描述是可选的手工创建的内容总结，并可以在网页描述中使用</span>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<h1 class="page-header">操作</h1>
			<div class="add-article-box">
				<h2 class="add-article-box-title">
					<span>栏目</span>
				</h2>
				<div class="add-article-box-content">
					<select id="blogTypeId" name="blogType.id" class="form-control">
						<option value="">请选择</option>
						<c:forEach var="blogType" items="${blogTypeCountList }"
							varStatus="i">
							<option value="${blogType.id}"
								${blogType.id==bean.blogType.id?'selected':''}>${blogType.typeName }</option>
						</c:forEach>

					</select>
				</div>
			</div>
			<div class="add-article-box">
				<h2 class="add-article-box-title">
					<span>关键字</span>
				</h2>
				<div class="add-article-box-content">
					<input type="text" class="form-control" placeholder="输入新标签"
						name="tags" value="${bean.keyWord }" autocomplete="off"
						id="keyWord"> <span class="prompt-text">多个标签请用英文逗号,隔开</span>
				</div>
			</div>
			<div class="add-article-box">
				<h2 class="add-article-box-title">
					<span>标题图片</span>
				</h2>
				<div class="add-article-box-content">
					<input type="text" class="form-control" placeholder="点击按钮选择图片"
						id="pictureUpload" name="titlepic" autocomplete="off">
				</div>
				<div class="add-article-box-footer">
					<button class="btn btn-default" type="button" ID="upImage">选择</button>
				</div>
			</div>
			<div class="add-article-box">
				<h2 class="add-article-box-title">
					<span>发布</span>
				</h2>
				<div class="add-article-box-content">
					<p>
						<label>状态：</label><span class="article-status-display">未发布</span>
					</p>
					<p>
						<label>公开度：</label><input type="radio" name="visibility" value="0"
							checked />公开 <input type="radio" name="visibility" value="1" />加密
					</p>
					<p>
						<label>发布于：</label><span class="article-time-display"><input
							style="border: none;" type="datetime" name="time"
							value="2016-01-09 17:29:37" /></span>
					</p>
				</div>
				<div class="add-article-box-footer">
					<button class="btn btn-primary" onclick="javascript:submitData()"
						type="submit" name="submit">发布</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var _uploadEditor;
	$(document).ready(function() {
		uploadEd(_uploadEditor);
	});
	UE.delEditor("article-content");
	var editor = UE.getEditor("article-content");
	//监听editor是否已经加载完成，如果加载完成回掉函数
	editor.addListener("ready", function() {
		editor.setContent('${bean.content}');
	});
	$('#upImage').click(function() {
		var myImage = _uploadEditor.getDialog("insertimage");
		myImage.open();
	});
	//弹出文件上传的对话框
	function upFiles() {
		var myFiles = _uploadEditor.getDialog("attachment");
		myFiles.open();
	}

	function submitData() {
		var title = $("#title").val();
		var blogTypeId = $("#blogTypeId").val();

		var content = UE.getEditor('article-content').getContent();
		var summary = $("#summary").val();
		var keyWord = $("#keyWord").val();

		if (title == null || title == '') {
			alert("请输入标题！");
		} else if (blogTypeId == null || blogTypeId == '') {
			alert("请选择博客类别！");
		} else if (content == null || content == '') {
			alert("请输入内容！");
		} else {
			doSave(title,blogTypeId,content,summary,keyWord);
		}
	}

	// 重置数据
	function resetValue() {
		$("#title").val("");
		$("#blogTypeId").find("option").eq(0).attr("selected", "selected")
		UE.getEditor('article-content').setContent(" ");
		$("#summary").val("");
		$("#keyWord").val("");
	}

	//实例化编辑器显示上传的图片
	function uploadEd(_uploadEditor) {
		//重新实例化一个编辑器，防止在上面的editor编辑器中显示上传的图片或者文件
		_uploadEditor = UE.getEditor('uploadEditor');
		_uploadEditor.ready(function() {
			//设置编辑器不可用
			//_uploadEditor.setDisabled();
			//隐藏编辑器，因为不会用到这个编辑器实例，所以要隐藏
			_uploadEditor.hide();
			//侦听图片上传
			_uploadEditor.addListener('beforeInsertImage', function(t, arg) {
				//将地址赋值给相应的input,只去第一张图片的路径
				$("#pictureUpload").attr("value", arg[0].src);
				//图片预览
				$("#imgPreview").attr("src", arg[0].src);
			})
			//侦听文件上传，取上传文件列表中第一个上传的文件的路径
			_uploadEditor.addListener('afterUpfile', function(t, arg) {
				$("#fileUpload").attr("value",
						_uploadEditor.options.filePath + arg[0].url);
			})
		});
	}

	function doSave(title,blogTypeId,content,summary,keyWord) {
		bootbox.confirm({
					message : "是否保存?",
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
					if(result){
						$.post("${pageContext.request.contextPath}/admin/blog/save.do",
								{
									'title' : title,
									'blogType.id' : blogTypeId,
									'content' : content,
									'contentNoTag' : UE.getEditor('article-content').getContentTxt(),
									'summary' : summary,
									'keyWord' : keyWord
								},
								function(result) {
									if (result.success) {
										bootbox.alert("保存成功!",function() {
										doSave();
										});
									} else {
										bootbox.alert("博客发布失败！");
									}
								}, "json");

					}
					}
				});
	}
</script>
</body>
</html>
