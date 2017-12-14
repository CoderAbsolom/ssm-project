package com.absolom.dracarys.cache;

import org.springframework.data.redis.connection.jedis.JedisConnection;
import redis.clients.jedis.exceptions.JedisConnectionException;

/**
 * @author zhepan@outlook.com
 * @create 2017-12-14 16:55
 */
public class StringRedisUtil extends BaseRedisUtil{

    @Override
    public void putObject(Object key, Object field, Object value) {
        JedisConnection connection = null;
        try {
            connection = getFactory().getConnection();
            connection.set(serializer.serialize(key), serializer.serialize(value));
            LOGGER.error("================================缓存放入 key:" + key +" value:" + value);
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
            result = serializer.deserialize(connection.get(serializer.serialize(key)));
            LOGGER.error("================================缓存取出 key:" + key +" value:" + result);
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
