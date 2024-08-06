# FastAPI auto-instrumentation not working with newer version

@see https://github.com/open-telemetry/opentelemetry-python-contrib/issues/2683#issuecomment-2270703659

```
(venv) smoke@rkirilov-work-pc ~/fastapi-autoinstrumentation-fails $ python -m venv ./venv && source ./venv/bin/activate

# reproduce the bug with newer version
(venv) smoke@rkirilov-work-pc ~/fastapi-autoinstrumentation-fails $ pip install -r requirements.txt &>/dev/null || echo "failed, run and check output" # skip output for clarity
(venv) smoke@rkirilov-work-pc ~/fastapi-autoinstrumentation-fails $ ./run.sh 
DEBUG:root:FastAPI is instrumented: False

# no bug with older version
(venv) smoke@rkirilov-work-pc ~/fastapi-autoinstrumentation-fails $ pip install -r requirements_before_bug.txt &>/dev/null || echo "failed, run and check output" # skip output for clarity
(venv) smoke@rkirilov-work-pc ~/fastapi-autoinstrumentation-fails $ ./run.sh 
DEBUG:root:FastAPI is instrumented: True
```

# Workaround

Explicitly instrument the app
```
...
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
...

app = FastAPI()

# Explicitly Instrument FastAPI
# TODO: Remove explict instrumentation once the following issue
#  is resolved https://github.com/open-telemetry/opentelemetry-python-contrib/issues/2683#issuecomment-2270740406
#  can be recognized when WARN `Attempting to instrument FastAPI app while already instrumented` starts showing
FastAPIInstrumentor.instrument_app(app)
...
```
