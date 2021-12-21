const express = require('express')
const util = require('./util')
const user = require('./manage/user')
const blog = require('./manage/blog')
const querystring = require('querystring');
const crypto = require('crypto')
const app = express()
const path = require('path')
const cookieSession = require('cookie-session')
const { db } = require('./db')


//设置静态资源路径
app.use('/static', express.static(__dirname + '/static'));
//引入ejs
app.engine('.html', require('ejs').__express);
//设置具体的路由
app.set('views', path.join(__dirname, 'pages'));
app.set('view engine', 'html');
app.use(cookieSession({
    name: 'session',
    secret: 'user',
    maxAge: 24 * 60 * 60 * 1000
}))

/**
 * 1:负责页面跳转
 * 2：负责业务数据处理
 */

//发送get请求
app.get('/', (req, resp) => {
    const type = req.query.type
    console.log(type)
    let sql = ''
    if (type) {
        sql = `select * from t_blog where blog_type = ${type}`
    } else {
        sql = `select * from t_blog`
    }
    const typeStr = type == undefined ? '热点' : type == 1 ? '军事' : type == 2 ? '科技' : type == 3 ? '体育' : type == 4 ? '娱乐' : '教育'
    db(sql).then(res => {
        const data = res
        resp.render('index', {
            title: "系统首页",
            type: typeStr,
            data
        })
    })
})

//跳转到详情页面
app.get('/detail', (req, resp) => {
    const sql = `select * from t_blog where id =${req.query.id}`
    db(sql).then(res => {
        const data = res[0]
        resp.render('detail', {
            title: data.blog_title,
            authour: data.user,
            content: data.blog_content,
        })
    })


})
//文章管理
app.get('/admin', (req, resp) => {
    const type = req.query.type
    const title = req.query.title
    console.log(type, title)
    let sql = ''
    if (type) {
        sql = `select * from t_blog where blog_type = '${type}'`
    } else if (title) {
        sql = `select * from t_blog where blog_title = '${title}'`
    } else {
        sql = `select * from t_blog`
    }
    db(sql).then(res => {
        const data = res
        resp.render('admin', {
            title: "后台管理页面",
            data
        })
    })


})
//添加文章
app.get('/add-blog', (req, resp) => {
    // const data = await util.read('pages/login.html')
    // resp.end(data);
    resp.render('add-blog', {
        title: "添加文章"
    })
})
//修改文章
app.get('/edit', (req, resp) => {
    const id = req.query.id

    let sql = `select * from t_blog where id ='${id}'`
    db(sql).then(res => {
        const data = res[0]
        resp.render('edit-blog', {
            title: "修改信息",
            data
        })
    })
})

//跳转到登录页面
app.get('/toLogin', (req, resp) => {
    // const data = await util.read('pages/login.html')
    // resp.end(data);
    resp.render('login', {
        title: "系统登录"
    })
})
//跳转到注册页面
app.get('/toRegister', (req, resp) => {
    resp.render('register', {
        title: "系统注册"
    })
})
//跳转到个人中心
app.get('/userInfo', (req, resp) => {
    resp.render("user-info", {
        title: "系统个人中心"
    })
})


