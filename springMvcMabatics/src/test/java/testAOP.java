import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import sy.dao.RegisterDaoImpl;
import sy.service.RegisterServiceImpl;

/**
 * Created by love137 on 2017/3/16.
 */
public class testAOP {
    @Test
    public  void test() {
        ApplicationContext act = new ClassPathXmlApplicationContext("SpringAop.xml");
        RegisterServiceImpl e = (RegisterServiceImpl) act.getBean("logServiceProxyId");
        e.save("zhang","123");
    }
}
