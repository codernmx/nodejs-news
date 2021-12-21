const fs = require('fs')

module.exports = {
    //封装文件操作
    read: (url) => {
        return new Promise((resolve, reject) => {
            fs.readFile(url, (err, data) => {
                if(!err) {
                    resolve(data)
                } else {
                    console.log(err);
                    reject(err)
                }
            })
        })
    }
}