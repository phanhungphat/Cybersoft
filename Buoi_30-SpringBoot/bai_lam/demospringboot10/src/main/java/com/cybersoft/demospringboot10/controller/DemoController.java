package com.cybersoft.demospringboot10.controller;

import com.cybersoft.demospringboot10.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class DemoController {

    @Autowired
    private User user;

    @GetMapping
    public String demo(){
        return "Demo Controller " + user.getName();
    }
}
