package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.ProductMapper;
import com.gaoxuan.kedu.pojo.Category;
import com.gaoxuan.kedu.pojo.Product;
import com.gaoxuan.kedu.pojo.ProductExample;
import com.gaoxuan.kedu.pojo.ProductImage;
import com.gaoxuan.kedu.service.CategoryService;
import com.gaoxuan.kedu.service.OrderItemService;
import com.gaoxuan.kedu.service.ProductImageService;
import com.gaoxuan.kedu.service.ProductService;
import com.gaoxuan.kedu.service.ReviewService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductImageService productImageService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ReviewService reviewService;
    @Override
    public void add(Product p) {
        productMapper.insert(p);
    }
 
    @Override
    public void delete(int id) {
        productMapper.deleteByPrimaryKey(id);
    }
 
    @Override
    public void update(Product p) {
        productMapper.updateByPrimaryKeySelective(p);
    }
 
    @Override
    public Product get(int id) {
        Product p = productMapper.selectByPrimaryKey(id);
        setFirstProductImage(p);
        setCategory(p);
        return p;
    }
 
    public void setCategory(List<Product> ps){
        for (Product p : ps)

            setCategory(p);
    }
    public void setCategory(Product p){
        int cid = p.getCid();
        Category c = categoryService.get(cid);
        p.setCategory(c);
    }
 
    @Override
    public List list(int cid) {
        ProductExample example = new ProductExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id asc");
        List result = productMapper.selectByExample(example);
        setCategory(result);
        setFirstProductImage(result);
        return result;
    }
    @Override
    public void setFirstProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
        if (!pis.isEmpty()) {
            ProductImage pi = pis.get(0);
            p.setFirstProductImage(pi);
        }
    }
 
    @Override
    public void fill(List<Category> cs) {
        for (Category c : cs) {
            fill(c);
        }
    }
 
    @Override
    public void fill(Category c) {
        List<Product> ps = list(c.getId());
        c.setProducts(ps);
    }

    @Override
    public void fillByRow(List<Category> cs) {
        int productNumberEachRow = 8;
        for (Category c : cs) {
            List<Product> products =  c.getProducts();
            List<List<Product>> productsByRow =  new ArrayList<>();
            for (int i = 0; i < products.size(); i+=productNumberEachRow) {
                int size = i+productNumberEachRow;
                size= size>products.size()?products.size():size;
                List<Product> productsOfEachRow =products.subList(i, size);
                productsByRow.add(productsOfEachRow);
            }
            for(Product p:products){
                setSaleAndReviewNumber(p);
            }
            c.setProductsByRow(productsByRow);
        }
    }
 
    public void setFirstProductImage(List<Product> ps) {
        for (Product p : ps) {
            setFirstProductImage(p);
        }
    }
    @Override
    public void setSaleAndReviewNumber(Product p) {
        int saleCount = orderItemService.getSaleCount(p.getId());
        p.setSaleCount(saleCount);
 
        int reviewCount = reviewService.getCount(p.getId());
        p.setReviewCount(reviewCount);
    }
 
    @Override
    public void setSaleAndReviewNumber(List<Product> ps) {
        for (Product p : ps) {
            setSaleAndReviewNumber(p);
        }
    }
    @Override
    public List<Product> search(String keyword) {
        ProductExample example = new ProductExample();
        example.createCriteria().andNameLike("%" + keyword + "%");
        example.setOrderByClause("id asc");
        List result = productMapper.selectByExample(example);
        setFirstProductImage(result);
        System.out.println(result.size());
        setCategory(result);
        return result;
    }
    @Override
   public List<Product> selectByName(String[] name){
		return productMapper.selectByName(name);
    }
}