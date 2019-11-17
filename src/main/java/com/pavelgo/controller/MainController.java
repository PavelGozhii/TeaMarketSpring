package com.pavelgo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class MainController {

    @Value("${spring.application.name")
    public String appName;

    @GetMapping
    public String homePage(Model model) {
        model.addAttribute("appName", appName);
        return "home";
    }
}
