/**
 * this file will be loaded before server started
 * you can define global functions used in controllers, models, templates
 */


//redis连接问题
// 查询进程 ps -ef | grep redis
// kill xxx
// vim redis.conf   修改允许绑定的IP  bind *
//
//重启服务 ./redis-server ../redis.conf

// npm install ioredis --s

//读取配置文件
const redis_config = think.config('rank_redis')

//引进包
const Redis = require('ioredis');

//声明全局对象
global.redis = {};

//实例化对象
redis = new Redis(redis_config.hosts[0]);


//监听对应的操作
redis.on('reconnecting', ()=> {
    think.log("[redis reconnecting]")
});
redis.on('connect', ()=>{
    think.log("[redis connect]")
});
redis.on('error', (err)=> {
    think.log( "[redis error]")
    think.log(err)
})
