package com.gaoxuan.kedu.service;

import java.util.List;
 
import com.gaoxuan.kedu.pojo.Review;
 
public interface ReviewService {
      
    void add(Review c);
 
    void delete(int id);
    void update(Review c);
    Review get(int id);
    List list(int pid);
 
    int getCount(int pid);
}