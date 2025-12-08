FROM python:3.13.10-slim-bookworm

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        python3-dev \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .    

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE  5000

CMD [ "flask", "run" ]