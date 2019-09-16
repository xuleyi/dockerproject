# Alpine base image that contains python 3.7
FROM python:3.7-alpine
#FROM busybox
# define the directory to work in
#RUN apk add --update bash && rm -rf /var/cashe/apk/*
WORKDIR /code




COPY nsen2.py .
#COPY nrec2.py .
#COPY log.sh .

CMD ["python","nsen2.py"]
#CMD ["sh", "log.sh"]
