'use strict';

export default {


    port:8360, //项目端口
    //dev环境
    db: {
        type: 'mysql',
        log_sql: true,
        log_connect: true,
        adapter: {
            mysql: {
                host: '127.0.0.1',
                port: '3306',
                database: 'movie',
                user: 'root',
                password: 'password',
                prefix: '',
                encoding: 'utf8'
            }
        }
    }


};