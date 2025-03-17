FROM python:3.9-slim AS builder

WORKDIR /app
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY app/ .

# Set default environment variables (will be overridden at runtime)
ENV PYTHONUNBUFFERED=1
ARG AWS_ACCESS_KEY
ARG AWS_SECRET_KEY
ARG AWS_REGION="us-east-1"

EXPOSE 5001

CMD ["python", "app.py"]