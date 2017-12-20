package sy.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import sy.model.MyFriend;

@Repository
public interface MyFriendMapper {
	int deleteByPrimaryKey(MyFriend record);
	int insert(MyFriend record);
	int insertSelective(MyFriend record);
	MyFriend selectByPrimaryKey(String id);

	/**
	 * 性别分析
	 * @return
	 */
	List sexAnalysisPie();

	/**
	 * 年龄段分析
	 * @return
	 */
	List ageAnalysisPie();

	/**
	 * 生日分析
	 * @return
	 */
	List birAnalysisBar();
	int updateByPrimaryKeySelective(MyFriend record);
	int updateByPrimaryKey(MyFriend record);
	
	/**
	 * 按照各种条件进行模糊查询
	 * @param record
	 * @return
	 */
	List<MyFriend> selectBySql(MyFriend record);
	/**
	 * 获取所有的数据
	 * @return
	 */
	List<MyFriend> getAll();
	List<MyFriend> getAll3();
}
