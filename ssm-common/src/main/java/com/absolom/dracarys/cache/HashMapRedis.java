package com.absolom.dracarys.cache;

import org.springframework.data.redis.connection.jedis.JedisConnection;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zhepan@outlook.com
 * @create 2017-12-14 15:33
 */
public class HashMapRedis extends BaseRedisUtil {

    @Override
    public void putObject(Object key, Object field, Object value) {
        JedisConnection connection = null;
        try {
            connection = getFactory().getConnection();
            connection.hSet(serializer.serialize(key),serializer.serialize(field), serializer.serialize(value));
            LOGGER.error("================================缓存放入 key:" + key +" field:" + field + " value:" + value);
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
    public Object getObject(Object key, Object field) {
        Object result = null;
        JedisConnection connection = null;
        try {
            connection = getFactory().getConnection();
            result = serializer.deserialize(connection.hGet(serializer.serialize(key),serializer.serialize(field)));
            LOGGER.error("================================缓存取出 key:" + key +" field:" + field + " value:" + result);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (null != connection) {
                connection.close();
            }
        }
        return result;
    }
}
