'use strict';
import moment from 'moment';
import request from 'request';


//小程序相关配置
const app = think.config('app')
//支付相关配置
const pay = think.config('pay')
//服务器信息
const server = think.config("server")






export default class extends think.service.base {

    init(...args){
        super.init(...args);

    }





    /**
     * 获取用户隐私信息
     * @param code 凭证
     * @returns {*}
     */
    async get_user_openid(data){

        //通过code换取用户隐私信息
        let url = `https://api.weixin.qq.com/sns/jscode2session?appid=${app.appid}&secret=${app.secret}&js_code=${data.code}&grant_type=authorization_code`;

        let result = await this.getwechat(url);
        think.log("【获取openid 请求结果】")
        think.log(result)
        return result;

    }






    /**
     * post 数据提交
     * @param url
     * @param data
     * @returns {Promise}
     */
    postwechat(url, data) {
        console.log(url)
        return new Promise((resolve, reject) => {
            request.post({
                url: url,
                method:'POST',
                body: data

            }, function(e, r, body) {
                if (e) reject(e);
                resolve(body)
            })
        })
    }

    /**
     * get 数据提交
     * @param url
     * @returns {Promise}
     */
    getwechat(url, data) {
        console.log(url)
        return new Promise((resolve, reject) => {
            request.get({
                url: url,
                method:'GET'
            }, function(e, r, body) {
                if (e) reject(e);
                resolve(body)
            })
        })
    }










    /**
     * post 数据提交
     * @param url
     * @param data
     * @returns {Promise}
     */
    postJson(url, data) {
        console.log(url)
        return new Promise((resolve, reject) => {
            request.post({
                url: url,
                body: data,
                json: true
            }, function(e, r, body) {
                if (e) reject(e);
                resolve(body)
            })
        })
    }




    /**
     * get 请求
     * @param url 请求路径
     * @param param json对象，拼接到url上
     * @returns {Promise}
     */
    get(url,param) {
        //格式化添加token
        url+= url.indexOf('?')>-1?'':'?';
        let paramStr = "";
        if(!think.isEmpty(param)){
            for(let obj in param){
                paramStr += (obj + "=" + param[obj] + "&");
            }
        }
        paramStr =  paramStr.substring(0,paramStr.lastIndexOf("&")) ;

        url = url + paramStr;


        return new Promise((resolve, reject) => {
            request.get({
                url: url,
                json: true
            }, function(e, r, body) {
                // console.log(e,body);
                if (e) reject(e);
                resolve(body)
            })
        })
    }





}






