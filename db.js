const mysql = require('mysql')

const config = {
    database: 'blog',
    user: 'root',
    password: '137928'
}

// [], {}, [{}, id]
exports.db = (sql, sqlParams) => {
    sqlParams = sqlParams || []
    // sqlParams = sqlParams == null ? [] : sqlParams
    return new Promise((resolve, reject) => {
        const pool = mysql.createPool(config)
        pool.getConnection((err, conn) => {
            if (!err) {
                conn.query(sql, sqlParams, (e, results) => {
                    if (!e) {
                        // console.log(results)
                        resolve(results)
                        conn.destroy() 
                    } else {
                        console.log("sql:", e)
                        reject(e)
                    }
                })
            } else {
                console.log("conn err:", err)
                reject(err)
            }
           
        })
    })
}


