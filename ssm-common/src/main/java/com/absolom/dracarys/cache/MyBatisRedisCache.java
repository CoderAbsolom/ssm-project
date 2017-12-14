package com.absolom.dracarys.cache;

import org.apache.ibatis.cache.Cache;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;


/**
 * 用Redis作为持久层二级缓存
 * @author zhepa
 * @create 2017-12-11 14:00
 */
public class MyBatisRedisCache implements Cache {

    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

    private final BaseRedisUtil redisUtil = new HashMapRedis();

    private final String id;

    public MyBatisRedisCache (final String id) {
        if (null == id) {
            throw new IllegalArgumentException("================================Cache instance require an ID");
        }
        this.id = id;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void putObject(Object key, Object value) {
        redisUtil.putObject(id,key,value);
    }

    @Override
    public Object getObject(Object key) {
        return redisUtil.getObject(id,key);
    }

    @Override
    public Object removeObject(Object key) {
        return null;
    }

    @Override
    public void clear() {
        redisUtil.removeByKey(id);
    }

    @Override
    public int getSize() {
        return redisUtil.getSize();
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }
}
