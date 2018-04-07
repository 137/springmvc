package sy.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sy.dao.MyFriendMapper;
import sy.model.MyFriend;
@Service("myFriendService")
public class MyFriendServiceImpl implements MyFriendI{

	private MyFriend myFriend=new MyFriend();
	
	private MyFriendMapper myFriendMapper;


	@Autowired
	public void setMyFriendMapper(MyFriendMapper myFriendMapper){
		this.myFriendMapper=myFriendMapper;
	}
	
	@Override
	public List<MyFriend> getMyFriendBySql(MyFriend myFriend) {
		// TODO Auto-generated method stub
		return myFriendMapper.selectBySql(myFriend);
	}
	
	@Override
	public int insertMyFriend(MyFriend myFriend) {
		// TODO Auto-generated method stub
		return myFriendMapper.insert(myFriend);
	}

	@Override
	public String deleteMyfriend(MyFriend myFriend) {
		return String.valueOf(myFriendMapper.deleteByPrimaryKey(myFriend));
	}

	public MyFriend getMyFriend() {
		return myFriend;
	}

	public void setMyFriend(MyFriend myFriend) {
		this.myFriend = myFriend;
	}
	
	public MyFriendMapper getMyFriendMapper(){
		return myFriendMapper;
	}
	

	public int updateByPrimaryKey(MyFriend friend){
		return myFriendMapper.updateByPrimaryKey(friend);
	}

	/**
	 * 好友性别分析
	 * @return
	 */
	@Override
	public List sexAnalysisPie(){
		return myFriendMapper.sexAnalysisPie();
	}

	/**
	 * 年龄段分析
	 * @return
	 */
	public List ageAnalysisPie(){
		return myFriendMapper.ageAnalysisPie();
	}

	/**
	 *
	 * @return
	 */
	public List birAnalysisBar(){
		return myFriendMapper.birAnalysisBar();
	}
}
