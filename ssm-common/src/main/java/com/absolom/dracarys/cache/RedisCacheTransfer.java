package com.absolom.dracarys.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.stereotype.Component;

/**
 * @author zhepa
 * @create 2017-12-11 16:40
 */
@Component
public class RedisCacheTransfer {

    @Autowired
    public void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
        BaseRedisUtil.setFactory(jedisConnectionFactory);
    }
}
