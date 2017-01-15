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
    async pageAction(page=1,size=5){

        page = this.get("page");
        size =this.get("size");

        think.log(page)
        think.log(size)
        let list =  await this.model("movie").page( page,size).order("show_time DESC").countSelect();
        return this.success(list)

    }


    /**
     *  电影名称搜索列表，返回10条数据,如果想更精确，就输入更多内容
     * @param size
     */
    async searchAction(){

        let size =this.get("size") || 10;
        let title = this.get("title");
        think.log(size)
        let resutl = await this.model("movie").where({title: ["like", "%"+title+"%"]}).order("show_time DESC").limit(size).select();
        return this.success(resutl);
    }



}