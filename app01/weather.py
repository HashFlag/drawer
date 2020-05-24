import json, urllib
from urllib.parse import urlencode
import urllib.request


# 根据城市查询天气
def request1(appkey, m="GET"):
    url = "http://op.juhe.cn/onebox/weather/query"
    params = {
        "cityname": "吉林",  # 要查询的城市，如：温州、上海、北京
        "key": appkey,  # 应用APPKEY(应用详细页查询)
        "dtype": "json",  # 返回数据的格式,xml或json，默认json

    }
    params = urlencode(params)
    if m == "GET":
        f = urllib.request.urlopen("%s?%s" % (url, params))
    else:
        f = urllib.request.urlopen(url, params)

    content = f.read()
    res = json.loads(content)
    if res:
        error_code = res["error_code"]
        if error_code == 0:
            # 成功请求
            # print(res["result"])
            return res["result"]
        else:
            # print("%s:%s" % (res["error_code"], res["reason"]))
            return "%s:%s" % (res["error_code"], res["reason"])
    else:
        # print("request api error")
        return "request api error"
