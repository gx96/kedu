package com.gaoxuan.kedu.controller;

import com.gaoxuan.kedu.pojo.Category;
import com.gaoxuan.kedu.service.CategoryService;
import com.gaoxuan.kedu.service.ProductService;
import com.gaoxuan.kedu.util.ImageUtil;
import com.gaoxuan.kedu.util.Page;
import com.gaoxuan.kedu.util.UploadedImageFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller//注解@Controller声明当前类是一个控制器
@RequestMapping("")//注解@RequestMapping("")表示访问的时候无需额外的地址
public class CategoryController {
    @Autowired//@Autowired把CategoryServiceImpl自动装配进了CategoryService接口
            CategoryService categoryService;
    @Autowired
    ProductService productService;

    @RequestMapping("admin_category_list")//注解RequestMapping("admin_category_list")映射admin_category_list路径的访问
    public String list(Model model, Page page, String name) {//Page用于获取浏览器传递过来的分页信息
        PageHelper.offsetPage(page.getStart(), page.getCount());//1. 通过分页插件指定分页参数
        List<Category> cs = categoryService.list();//获取所有的Category对象，然后放在“cs”集合中.2. 调用list() 获取对应分页的数据
        int total = (int) new PageInfo<>(cs).getTotal();//3. 通过PageInfo获取总数
        page.setTotal(total);
        model.addAttribute("cs", cs);//把cs集合对象添加到model中，model就是封装的request请求
        model.addAttribute("page", page);
        return "admin/listCategory";//服务端转跳到“admin/listCategory"视图
    }

    //1. add方法映射路径admin_category_add的访问
//1.1 参数 Category c接受页面提交的分类名称
//1.2 参数 session 用于在后续获取当前应用的路径
//1.3 UploadedImageFile 用于接受上传的图片
//2. 通过categoryService保存c对象
//3. 通过session获取ControllerContext,再通过getRealPath定位存放分类图片的路径。
//4. 根据分类id创建文件名
//5. 如果/img/category目录不存在，则创建该目录，否则后续保存浏览器传过来图片，会提示无法保存
//6. 通过UploadedImageFile 把浏览器传递过来的图片保存在上述指定的位置
//7. 通过ImageUtil.change2jpg(file); 确保图片格式一定是jpg，而不仅仅是后缀名是jpg.
//8. 客户端跳转到admin_category_list
    @RequestMapping("admin_category_add")
    public String add(Category c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        categoryService.add(c);
        File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imageFolder, c.getId() + ".jpg");
        if (!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);

        return "redirect:/admin_category_list";
    }

    @RequestMapping("admin_category_delete")
    public String delete(int id, HttpSession session) throws IOException {
        if (productService.list(id).isEmpty()) {
            categoryService.delete(id);
            File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder, id + ".jpg");
            file.delete();
            return "redirect:/admin_category_list";
        }
//        session.setAttribute("error","删除失败");
        String error="x";
        return "redirect:/admin_category_list?error="+error;
    }

    @RequestMapping("admin_category_edit")
    public String edit(int id, Model model) throws IOException {
        Category c = categoryService.get(id);
        model.addAttribute("c", c);
        return "admin/editCategory";
    }

    @RequestMapping("admin_category_update")
    public String update(Category c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        categoryService.update(c);
        MultipartFile image = uploadedImageFile.getImage();
        if (null != image && !image.isEmpty()) {
            File imageFolder = new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder, c.getId() + ".jpg");
            image.transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }
        return "redirect:/admin_category_list";
    }
}