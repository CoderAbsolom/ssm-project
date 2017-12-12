package com.absolom.dracarys.cache;

import org.apache.ibatis.cache.Cache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.jedis.JedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;


/**
 * 用Redis作为持久层二级缓存
 * @author zhepa
 * @create 2017-12-11 14:00
 */
public class MyBatisRedisCache implements Cache {

    private static final Logger LOGGER = LoggerFactory.getLogger(MyBatisRedisCache .class);

    private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

    private static JedisConnectionFactory jedisConnectionFactory;

    private final String id;

    public static void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory){
        MyBatisRedisCache.jedisConnectionFactory = jedisConnectionFactory;
    }

    public MyBatisRedisCache (final String id) {
        if (null == id) {
            throw new IllegalArgumentException("Cache instance require an ID");
        }
        LOGGER.info("Redis Cache id " + id);
        this.id = id;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void putObject(Object key, Object value) {
        JedisConnection connection = null;
        try {
            connection = jedisConnectionFactory.getConnection();
            RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();
            connection.set(serializer.serialize(key), serializer.serialize(value));
            LOGGER.error("================================缓存放入 key:" + key + " value:" + value);
        }
        catch (JedisConnectionException e) {
            e.printStackTrace();
        }
        finally {
            if (null != connection) {
                connection.close();
            }
        }
    }

    @Override
    public Object getObject(Object key) {
        Object result = null;
        JedisConnection connection = null;
        try {
            connection = jedisConnectionFactory.getConnection();
            RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();
            result = serializer.deserialize(connection.get(serializer.serialize(key)));
            LOGGER.error("================================缓存取出：" + result);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (null != connection) {
                connection.close();
            }
        }
        return result;
    }

    @Override
    public Object removeObject(Object key) {
        Object result = null;
        JedisConnection connection = null;
        try {
            connection = jedisConnectionFactory.getConnection();
            RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();
            result =connection.expire(serializer.serialize(key), 0);
            LOGGER.error("================================移除缓存 key:" + key);
        }
        catch (JedisConnectionException e) {
            e.printStackTrace();
        }
        finally {
            if (null != connection) {
                connection.close();
            }
        }
        return result;
    }

    @Override
    public void clear() {
        JedisConnection connection = null;
        try {
            connection = jedisConnectionFactory.getConnection();
            connection.flushDb();
            connection.flushAll();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (null != connection) {
                connection.close();
            }
        }
    }

    @Override
    public int getSize() {
        int result = 0;
        JedisConnection connection = null;
        try {
            connection = jedisConnectionFactory.getConnection();
            result = Integer.valueOf(connection.dbSize().toString());
        }
        catch (JedisConnectionException e) {
            e.printStackTrace();
        }
        finally {
            if (null != connection) {
                connection.close();
            }
        }
        return result;
    }

    @Override
    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }
}
