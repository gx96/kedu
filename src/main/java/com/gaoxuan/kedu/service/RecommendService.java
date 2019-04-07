package com.gaoxuan.kedu.service;

import com.gaoxuan.kedu.pojo.Recommend;

import java.util.List;

public interface RecommendService {
    //查询所有
    List<Recommend> list();
    //按id查询
    List<Recommend> get(Integer uid);
    //添加
    void add(Recommend recommend);
}
