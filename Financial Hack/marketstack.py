# MARKETSTACK_KEY

# imports
import os
import requests
import json

API_KEY = os.environ.get("MARKETSATCK_KEY")
BASE_URL = 'http://api.marketstack.com/v1/'

def get_stock_price(stock_symbol):
    params = {
        'access_key': API_KEY
    }
    end_point = ''.join([BASE_URL, "/tickers/", stock_symbol, "/intraday/latest"])
    api_result = requests.get(end_point, params)
    json_result = json.loads(api_result.text)
    return {
        "last_price": json_result["last"]
    }