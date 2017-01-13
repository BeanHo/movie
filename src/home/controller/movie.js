'use strict';

import Base from './base.js';

/**
 * 电影模块
 */
export default class extends Base {


    
    /**
     *  电影列表 分页
     * @param page 当前页
     * @param page_size 每页显示大小
     * @returns {接口数据}
     */
    async pageAction(){

        let page = this.get("page") || 0;
        let size =this.get("size") || 5;

        think.log(page)
        think.log(size)
        let list =  await this.model("movie").page( page,size).order("show_time DESC").countSelect();
        return this.success(list)

    }


}