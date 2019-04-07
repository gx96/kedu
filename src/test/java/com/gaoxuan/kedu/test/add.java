package com.gaoxuan.kedu.test;

public class add {
    public static void main(String[] args) {
        add1(111111);
    }
    static void add1(int n){
        int sum=0;
        while(n != 0){
            sum += n % 10;
            n /=10;
        }
        System.out.println(sum);
    }
}
