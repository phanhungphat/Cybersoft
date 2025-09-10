package com.cybersoft.demospringboot10.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Định Nghĩa đường dẫn SpringBoot, xài 2 annotation để khai báo cho SpringBoot biết là đây là định nghĩa đường dẫn
 *
 * Dùng để khai báo cho SpringBoot biết đây là nơi khai báo đường dẫn
 * @Controller: Khai báo cho Spring biết đây là nơi khai báo đường dẫn, trả về file html (Giao diện người dùng)
 * @ResponseBody: Khai báo cho Spring biết đây là nơi khai báo đường dẫn, trả về dữ liệu (JSON, XML, String, ...)
 *
 * @RestController: Khai báo cho Spring biết đây là nơi khai báo đường dẫn, trả về dữ liệu (JSON, XML, String, ...) --> Hiên tại thường hay xài JSON
 *
 * @RequestMapping: Khai báo đường dẫn
 *
 */

@RestController
@RequestMapping("/hello")
public class HelloController {

    @GetMapping // --> /hello
    public String hello(){
        return "Hello Spring Boot 10";
    }

    @GetMapping("/bc10") // --> /hello/bc10
    public String helloBc10(){
        return "Hello BC10";
    }
}
