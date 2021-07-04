local rsp = [[{
    "status":200,
    "errmsg":"成功",
    "data":{
         "recordCount":2,
         "pageCount":2,
         "pageNum":1,
         "pageSize":10,
         "recordList":[
         {
             "id":186,
             "name":"文化长城",
             "code":"300089",
             "pinyin":"wen hua chang cheng",
             "market":2,
             "description":"所有创业板股票"
         },
         {
             "id":842,
             "name":"康龙化成",
             "code":"300759",
             "pinyin":"kang long hua cheng",
             "market":2,
             "description":"所有创业板股票"
         }]
    }
}]]
ngx.say(rsp)
