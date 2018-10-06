package sy.model;

import java.util.Date;

/**
 * Created by love137 on 2018/10/6.
 * 日志记录模型
 */
public class LogRecord {


    /**
     * 创建时间
     */
    private String createTime;


    /**
     * 操作名称
     */
    private String operateName;

    /**
     * 操作描述
     */
    private String operateDes;


    /**
     * 操作对象
     */
    private String operateObj;

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getOperateName() {
        return operateName;
    }

    public void setOperateName(String operateName) {
        this.operateName = operateName;
    }

    public String getOperateDes() {
        return operateDes;
    }

    public void setOperateDes(String operateDes) {
        this.operateDes = operateDes;
    }

    public String getOperateObj() {
        return operateObj;
    }

    public void setOperateObj(String operateObj) {
        this.operateObj = operateObj;
    }

    @Override
    public String toString() {
        return "LogRecord{" +
                "createTime=" + createTime +
                ", operateName='" + operateName + '\'' +
                ", operateDes='" + operateDes + '\'' +
                ", operateObj='" + operateObj + '\'' +
                '}';
    }
}
