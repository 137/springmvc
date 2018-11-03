package sy.util;

/**
 * Created by love137 on 2018/10/7.
 * 日志线程传参（当前线程参数共享，其他现场访问不到）
 */
public class ThreadLocalLog {

    public static ThreadLocal<String> t1 = new ThreadLocal<String>();
}
