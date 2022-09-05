import asyncio
from this import s
from urllib import response
import telegram
import requests
import json
from robot.api import logger

def post_get_you_token (api_url, json_headers):
    response = requests.post(api_url, json_headers)
    print(json.dumps(response.json(), ensure_ascii=True))

def post_get_message_updates(api_url, json_payload, json_headers):
    response = requests.post(api_url, json_payload, json_headers)
    print(json.dumps(response.json(), ensure_ascii=True))
    
# coding: utf8
def post_send_message(api_url, json_payload, json_headers):
    send_message = requests.post(api_url, json_payload, json_headers)
    print(json.dumps(send_message.json(), ensure_ascii=True))



