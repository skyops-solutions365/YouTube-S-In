FROM python:3.10-slim

WORKDIR /app
COPY . /app

# Install system build dependencies (required for lightgbm, numpy, etc.)
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip (VERY IMPORTANT)
RUN python -m pip install --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
