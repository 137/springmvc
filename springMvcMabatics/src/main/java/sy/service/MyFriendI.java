package sy.service;

import java.util.HashMap;
import java.util.List;

import sy.model.MyFriend;

public interface MyFriendI {
	public List<MyFriend> getMyFriendBySql(MyFriend myFriend);
	int insertMyFriend(MyFriend myFriend);
	public String deleteMyfriend(MyFriend friend);
	public int updateByPrimaryKey(MyFriend friend);
	public List sexAnalysisPie();
	public List ageAnalysisPie();
	public List birAnalysisBar();
}
