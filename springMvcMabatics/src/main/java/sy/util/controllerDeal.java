package sy.util;

import sy.model.MyFriend;

public class controllerDeal {
	
	/**
	 * 供MyFriend多条件的查询搜索
	 * @param column
	 * @param columnValue
	 * @param myFriend
	 * @throws Exception 
	 */
	public static void getColumn(String column,String columnValue,MyFriend myFriend) throws Exception{
		if(column.equals("创建时间")){
			myFriend.setCreatedate(columnValue);
		}else if(column.equals("姓名")){
			myFriend.setName(columnValue);
		}else if(column.equals("性别")){
			myFriend.setSex(columnValue);
		}else if(column.equals("出生日期")){
			myFriend.setBirthday(columnValue);
		}else if(column.equals("电话号码")){
			myFriend.setTelephone(columnValue);
		}else if(column.equals("qq")){
			myFriend.setQq(columnValue);
		}else if(column.equals("兴趣爱好")){
			myFriend.setHobby(columnValue);
		}else if(column.equals("学校")){
			myFriend.setSchool(columnValue);
		}else if(column.equals("教育背景")){
			myFriend.setEducation_background(columnValue);
		}else if(column.equals("专业")){
			myFriend.setMajor(columnValue);
		}else if(column.equals("地址")){
			myFriend.setAddress(columnValue);
		}else if(column.equals("公司")){
			myFriend.setCompany(columnValue);
		}else if(column.equals("与本人关系")){
			myFriend.setRelation(columnValue);
		}else{
			throw new Exception("请确定您输入的列名正确然后再查询...");
		}
		
	}
}

