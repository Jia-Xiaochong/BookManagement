package com.jiaxc.mapper;

import com.jiaxc.pojo.Action;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository(value = "actionDao")
public interface ActionDao {
    public int getNumByUid(int uid);
    public int addAction(Action action);
    public int returnBookAction(Action action);
    public int returnBookDelay(Action action);
    public int updateActionByUidBid(Action action);
    public Action selectActionByAid(int aid);
    public List<Action> selectActionByBid(int bid);
    public List<Action> selectActionByUid(int uid);
    public int selectByUidBid(Action action);
}
