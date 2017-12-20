package sy.controller;


import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class SendMessageTimer implements ServletContextListener {
    private Timer timer = null;
    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
        timer.cancel();
    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        //设置执行时间
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);//每天
        //定制每天的10:00:00执行，
        calendar.set(year, month, day, 20, 21, 50);
        Date date = calendar.getTime();
        timer = new Timer(true);
        System.out.println(date);
//        int period = 24 * 60 * 60 * 1000;
        int period = 24 * 60 * 60 * 1000;
        //每天的date时刻执行task，每隔一天重复执行
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.printf("执行了");
            }
        }, date, period);
        //每天的date时刻执行task, 仅执行一次
        //timer.schedule(task, date);

    }
}  
