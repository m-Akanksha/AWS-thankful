package com.example.Thankful_aws;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @RequestMapping("getname")

    public String getName(){
        return "Mayank";
    }
}
