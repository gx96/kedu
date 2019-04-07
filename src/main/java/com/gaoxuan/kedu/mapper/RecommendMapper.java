package com.gaoxuan.kedu.mapper;

import com.gaoxuan.kedu.pojo.Recommend;
import com.gaoxuan.kedu.pojo.RecommendExample;
import java.util.List;

public interface RecommendMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Recommend record);

    int insertSelective(Recommend record);

    List<Recommend> selectByExample(RecommendExample example);

    List<Recommend> selectByUid(Integer uid);

    Recommend selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Recommend record);

    int updateByPrimaryKey(Recommend record);

}