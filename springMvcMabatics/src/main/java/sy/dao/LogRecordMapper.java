package sy.dao;

import org.springframework.stereotype.Repository;
import sy.model.LogRecord;

import java.util.List;

/**
 * Created by love137 on 2018/10/6.
 * 日志记录dao层
 */
@Repository
public interface LogRecordMapper {

    /**
     * 按照各种条件进行模糊查询
     * @param record
     * @return
     */
    List<LogRecord> selectBySql(LogRecord record);

    /**
     * 插入日志记录
     * @param record
     * @return
     */
    int insert(LogRecord record);

}
