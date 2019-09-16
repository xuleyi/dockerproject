FROM python:3.6
RUN mkdir -p /app
ADD . /app
WORKDIR /app
EXPOSE 8888
ENTRYPOINT ["python", "server.py"]
