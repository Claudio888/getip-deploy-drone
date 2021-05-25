import socket
from fastapi import FastAPI
from starlette.requests import Request
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles



app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")


templates = Jinja2Templates(directory="templates/")


@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    ip = request.client.host
    return templates.TemplateResponse("index.html",context={'request': request, "ip": ip})