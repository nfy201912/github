package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.java.po.Category;
import com.java.po.Goods;
import com.java.service.GoodsService;
@Controller
@RequestMapping("/goods")
@SessionAttributes(value={})
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	// 上传文件存储目录                                  //改动一
	private static final String UPLOAD_DIRECTORY = "WebContent" + File.separator +"img"+File.separator+"image";
	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB //缓存大小     // 超过3MB则写入缓存
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB //上传的文件大
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
																		// //传输数据的最大范围
	@RequestMapping("/findAll")
	@ResponseBody
	public Object findAll() throws Exception{
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		List<Goods> goods = goodsService.findAll();
		for(Goods g: goods){
			System.out.println(g);
		}
		jsonMap.put("rows",goods);
		jsonMap.put("total",goods.size());
		return jsonMap;
	}
	@RequestMapping("/add")
	@ResponseBody
	public String add(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
		Goods product = new Goods();
		// 检测是否为多媒体上传
				if (!ServletFileUpload.isMultipartContent(request)) {
					// 如果不是则停止
					PrintWriter writer = response.getWriter();
					writer.println("Error: 表单必须包含 enctype=multipart/form-data");
					writer.flush();
					return "";
				}

				// 配置上传参数
				DiskFileItemFactory factory = new DiskFileItemFactory();
				// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
				factory.setSizeThreshold(MEMORY_THRESHOLD);
				
				//临时文件存入的位置
				/*String property = System.getProperty("java.io.tmpdir");
				System.out.println(property);*/
				
				// 设置临时存储目录
				factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

				//上传文件对象的servlet
				ServletFileUpload upload = new ServletFileUpload(factory);

				// 设置最大文件上传值
				upload.setFileSizeMax(MAX_FILE_SIZE);

				// 设置最大请求值 (包含文件和表单数据)
				upload.setSizeMax(MAX_REQUEST_SIZE);

				// 中文处理
				upload.setHeaderEncoding("UTF-8");

				// 构造临时路径来存储上传的文件
				// 这个路径相对当前应用的目录
				//String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
				//改动二
				String uploadPath = "D:\\Users\\Administrator"+File.separator+"workspace"+File.separator+"bsxy"+File.separator+"shopping" +File.separator + UPLOAD_DIRECTORY;
						
				// 如果目录不存在则创建
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					//uploadDir.mkdir();  //创建单个目录        a
					uploadDir.mkdirs();   //多级目录               a/b/c
				}

				try {
					// 解析请求的内容提取文件数据
					List<FileItem> formItems = upload.parseRequest((RequestContext) request);
					
					//判断表单是否有 数据
					if (formItems != null && formItems.size() > 0) {
						// 迭代表单数据
						for (FileItem item : formItems) {
							// 处理不在表单中的字段  (如果是字段返回的结为true)
							if (!item.isFormField()) {   //取反        ，判断字段是不是图片，如果是图片返回false再取反，结果为true
								//如果是图片则在这块处理
								//获取图片名称
								//String fileName = new File(item.getName()).getName();
								
								//保存图片的路径与名称   new Date().getTime()  获取从1970-1-1 - 今的毫秒值
								//改动三
								long time = new Date().getTime();
								 //改动四
								String fileName =  time + item.getName().toString();   //15600001abc.jpg
								
								//存数据库  //改动五
								product.setG_imgUrl("image/" + fileName);   //1000001a  1000002a
								
								//把图片名称与路径组合                      File.separator：   windos:\      linux:/
								String filePath = uploadPath + File.separator + fileName;   //a
								//把路径转换成一个File对象
								File storeFile = new File(filePath);
								// 在控制台输出文件的上传路径
								System.out.println(filePath);
								// 保存文件到硬盘
								item.write(storeFile);
								request.setAttribute("message", "文件上传成功!");
							}else{  //改动六
								//否则则处理字段
								
								String key = item.getFieldName();  //获取项的名称      pname
								String value = item.getString("utf-8");  //获取项中的值  华为P30
								
								if("pname".equals(key)){
									product.setG_name(value);
								}
								
								if("cid".equals(key)){
									product.setG_id(Integer.parseInt(value));
								}
								
								if("price".equals(key)){
									product.setG_price(Double.parseDouble(value));
								}
								
								
								
							}
						}
					}
				} catch (Exception ex) {
					request.setAttribute("message", "错误信息: " + ex.getMessage());
				}
				
				//调用业务层中的方法          六
				try {
					//productsService.addProducts(product);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return null;
	}
	
}
