FROM 933375035704.dkr.ecr.us-east-1.amazonaws.com/python:3.8.0-alpine

RUN pip install fastapi uvicorn jinja2 aiofiles

EXPOSE 8090

COPY ./files /app

WORKDIR /app

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8090"]
