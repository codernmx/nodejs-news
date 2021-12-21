const {db} = require('../db')
const crypto = require('crypto')
//用户模块的数据持久化操作


const user = {
    //根据手机号获取用户信息
    getUserByPhone: async (phone) => {
        const sql = 'select id, phone, password, nickname,head_img, personal_sign, level_id from t_user where phone = ? and is_del = 0';
        return await db(sql, [phone])
    },
    //用户登录
    login: async json => {
        const users = await user.getUserByPhone(json.phone);
        if(users.length > 0) {
            const u = users[0]  
            let enpwd = crypto.createHash('md5').update(json.password + json.phone).digest('hex');
            if(u.password === enpwd) {
                return await u;
            }
        }
        return await null;
    },
    //添加用户信息
    add: async (user) => {
        ///{name: '', phone: '', password: ''}
        const sql = 'insert into t_user set ?'
        return await db(sql, user)
    },
    //更新用户信息
    update: async (arr) => {
        //[user, id] ==> [{nickname: '', age:''}, id]
        const sql = "update t_user set ? where id=?"
        return await db(sql, arr)
    },
    //删除用户信息
    del: (id) => {
        //删除用户信息正常情况下不会真实的删除数据，都是通过伪删除操作
        //处理this指向问题
        return user.update([{is_del: 1}, id])
    },
    // 获取所有用户信息
    getAll: async ()=> {
        const sql = 'select id, phone, password, nickname,head_img, personal_sign, level_id from t_user where is_del = 0'
        return await db(sql)
    }
}
module.exports = user