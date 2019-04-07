package com.gaoxuan.kedu.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
 
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
 
import com.gaoxuan.kedu.pojo.Category;
    
public class TestMybatis {
    
    public static void main(String[] args) throws IOException {
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();
        List<Category> cs = session.selectList("listCategory");
        for (Category c : cs) {
            session.delete("deleteCategory", c);
        }
        for (int i = 0; i < 100; i++) {
            Category c = new Category();
            c.setName("category name " + i);
            session.insert("addCategory", c);
        }
        List<Category> cs2 = session.selectList("listCategory");
        for (Category c : cs2) {
            System.out.println(c.getName());
        }
 
        session.commit();
        session.close();
 
    }
}