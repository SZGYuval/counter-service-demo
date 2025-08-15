FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY python/counter_service.py ./counter_service.py

EXPOSE 80

CMD ["python", "counter_service.py"]
