package sy;

import redis.clients.jedis.Jedis;

/**
 * Created by love137 on 2017/2/27.
 */
public class testRedis {
    public static void main(String[] args) {

        Jedis jedis=new Jedis("localhost");
        System.out.println(jedis.ping());
    }
}
