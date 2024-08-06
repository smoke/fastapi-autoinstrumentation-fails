export \
OTEL_LOG_LEVEL=DEBUG \
OTEL_PYTHON_LOG_LEVEL=DEBUG \
OTEL_TRACES_EXPORTER=console \
OTEL_METRICS_EXPORTER=none \
OTEL_LOGS_EXPORTER=none \
OTEL_RESOURCE_ATTRIBUTES=deployment.environment=local \
OTEL_SERVICE_NAME=fastapi-example-otel;

opentelemetry-instrument python main.py
