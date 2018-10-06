package sy.common;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import sy.model.LogRecord;
import sy.model.MyFriend;
import sy.service.LogRecordService;
import sy.util.DateUtil;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;


/**
 * Created by love137 on 2018/10/6.
 * 日志记录切面
 */

@Aspect
public class LogRecordAspect {

    private Logger logger= Logger.getLogger("LogRecordAspect");

    @Autowired
    private LogRecordService recordService;

    //需要拦截的操作方法
    private static final List<String> recordMethods= Arrays.asList("insertMyFriend","deleteMyfriend","updateByPrimaryKey");

    /**
     * 定义切入点
     */
    @Pointcut("execution(* sy.service.*.*(..))")
    public  void  logRecordCut(){

    }

    /**
     * 定义前置通知:开启记录日志
     */
    @Before("logRecordCut()")
    public  void  beforeLogRecord(JoinPoint joinPoint) throws ClassNotFoundException {
        logger.info("开启记录日志前置处理....");
        logger.info("拦截到的类："+joinPoint.toString());
        String methodName = joinPoint.getSignature().getName(); //获取方法名称
        //拦截其请求参数
        if(recordMethods.contains(methodName)){
                logger.info("拦截到对我的朋友的操作，需要记录日志，记录开始...");
                logger.info("正在执行："+methodName+"方法...");
                Object[] args = joinPoint.getArgs();
                MyFriend myFriend=((MyFriend) args[0]);
                logger.info("插入日志表："+myFriend);

                //日志表数据封装
                LogRecord logRecord=new LogRecord();
                logRecord.setCreateTime(DateUtil.formatToSysDate(new Date()));
                logRecord.setOperateName(methodName);
                logRecord.setOperateObj(myFriend.toString());
                logRecord.setOperateDes("正在完成："+methodName+"方法");
                recordService.insertLog(logRecord);
                logger.info("插入日志表成功："+myFriend);

            }

    }

    /**
     * 定义后置通知：提交事物
     */
    @After("logRecordCut()")
    public  void  afterLogRecord(){
        logger.info("记录日志后置处理....");

    }

    /**
     * 定义异常通知：事物回滚
     */
    @AfterThrowing("logRecordCut()")
    public  void  exceptionLogRecord() {
        logger.info("记录日志发生异常....");
    }



}
