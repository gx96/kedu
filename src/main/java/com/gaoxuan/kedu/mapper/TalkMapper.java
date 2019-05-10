package com.gaoxuan.kedu.mapper;

import com.gaoxuan.kedu.pojo.Talk;
import com.gaoxuan.kedu.pojo.TalkExample;
import java.util.List;

public interface TalkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Talk record);

    int insertSelective(Talk record);

    List<Talk> selectByExample(TalkExample example);

    Talk selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Talk record);

    int updateByPrimaryKey(Talk record);
}