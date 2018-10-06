package sy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sy.dao.LogRecordMapper;
import sy.model.LogRecord;

import java.util.List;

/**
 * Created by love137 on 2018/10/6.
 * 日志记录服务实现类
 */
@Service
public class LogRecordServiceImpl implements LogRecordService{

    @Autowired
    LogRecordMapper logRecordMapper;

    @Override
    public int insertLog(LogRecord record) {
        return logRecordMapper.insert(record);
    }

    @Override
    public List<LogRecord> queryLog(LogRecord record) {
        return logRecordMapper.selectBySql(record);
    }
}
