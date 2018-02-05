#!/usr/bin/env python

import requests

proxies = {
    'http':'http://127.0.0.1:8888',
    'https':'http://127.0.0.1:8888'
}

r = requests.get('http://google.com', proxies=proxies)

if r.status_code == requests.codes.ok:
    print("Successfully downloaded google index page!")
elif r.status_code == 407:
    print("Failed to reach google, hitting some form of authenticated proxy.")
    print("----------")
    print("r.text")
    print("----------")
else:
    print("Failed to reach google, non-200 HTTP status code is {}".format(r.status_code))



