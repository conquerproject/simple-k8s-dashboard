FROM python:3.6-alpine as builder

WORKDIR /app

ADD ./requirements.txt . 

RUN pip install -r requirements.txt


#################################
FROM python:3.6-alpine

# Copy the Python site-packages from previous stage
COPY --from=builder /usr/local/lib/python3.6/site-packages/ /usr/local/lib/python3.6/site-packages/

WORKDIR /app

COPY . .

EXPOSE 8080

ENTRYPOINT ["python3", "app.py"]
