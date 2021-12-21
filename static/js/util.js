/**
 * 
 * @param {*} options {type: post, contentType..} 
 */
const request = (options) => {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: options.url,
            type: options.type ? options.type: 'get',
            contentType: 'application/json',
            data: options.data,
            success: (res) => {
                console.log("res:" , res);
                if(res.code === 2000) {
                    resolve(res) 
                } else if(res.code === 5010) {
                    location.href = "/toLogin"
                } else {
                    layer.msg(res.msg);
                }
            }
        })
    })
}