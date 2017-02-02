'use strict';

import Base from './base.js';
import moment from 'moment';

const utils_service = think.service("utils","home");

/**
 * 用户模块
 */
export default class extends Base {

    init(...args) {
        super.init(...args);
        this.utils_service = new utils_service();

    }

    /**
     * 登录接口：小程序无token条件下
     * 1、根据code去获取微信openid
     * 2、根据openid查询本地有没存储用户信息
     * 3、若有，则生成token，更新本地并返回给前端
     * 4、若无，则是新用户更，生成token，组装用户信息保存数据库，并返回token给前端
     *
     */
    async loginAction(){

        let nickname = this.get("nickname");
        let head_img = this.get("head_img");
        let code = this.get("code");

        let param = {};
        param.nickname = nickname;
        param.head_img = head_img;
        param.code = code;
        let result =  await this.utils_service.get_user_openid(param);
        let obj =   JSON.parse(result);
        let stored = await this.model("user").where({openid:obj.openid}).find();

        //若无，则是新用户更，生成token，组装用户信息保存数据库，并返回token给前端
        let token = think.uuid(128);
        if(think.isEmpty(stored)){

            let user = {};
            user.head_img = head_img;
            user.nickname = nickname;
            user.openid = obj.openid;
            user.create_time = moment().format();
            user.token = token;
            let raw = await this.model("user").add(user);
            think.log(raw)

        //若有，则生成token，更新本地并返回给前端
        }else{

          let update_raws =  await this.model("user").where({openid:obj.openid}).update({token:token})
            think.log(update_raws)
        }
        return this.success(token);

    }


    /**
     * 绑定手机号接口
     * @returns {Promise|void|think.PreventPromise}
     */
    async bindphoneAction(){

        let token = this.post("token");
        let phone = this.post("phone");
        let result = await this.model("user").where({token:token}).update({phone:phone})
        return this.success(result);


    }



}
