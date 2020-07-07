package com.jiaxc.service.impl;

import com.jiaxc.mapper.ActionDao;
import com.jiaxc.pojo.Action;
import com.jiaxc.service.ActionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service(value = "actionService")
public class ActionServiceImpl implements ActionService {

    @Resource(name = "actionDao")
    private ActionDao actionDao;

    @Override
    public int addAction(Action action) {
        return this.actionDao.addAction(action);
    }

    @Override
    public int returnBookAction(Action action) {
        return this.actionDao.returnBookAction(action);
    }

    @Override
    public int returnBookDelay(Action action) {
        return this.actionDao.returnBookDelay(action);
    }

    @Override
    public int updateActionByUidBid(Action action) {
        return this.actionDao.updateActionByUidBid(action);
    }

    @Override
    public Action selectActionByAid(int aid) {
        return this.actionDao.selectActionByAid(aid);
    }

    @Override
    public List<Action> selectActionByBid(int bid) {
        return this.actionDao.selectActionByBid(bid);
    }

    @Override
    public List<Action> selectActionByUid(int uid) {
        return this.actionDao.selectActionByUid(uid);
    }

    @Override
    public int selectByUidBid(Action action) {
        return this.actionDao.selectByUidBid(action);
    }
}
