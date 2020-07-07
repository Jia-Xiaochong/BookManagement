package com.jiaxc.service;

import com.jiaxc.pojo.Action;

import java.util.List;

public interface ActionService {
    public int addAction(Action action);
    public int returnBookAction(Action action);
    public int returnBookDelay(Action action);
    public int updateActionByUidBid(Action action);
    public Action selectActionByAid(int aid);
    public List<Action> selectActionByBid(int bid);
    public List<Action> selectActionByUid(int uid);
    public int selectByUidBid(Action action);
}
