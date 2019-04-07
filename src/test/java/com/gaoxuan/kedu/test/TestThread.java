package com.gaoxuan.kedu.test;

class ThreadDemo extends Thread{
    public ThreadDemo(String str){
        super(str);
    }
    public void run() {
        for (int i = 1; i <= 20; i++) {
            System.out.println("第"+i+"次" + Thread.currentThread().getName());
            try {
                sleep(300);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println(" /end");
    }
}

public class TestThread{
    public static void main(String[] args) {
        ThreadDemo thread1=new ThreadDemo("T1");
        ThreadDemo thread2=new ThreadDemo("T2");
        thread1.start();
        thread2.start();
    }
}
