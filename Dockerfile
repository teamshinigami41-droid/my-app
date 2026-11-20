FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    procps \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED=1 \
    GRANIAN_WORKERS=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

RUN reflex init && reflex export --frontend-only --no-zip

EXPOSE 10000

CMD ["reflex", "run", "--env", "prod", "--frontend-host", "0.0.0.0", "--frontend-port", "10000"]
