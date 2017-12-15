package com.absolom.dracarys.cache;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.connection.jedis.JedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import redis.clients.jedis.exceptions.JedisConnectionException;

/**
 * Redis缓存操作基础类
 * @author zhepan@outlook.com
 * @create 2017-12-14 15:30
 */
public abstract class BaseRedisUtil {

    public static final Logger LOGGER = LoggerFactory.getLogger(MyBatisRedisCache .class);

    public static RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();

    private static JedisConnectionFactory jedisConnectionFactory;

    public abstract void putObject(Object key, Object field, Object value);

    public abstract Object getObject(Object key, Object field);

    public Object remove(Object key, Object field){
        Object result = null;
        JedisConnection connection = null;
        try {
            connection = getFactory().getConnection();
            result = connection.hDel(serializer.serialize(key),serializer.serialize(field));
            LOGGER.error("================================移除field级缓存： key:" + key +" field:" + field);
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

    public Object remove(Object key){
        Object result = null;
        JedisConnection connection = null;
        try {
            if (null != key) {
                connection = getFactory().getConnection();
                result = connection.del(serializer.serialize(key));
                LOGGER.error("================================移除key级缓存： key:" + key);
            }
        } catch (JedisConnectionException e) {
            e.printStackTrace();
        } finally {
            if (null != connection) {
                connection.close();
            }
        }
        return result;
    }

    public void clear(){
        JedisConnection connection = null;
        try {
            connection = jedisConnectionFactory.getConnection();
            connection.flushDb();
            connection.flushAll();
            LOGGER.error("================================移除所有缓存");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if (null != connection) {
                connection.close();
            }
        }
    }

    public int getSize(){
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

    public static void setFactory(JedisConnectionFactory jedisConnectionFactory) {
        BaseRedisUtil.jedisConnectionFactory = jedisConnectionFactory;
    }

    public static JedisConnectionFactory getFactory(){
        return jedisConnectionFactory;
    }

}
