package sy.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import sy.model.MyFriend;
import sy.service.MyFriendI;
import sy.service.MyFriendServiceImpl;
import sy.util.ThreadLocalLog;
import sy.util.controllerDeal;

@Controller
@RequestMapping("/MyFriendController")
public class MyFriendController {

    private static final Logger LOGGER = Logger.getLogger(MyFriendController.class);

    private MyFriendI myFriendService;

    public MyFriendI getUserService() {
        return myFriendService;
    }

    @Autowired
    public void setUserService(MyFriendI myFriendService) {
        this.myFriendService = myFriendService;
    }

    /**
     * 初始化
     *
     * @param id
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/showMyFriend", produces = "application/json;charset=UTF-8")//解决乱码
    public String showUser(@RequestParam(required = false, defaultValue = "12301") String id, HttpServletRequest request) {
        MyFriend m = new MyFriend();
        LOGGER.info(JSON.toJSONString(myFriendService.getMyFriendBySql(m)));
        return JSON.toJSONString(myFriendService.getMyFriendBySql(m));
    }

    //控制跳转到修改页面
    @RequestMapping(value = "/toShowMyFriendPage", produces = "application/json;charset=UTF-8")//解决乱码
    public String toShowMyFriendPage(){
        return "redirect:/showMyFriend.jsp";//重定向不经过springmvc的过滤
    }

    //跳转到好友性别分析页面
    @RequestMapping(value = "/toFriendPiePage", produces = "application/json;charset=UTF-8")//解决乱码
    public String toFriendPiePage(){
        return "/views/friend/pieChartFriend";
    }

    //跳转到好友生日分析页面
    @RequestMapping(value = "/toBirBarPage", produces = "application/json;charset=UTF-8")//解决乱码
    public String toBirBarPage(){
        return "/views/friend/birBarChartFriend";
    }

    /**
     * 不定条件值查询
     *
     * @param columnName
     * @param columnValue
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/selectMyFriend", produces = "application/json;charset=utf-8")
    public String selectMyFriend(@RequestParam(required = false) String columnName
            , @RequestParam(required = false) String columnValue, HttpServletRequest request, ModelMap model) {
        ArrayList<MyFriend> list = new ArrayList<MyFriend>();
        if (columnName != null && columnValue != null&&columnName!=""&&columnValue!="") {
            MyFriend m = new MyFriend();
            try {
                controllerDeal.getColumn(columnName, columnValue, m);    //根据传进来的参数获得数据库表相应的列名列名
                list = (ArrayList<MyFriend>) myFriendService.getMyFriendBySql(m);
            } catch (Exception e) {
                LOGGER.info(e.getMessage());
                model.put("error", e.getMessage());
                return JSON.toJSONString(model);
            }
            LOGGER.info(JSON.toJSONString(list));
            return JSON.toJSONString(list);
        }

        if(columnName!=null&&columnValue==null){
            return "请输入列的值再查询!";
        }
        MyFriend m = new MyFriend();
        LOGGER.info(JSON.toJSONString(myFriendService.getMyFriendBySql(m)));
        return JSON.toJSONString(myFriendService.getMyFriendBySql(m));
    }

    /**
     * 跳转
     * @return
     */
    @RequestMapping(value = "/toInsertPage")
    public String toInsertPage(){
        return "/views/friend/insertFriend";
    }
    /**
     * 望myfriend中插入数据
     * @param name
     * @param sex
     * @param birthday
     * @param telephone
     * @param qq
     * @param hobby
     * @param school
     * @param education_background
     * @param major
     * @param address
     * @param company
     * @param relation
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/insertFriend", produces = "application/json;charset=utf-8")
    public String insertFriend(@RequestParam(required = false) String name, @RequestParam(required = false) String sex, @RequestParam(required = false) String birthday,
                               @RequestParam(required = false) String telephone, @RequestParam(required = false) String qq, @RequestParam(required = false) String hobby,
                               @RequestParam(required = false) String school, @RequestParam(required = false) String education_background, @RequestParam(required = false) String major,
                               @RequestParam(required = false) String address, @RequestParam(required = false) String company, @RequestParam(required = false) String relation
    ) {
        String result = "";
        /*******************************************************************
         * 日志记录开始
         */
        ThreadLocalLog.t1.set("添加"+name+",qq为"+qq+"的信息");
        /**
         * 日志记录结束
         ********************************************************************/

