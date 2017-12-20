package sy.util;


import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.beans.BeanUtils;
import sy.model.User;
import sy.model.UserRole;

import java.lang.reflect.Method;
import java.util.Date;

/**
 * Created by love137 on 2017/3/16.
 */
public class LogAspect implements MethodInterceptor {

    @Override
    public Object invoke(MethodInvocation methodInvocation) throws Throwable {
        System.out.println("before");

        Method method=methodInvocation.getMethod();
        Object []args=methodInvocation.getArguments();
//        for (Object arg : args) {
//            //参数对象不是tnt基础对象接口的一个实例，则不做设置
//            if (!(arg instanceof TntBaseInterface)) {
//                continue;
//            }
//            hasTnt = true;
//            //从eventContext中获取tntInstId，并设置
//            ((TntBaseInterface) arg).setTntInstId(tntInstId);
//        }
        //执行目标方法
            Object obj = methodInvocation.proceed();

        System.out.println("after");


        return obj;
    }


    public Object getResult(Object o){
        if(o instanceof User){
            ((User) o).setCreatedatetime(new Date());
        }


        BeanUtils.copyProperties(new User(), new UserRole(),UserRole.class);
        return o;
    }




}
