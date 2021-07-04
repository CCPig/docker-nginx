function Split(szFullString, szSeparator)
local nFindStartIndex = 1
local nSplitIndex = 1
local nSplitArray = {}
while true do
   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
   if not nFindLastIndex then
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
    break
   end
   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
   nSplitIndex = nSplitIndex + 1
end
return nSplitArray
end
--ngx.print("hello world")
local arg=ngx.var.arg_stockCodes
--local arg="hello world"
local stockList = Split(arg,",")
local result = {}
local data = {}
for i=1,#stockList
do
    data[i] = {}
    local array = {}
    array[1] = {}
    array[1]["code"] = stockList[i]
    array[1]["name"] = "银行"
    data[i]["dataList"]= array
end
result["status"] = 200
result["errmsg"] = "成功"
result["data"] = data
--print(result)
local json = require('json')
local result = json.encode(result)
return result