        MyFriend friend = new MyFriend();
        friend.setName(name);
        friend.setSex(sex);
        friend.setBirthday(birthday);
        friend.setTelephone(telephone);
        friend.setQq(qq);
        friend.setHobby(hobby);
        friend.setAddress(address);
        friend.setSchool(school);
        friend.setEducation_background(education_background);
        friend.setMajor(major);
        friend.setCompany(company);
        friend.setRelation(relation);
        LOGGER.info(friend);
        try {
            result = JSON.toJSONString(myFriendService.insertMyFriend(friend));
        } catch (Exception ex) {
            LOGGER.info("插入数据异常" + ex.getMessage()+"qq和电话至少要有一个并且是唯一真实的才能插入!");
            result+= ex.getMessage()+"qq和电话至少要有一个并且是唯一真实的才能插入!";
        }
        return result;
    }

    /**
     * 删除friend
     * @param qq
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteFriend", produces = "application/json;charset=utf-8")
    public String deleteFriend(@RequestParam(required = false) String qq) throws Exception{

        String result = "";
        LOGGER.info(qq+"\n");
        MyFriend friend=new MyFriend();
        friend.setQq(qq);
        LOGGER.info(friend);
        try{
            friend=myFriendService.getMyFriendBySql(friend).get(0);

            /*******************************************************************
             * 日志记录开始
             */
            ThreadLocalLog.t1.set("删除"+friend.getName()+",qq为"+qq+"的信息");
            /**
             * 日志记录结束
             ********************************************************************/
            if(friend==null){
                throw new RuntimeException("要删除的对象不存在");
            }
            result=myFriendService.deleteMyfriend(friend);
        }catch (Exception ex){
            ex.printStackTrace();
            result+=ex.getMessage();
        }
        return result;
    }

    /**
     * 跳转到修改页面
     * @param qq
     * @return
     */
    @RequestMapping(value = "/toUpdatePage",produces = "application/json;charset=utf-8")
    public String toUpdatePage( @RequestParam(required = false) String qq,ModelMap modelMap) throws UnsupportedEncodingException {
        MyFriend friend = new MyFriend();
        //url请求乱码解决办法
        friend.setQq(new String(qq.getBytes("iso8859-1"),"UTF-8"));
        friend=myFriendService.getMyFriendBySql(friend).get(0);
        String result="";
        LOGGER.info(friend);
        //回填的对象
        modelMap.put("myFriend",friend);
        return "/views/friend/updateFriend";
    }

    /**
     * 修改信息
     * @param name
     * @param sex
     * @param birthday
     * @param telephone
     * @param qq
     * @param hobby
     * @param school
     * @param education_background
     * @param major
     * @param address
     * @param company
     * @param relation
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateFriend",produces = "application/json;charset=utf-8")
    public String updateFriend(@RequestParam(required = false) String name, @RequestParam(required = false) String sex, @RequestParam(required = false) String birthday,
                               @RequestParam(required = false) String telephone, @RequestParam(required = false) String qq, @RequestParam(required = false) String hobby,
                               @RequestParam(required = false) String school, @RequestParam(required = false) String education_background, @RequestParam(required = false) String major,
                               @RequestParam(required = false) String address, @RequestParam(required = false) String company, @RequestParam(required = false) String relation) throws SQLException{

        String result = "";


        MyFriend friend = new MyFriend();
        friend.setName(name);
        friend.setSex(sex);
        friend.setBirthday(birthday);
        friend.setTelephone(telephone);
        friend.setQq(qq);
        friend.setHobby(hobby);
        friend.setAddress(address);
        friend.setSchool(school);
        friend.setEducation_background(education_background);
        friend.setMajor(major);
        friend.setCompany(company);
        friend.setRelation(relation);
        LOGGER.info(friend);
        try {

            /**
             * 人员信息校验，并找出修改的地方
             */
            MyFriend friendParam=new MyFriend();
            friendParam.setQq(qq);
            friendParam.setName(name);
            List<MyFriend> friendList=myFriendService.getMyFriendBySql(friendParam);
            if(CollectionUtils.isEmpty(friendList)){
                throw new RuntimeException("要修改的人员信息不存在...");
            }
            MyFriend myFriend=friendList.get(0);
            String updateInfo="";
            if(!com.alibaba.druid.util.StringUtils.equals(birthday,myFriend.getBirthday())){updateInfo+="\"生日\"由：《"+myFriend.getBirthday()+"》被修改为：《"+birthday+"》";}
            if(!com.alibaba.druid.util.StringUtils.equals(telephone,myFriend.getTelephone())){updateInfo+="\"电话号码\"由：《"+myFriend.getTelephone()+"被修改为：《"+telephone+"》";}
            if(!com.alibaba.druid.util.StringUtils.equals(hobby,myFriend.getHobby())){updateInfo+="\"兴趣爱好\"由：《"+myFriend.getHobby()+"》被修改为：《"+hobby+"》";}
            if(!com.alibaba.druid.util.StringUtils.equals(school,myFriend.getSchool())){updateInfo+="\"学校\"由：《"+myFriend.getSchool()+"》被修改为：《"+school+"》";}
            if(!com.alibaba.druid.util.StringUtils.equals(education_background,myFriend.getEducation_background())){updateInfo+="\"教育背景由：《"+myFriend.getEducation_background()+"》被修改为：《"+education_background+"》";}
            if(!com.alibaba.druid.util.StringUtils.equals(major,myFriend.getMajor())){updateInfo+="\"专业\"由：《"+myFriend.getMajor()+"》被修改为：《"+major+"》";}
            if(!com.alibaba.druid.util.StringUtils.equals(company,myFriend.getCompany())){updateInfo+="\"公司\"由：《"+myFriend.getCompany()+"》被修改为：《"+company+"》";}
            if(!com.alibaba.druid.util.StringUtils.equals(relation,myFriend.getRelation())){updateInfo+="\"与我的关系\"由：《"+myFriend.getRelation()+"》被修改为：《"+relation+"》";}


            /*******************************************************************
             * 日志记录开始
             */
            ThreadLocalLog.t1.set("修改名为"+name+",qq为"+qq+"的信息.........."+updateInfo);
            /**
             * 日志记录结束
             ********************************************************************/

            result = JSON.toJSONString(myFriendService.updateByPrimaryKey(friend));
        } catch (Exception ex) {
            LOGGER.error("修改数据异常" + ex.getMessage());
            result+= ex.getMessage();
        }
        return result;
    }

    /**
     * 性别分析
     * @return
     * @throws UnsupportedEncodingException
     * @throws SQLException
     * @throws IOException
     */

    @ResponseBody
    @RequestMapping(value = "/sexAnalysis",produces = "application/json;charset=utf-8")
    public String sexAnalysis() throws UnsupportedEncodingException,SQLException,IOException{
        return JSON.toJSONString(myFriendService.sexAnalysisPie());
    }

    /**
     * 年龄段分析
     * @return
     * @throws UnsupportedEncodingException
     * @throws SQLException
     * @throws IOException
     */

    @ResponseBody
    @RequestMapping(value = "/ageAnalysis",produces = "application/json;charset=utf-8")
    public String ageAnalysis() throws UnsupportedEncodingException,SQLException,IOException{
        return JSON.toJSONString(myFriendService.ageAnalysisPie());
    }

    /**
     * 生日分析
     * @return
     * @throws UnsupportedEncodingException
     * @throws SQLException
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value = "/birAnalysis",produces = "application/json;charset=utf-8")
    public String birAnalysis() throws UnsupportedEncodingException,SQLException,IOException{
        return JSON.toJSONString(myFriendService.birAnalysisBar());
    }
}
