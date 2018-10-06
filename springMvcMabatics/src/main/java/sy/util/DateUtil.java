package sy.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by love137 on 2018/10/6.
 */
public class DateUtil {

    public  static String formatToSysDate(Date date){
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return simpleDateFormat.format(date);
    }
}