class Resp {
    constructor(code, msg, data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
    static success(data) {
        return new Resp(2000, "请求成功", data);
    }
    static error(msg) {
        msg = msg ? msg : "请求失败";
        return new Resp(5000, msg, null);
    }
    static nologin() {
        return new Resp(5010, "用户未登录", null);
    }
}

// -----------------------业务----------------------------
// 新增新闻
app.post('/addBlog', (req, resp) => {
    // console.log(req.body)
    let body = ''
    req.on('data', (chunk) => {
        body += chunk;
    })
    req.on('end', function () {
        // 解析参数
        body = querystring.parse(body);
        console.log(body.type)
        const title = body.title
        const type = body.type
        const content = body.content

        //执行sql
        let sql1 = `INSERT INTO t_blog ( user, blog_type, blog_title, blog_content) VALUES ('admin','${type}','${title}', '${content}')`
        // 成功的话   
        db(sql1).then(resule => {
            let sql = `select * from t_blog`
            db(sql).then(res => {
                const data = res
                resp.render('index', {
                    title: "系统首页",
                    type: '热点',
                    data
                })
            })
        })

    })
})
// 修改新闻
app.post('/editBlog', (req, resp) => {
    // console.log(req.body)
    let body = ''
    req.on('data', (chunk) => {
        body += chunk;
    })
    req.on('end', function () {
        // 解析参数
        body = querystring.parse(body);
        console.log(body.type)
        const title = body.title
        const type = body.type
        const content = body.content
        const id = body.id

        //执行sql
        let sql1 = `UPDATE t_blog set blog_type='${type}',blog_title='${title}', blog_content='${content}' where id = '${id}'`
        // 成功的话   
        db(sql1).then(resule => {
            let sql = `select * from t_blog`
            db(sql).then(res => {
                const data = res
                resp.render('admin', {
                    title: "系统首页",
                    type: '热点',
                    data
                })
            })
        })

    })
})
//判断用户信息是否已经存在
app.get('/user/getUserByPhone', async (req, resp) => {
    //调用该方法返回数据库数据
    const use = await user.getUserByPhone(req.query.phone)
    if (use.length > 0) {
        resp.send(Resp.error("用户已存在"))
    } else {
        resp.send(Resp.success(null))
    }

})

//获取验证码
app.get('/getCode', (req, resp) => {
    let code = Math.floor(Math.random() * 10000);
    req.session.code = code
    console.log("code", code);
    resp.send(Resp.success(null))
})
//删除文章
app.post('/deleteArticle', (req, resp) => {
    let body = ''
    req.on('data', (chunk) => {
        body += chunk;
    })
    req.on('end', function () {
        // 解析参数
        body = querystring.parse(body);
        console.log(body)
        let sql = `delete from t_blog where id = '${body.id}'`
        db(sql).then(res => {
            //请求成功
            console.log('删除成功！')
            resp.send(Resp.success())
        })

    })
})

//注册
app.post('/register', (req, resp) => {
    let json = null;
    req.on('data', (chunk) => {
        const str = Buffer.from(chunk).toString()
        json = JSON.parse(str)
    })
    req.on('end', async () => {
        if (json.code != req.session.code) {
            resp.send(Resp.error("验证码错误"))
        } else {
            let password = crypto.createHash('md5').update(json.password + json.phone).digest('hex');
            let d = { phone: json.phone, password }
            let u = await user.add(d)
            console.log(u);
            if (u.affectedRows > 0) {
                resp.send(Resp.success())
            } else {
                resp.send(Resp.error("服务器错误，请稍后再试"))
            }
        }
    })
})

//登录
app.post('/login', (req, resp) => {
    let json = null;
    req.on('data', (chunk) => {
        const str = Buffer.from(chunk).toString()
        json = JSON.parse(str)
    })
    req.on('end', async () => {
        // console.log("json:" , json);
        const u = await user.login(json);
        console.log(u, 'uuuuuuuu')
        if (u != null) {
            req.session.userId = u.id
            resp.send(Resp.success(u))

            //登陆成功之后的页面跳转
            // resp.render('user-info', {
            //     title: "用户中心"
            // })
        } else {
            // resp.send({code: 5000, msg: "用户名或密码错误", data: null})
            resp.send(Resp.error("用户名或密码错误"))
        }
    })
})
// app.get('/login1', (req, resp) => {
//     console.log(req.session.userId);
//     resp.send(req.session.userId)
// })
//affectedRows
app.get('/addUser', (req, resp) => {
    user.del('15')
        .then(res => {
            console.log(res)
        })
})


//监听服务端端口
app.listen(3000, () => {
    console.log("server is start");
})