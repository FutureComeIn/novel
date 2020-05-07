package com.yxw.xiaoshuospring;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.yxw.xiaoshuospring")
@ComponentScan("com.yxw.xiaoshuospring")
public class XiaoshuospringApplication {

    public static void main(String[] args) {
        SpringApplication.run(XiaoshuospringApplication.class, args);
    }

}
