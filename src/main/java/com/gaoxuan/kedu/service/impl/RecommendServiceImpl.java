package com.gaoxuan.kedu.service.impl;

import com.gaoxuan.kedu.mapper.RecommendMapper;
import com.gaoxuan.kedu.pojo.Recommend;
import com.gaoxuan.kedu.pojo.RecommendExample;
import com.gaoxuan.kedu.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RecommendServiceImpl implements RecommendService {
    @Autowired
    RecommendMapper recommendMapper;
    @Override
    public void add(Recommend recommend) {
        recommendMapper.insert(recommend);
    }
    @Override
    public List<Recommend> list() {
        RecommendExample example=new RecommendExample();
        example.setOrderByClause("id asc");
        return recommendMapper.selectByExample(example);
    }

    @Override
    public List<Recommend> get(Integer uid) {
        return recommendMapper.selectByUid(uid);
    }


}
