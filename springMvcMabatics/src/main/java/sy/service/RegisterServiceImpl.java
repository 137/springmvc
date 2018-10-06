package sy.service;

import sy.dao.RegisterDao;

/**
 * Created by love137 on 2017/3/16.
 */
public class RegisterServiceImpl implements RegisterService {

    private RegisterDao registerDao;

    public RegisterServiceImpl() {}

    /** 带参数的构造方法 */
    public RegisterServiceImpl(RegisterDao  registerDao){
        this.registerDao =registerDao;
    }

    public void save(String loginName, String password) {
        System.out.println("保存...");
//        registerDao.save();
//        throw new RuntimeException("故意抛出一个异常。。。。");
    }

    /** set方法 */
    public void setRegisterDao(RegisterDao registerDao) {
        this.registerDao = registerDao;
    }

    public void setRegisterDaoImpl(sy.dao.RegisterDaoImpl registerDaoImpl) {
    }
}
