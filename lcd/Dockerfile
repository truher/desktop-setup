FROM python:3.9.1-slim-buster

##RUN useradd -ms /bin/bash lcd
##USER lcd
## example uses a different one but does it matter?
##WORKDIR /home/lcd
WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY src/ .

EXPOSE 8000

CMD [ "python", "./server.py" ]
