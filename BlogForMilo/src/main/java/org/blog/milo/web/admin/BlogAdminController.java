package org.blog.milo.web.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.blog.milo.entity.Blog;
import org.blog.milo.entity.PageBean;
import org.blog.milo.lucene.BlogIndex;
import org.blog.milo.service.BlogService;
import org.blog.milo.utils.DataTableBean;
import org.blog.milo.utils.ResponseUtil;
import org.blog.milo.utils.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;


/**
 * ����Ա����Controller��
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/blog")
public class BlogAdminController {

	@Resource
	private BlogService blogService;
	
	// ��������
	private BlogIndex blogIndex=new BlogIndex();
	
	/**
	 * ��ӻ����޸Ĳ�����Ϣ
	 * @param blog
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(Blog blog,HttpServletResponse response)throws Exception{
		int resultTotal=0; // �����ļ�¼����
		if(blog.getId()==null){
			resultTotal=blogService.add(blog);
			blogIndex.addIndex(blog); // ��Ӳ�������
		}else{
			resultTotal=blogService.update(blog);
			blogIndex.updateIndex(blog); // ���²�������
		}
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	
	@RequestMapping("/listPage")
	public ModelAndView listPage() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("mainPage", "/admin/article/article_page_list.jsp");
		mav.setViewName("common/mainTemp");
		return mav;
	}
	
	/**
	 * ��ҳ��ѯ������Ϣ
	 * @param page
	 * @param rows
	 * @param s_customer
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(DataTableBean dataTableBean ,Blog s_blog,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.valueOf(dataTableBean.getStart()),Integer.valueOf(dataTableBean.getLength()));//Integer.parseInt(page),Integer.parseInt(rows)
		System.out.println(Integer.valueOf(dataTableBean.getStart())+"-------------------------"+Integer.valueOf(dataTableBean.getLength()));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("title", StringUtil.formatLike(s_blog.getTitle()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Blog> blogList=blogService.list(map);
		Long total=blogService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(blogList,jsonConfig);
		
		result.put("draw", Integer.valueOf(dataTableBean.getDraw()));
		result.put("recordsTotal", total);
		result.put("recordsFiltered", total);
		result.put("data", jsonArray);

		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * ɾ��������Ϣ
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		JSONObject result=new JSONObject();
		try {
			for(int i=0;i<idsStr.length;i++){
				blogService.delete(Integer.parseInt(idsStr[i]));
				blogIndex.deleteIndex(idsStr[i]); // ɾ����Ӧ���͵�����
			}
			result.put("success", true);
		} catch (Exception e) {
			result.put("fail", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * ͨ��ID����ʵ��
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
		Blog blog=blogService.findById(Integer.parseInt(id));
		JSONObject jsonObject=JSONObject.fromObject(blog);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	
	
}
