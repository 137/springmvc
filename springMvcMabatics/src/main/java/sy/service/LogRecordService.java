package sy.service;

import org.springframework.stereotype.Component;
import sy.model.LogRecord;

import java.util.List;

/**
 * Created by love137 on 2018/10/6.
 * 日志记录服务接口
 */
@Component
public interface LogRecordService {

    int insertLog(LogRecord record);

    List<LogRecord> queryLog(LogRecord record);
}
