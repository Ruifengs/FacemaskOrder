import com.facemask.domain.Facemask;
import com.facemask.domain.Person;
import com.facemask.domain.Record;
import com.facemask.enums.RecordEnum;
import com.facemask.service.FaceMaskService;
import com.facemask.service.PersonService;
import com.facemask.service.RecordService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

public class TestSpring {
    @Test
    public void test() {
        ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-config.xml");
//        PersonService personService=(PersonService) applicationContext.getBean("personServiceImpl");
        RecordService recordService = (RecordService) applicationContext.getBean("recordServiceImpl");
        //测试findALL
//        List<Facemask> faceMasks = faceMaskService.findAll();
//        for(Facemask f:faceMasks){
//            System.out.println(f);
//        }

//        Person person=new Person();
//        person.setUsername("ccba");
//        person.setPassword("111");
//        person.setpName("李四");
//        person.setIdNum("123456");
//        person.setPhoneNum("13700000000");
//        person.setPermissions(1);
//
//        personService.insert(person);
//
//        List<Record> list=recordService.findAll();
//        System.out.println(list);
//        Record record = new Record();
//        if (record.getP_ID() == null)
//            System.out.println("null");
//        else
//            System.out.println(record);
        Integer s=1;
        System.out.println(s^1);
    }
}
