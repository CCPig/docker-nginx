local rsp=[[{
	"status":200,
	"errmsg": "成功", 
	"data": { 
		"total": 1809, 
		"page_num": 1,
		"page_size": 10,
		"size": 10,
		"start_row": 1,
		"end_row": 10,
		"pages": 181,
		"pre_page": 0,
		"next_page": 2,
		"is_first_page": true,
		"is_last_page": false,
		"has_previous_page": false,
		"has_next_page": true,
		"navigate_pages": 8,
		"navigatepage_nums": [1,2,3,4,5,6,7,8],
		"navigate_first_page": 1,
		"navigate_last_page": 8,
		"first_page": 1,
		"last_page": 8
	}
}]]
local json = require("json")
local result = json.decode(rsp)
result['data']['list'] = {}
local list={}
for i=1, 10
do
list[i] = {}
list[i]["code"]=ngx.var.arg_code 
list[i]["tratd_date"]="202106"..string.format("%02d",i)
list[i]["nav_unit"]=4444
list[i]["nav_adj"]=0
list[i]["nav_accumulated"]=1
end
result['data']['list']=list
ngx.say(json.encode(result))