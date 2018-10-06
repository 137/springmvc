package sy.controller;

import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sy.model.LogRecord;
import sy.model.MyFriend;
import sy.service.LogRecordService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by love137 on 2018/10/6.
 * 日志记录表的查询
 */
@Controller
@RequestMapping("/LogRecordController")
public class LogRecordController {


    private static final Logger logger = Logger.getLogger(LogRecordController.class);


    @Autowired
    private LogRecordService recordService;


    /**
     * 初始化查询日志操作记录
     *
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/showMyRecordLog", produces = "application/json;charset=UTF-8")//解决乱码
    public String showLog(HttpServletRequest request) {
        MyFriend m = new MyFriend();
        List<LogRecord> recordList=new ArrayList<LogRecord>();
        recordList=recordService.queryLog(new LogRecord());
//        recordList.forEach(p->{
//            DateUtils.format(date,"yyyy-MM-dd hh:mm:ss");
//        });
        return JSON.toJSONString(recordList);
    }


    //控制跳转到日志首页
    @RequestMapping(value = "/toShowMyRecordLog", produces = "application/json;charset=UTF-8")//解决乱码
    public String toShowMyRecordLog(){
        return "views/log/index";
    }
}


