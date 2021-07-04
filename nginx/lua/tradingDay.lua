local rsp=[[{
	"status": "OK",
	"message": "",
	"result": [	
		{
			"date": "20210210",
			"tradingDay": true
		},
		{
			"date": "20210211",
			"tradingDay": false 
		},
		{
			"date": "20210212",
			"tradingDay": false 
		},
		{
			"date": "20210213",
			"tradingDay": false 
		}
	]
}]]
ngx.say(rsp)
