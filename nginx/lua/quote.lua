local rsp =[[{
    "status":"OK",
    "message":"",
    "result":{
        "symbol":"601228",
        "baseDate":"20210615",
        "marketCd":"1",
        "marketCd":"1",
    	"DJ": "8029201.00",
    	"sellTotal": "114719.40000",
    	"sellPrice": "3.220",
    	"stockUD": "0.008",
    	"volumeRatio": "-15.7800",
    	"prevClose": "3.220",
    	"bestBidl": "3.210",
    	"originalPrevClose2": "3.22009",
    	"execPriceVolume": "0",
    	"bestBid2": "3.200",
    	"bestBid3": "3.190",
    	"amplitude": "9.62",
    	"high": "3.230",
    	"marketVal": "0.00",
    	"originalPrevClosel": "22000",
    	"bestBid4": "3.180",
    	"GAV1": "14260",
    	"bestBid5": "3.170",
    	"low": "3.210",
    	"GAVЗ": "973300",
    	"GAV2": "1037600",
    	"GAV5": "284800",
    	"datetimeCPP": "202106111181",
    	"quantityRatio": "0.0",
    	"GAV4 ": "447100",
    	"totalMarketVal": "0.00",
    	"commission": "-7865",
    	"GAP1": "3.220",
    	"symbolName": "广州港",
    	"calPresentPrice": "3.220"
    }
}]]
local json = require("json")
local dataTable=json.decode(rsp)
dataTable['result']['symbol'] = ngx.var.arg_symbol
dataTable['result']['marketCd'] = ngx.var.arg_marketCd

ngx.say(json.encode(dataTable))
