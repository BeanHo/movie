'use strict';

import Base from './base.js';

const rank_name = "rank";
const utils_service = think.service("utils","home");

export default class extends Base {



    init(...args) {
        super.init(...args);
        this.utils_service = new utils_service();

    }

  async  __before(){

        let data = {};
        data.city = "广州";
        data.province="广东";
        data.ip = '127.0.0.1';
        data.movie_id = "2";

        let result = await this.utils_service.save_data(data)

        think.log(result)

    }

  /**
   * index action
   * @return {Promise} []
   */
  indexAction(){
    //auto render template file index_index.html
    return this.success();
  }









  configAction(){

    console.info( think.config("app").appid );

    return this.success();
  }


 async dbAction(){


    let list = await this.model("cinema").select();

    return this.success(list);

  }


  successAction(){

    return this.success();
  }

  failAction(){

    return this.fail("查询条件不存在");
  }

}