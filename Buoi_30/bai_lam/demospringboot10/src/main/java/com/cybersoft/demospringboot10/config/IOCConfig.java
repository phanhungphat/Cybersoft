package com.cybersoft.demospringboot10.config;

import com.cybersoft.demospringboot10.entity.User;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration // khai báo đây là file cấu hình cho Spring quét ở tầng config
public class IOCConfig {

    //@Bean : Khai báo cho Spring biết đây là nơi khai báo các Bean (đối tượng) gán sẵn giá trị và đưa lên IOC Container

    @Bean // Bean có tên nhưng mà không gán thì tên hàm sẽ là tên cho Brean
    public User user(){
        System.out.println("Khởi tạo Bean User");
        User user = new User();
        user.setId(1);
        user.setName("Nguyen Van A");

        return user;
    }
}
