import logging

from fastapi import FastAPI
from opentelemetry.instrumentation.fastapi import _InstrumentedFastAPI

logging.basicConfig(level=logging.DEBUG)

logging.debug('FastAPI is instrumented: %s', FastAPI is _InstrumentedFastAPI)

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}
