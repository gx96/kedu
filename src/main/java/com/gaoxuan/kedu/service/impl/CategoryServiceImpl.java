package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.CategoryMapper;
import com.gaoxuan.kedu.pojo.Category;
import com.gaoxuan.kedu.pojo.CategoryExample;
import com.gaoxuan.kedu.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

//import com.gaoxuan.kedu.util.Page;
@Service//使用注解@Service声明当前类是一个Service类
public class CategoryServiceImpl  implements CategoryService {
    @Autowired(required=true)//通过自动装配@Autowired引入CategoryMapper
    CategoryMapper categoryMapper;
	//insert(category)，将一条category信息添加到数据库
	@Override
	public void add(Category category) {
		categoryMapper.insert(category);
		
	}

	//deleteByPrimaryKey（id），根据主键id删除一条记录
	@Override
	public void delete(int id) {
		categoryMapper.deleteByPrimaryKey(id);
	}



	//updateByPrimaryKeySelective（category），更新数据库中的一条记录
	@Override
	public void update(Category category) {
		categoryMapper.updateByPrimaryKeySelective(category);
		
	}

	//selectByPrimaryKey（id)，根据主键id查询一条记录
	@Override
	public Category get(int id) {
		return categoryMapper.selectByPrimaryKey(id);
	}
	//selectByExamle(example)，查询所有并且按指定顺序排序
	@Override
	public List<Category> list() {
		CategoryExample example =new CategoryExample();
		example.setOrderByClause("id asc");//设置数据库结果排序
		return categoryMapper.selectByExample(example);
	}

}