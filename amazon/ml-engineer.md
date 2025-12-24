# Lộ Trình ML Engineer - Amazon AI 2025

> Từ ML basics đến production với AWS

---

## Tổng Quan Lộ Trình

```
Foundation: SageMaker Basics
         |
         v
Core: Training & Deployment
         |
         v
Advanced: MLOps & Fine-tuning
         |
         v
Certification: ML Specialty
```

---

## Giai Đoạn 1: SageMaker Foundation

### SageMaker Components

```
┌─────────────────────────────────────────────────────────────────┐
│                    AMAZON SAGEMAKER                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │   Studio     │  │  JumpStart   │  │   Autopilot  │          │
│  │  (Unified)   │  │  (Models)    │  │   (AutoML)   │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │   Training   │  │  Endpoints   │  │  Pipelines   │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Feature     │  │   Model      │  │  Experiments │          │
│  │   Store      │  │   Registry   │  │              │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### SageMaker Unified Studio

- [ ] Tạo SageMaker domain
- [ ] Setup Studio
- [ ] Explore JumpStart models
- [ ] Create first notebook

---

## Giai Đoạn 2: Training Jobs

### Built-in Algorithms

```python
from sagemaker.estimator import Estimator

estimator = Estimator(
    image_uri=sagemaker.image_uris.retrieve(
        framework='xgboost',
        region='us-east-1',
        version='1.5-1'
    ),
    role=role,
    instance_count=1,
    instance_type='ml.m5.xlarge',
    output_path=f's3://{bucket}/output'
)

estimator.fit({'train': train_data})
```

### Custom Training

```python
from sagemaker.pytorch import PyTorch

pytorch_estimator = PyTorch(
    entry_point='train.py',
    source_dir='./src',
    role=role,
    framework_version='2.0.0',
    py_version='py310',
    instance_count=1,
    instance_type='ml.g4dn.xlarge',
    hyperparameters={
        'epochs': 10,
        'batch-size': 32
    }
)

pytorch_estimator.fit({'training': train_data})
```

### Tasks:

- [ ] Train XGBoost model
- [ ] Run custom training
- [ ] Use spot instances
- [ ] Distribute training

---

## Giai Đoạn 3: Model Deployment

### Real-time Inference

```python
from sagemaker.predictor import Predictor

predictor = estimator.deploy(
    initial_instance_count=1,
    instance_type='ml.m5.large'
)

result = predictor.predict(data)
```

### Serverless Inference

```python
from sagemaker.serverless import ServerlessInferenceConfig

serverless_config = ServerlessInferenceConfig(
    memory_size_in_mb=2048,
    max_concurrency=5
)

predictor = model.deploy(
    serverless_inference_config=serverless_config
)
```

### Deployment Options

| Type | Best For |
|------|----------|
| Real-time | Low latency |
| Serverless | Variable traffic |
| Batch | Large datasets |
| Async | Long processing |

---

## Giai Đoạn 4: Autopilot (AutoML)

### Create AutoML Job

```python
import sagemaker

automl = sagemaker.AutoML(
    role=role,
    target_attribute_name='target',
    sagemaker_session=session
)

automl.fit(
    inputs='s3://bucket/train.csv',
    job_name='my-automl-job'
)

# Get best candidate
best = automl.describe_auto_ml_job()['BestCandidate']
```

### AutoML Modes

| Mode | Description |
|------|-------------|
| Ensemble | Multiple models |
| HPO | Hyperparameter tuning |
| Auto | Let SageMaker decide |

---

## Giai Đoạn 5: JumpStart & Fine-tuning

### Deploy from JumpStart

```python
from sagemaker.jumpstart.model import JumpStartModel

model = JumpStartModel(model_id="huggingface-llm-llama-3-2-1b")
predictor = model.deploy()
```

### Fine-tune Foundation Models

```python
from sagemaker.jumpstart.estimator import JumpStartEstimator

estimator = JumpStartEstimator(
    model_id="huggingface-llm-llama-3-2-1b",
    hyperparameters={
        "epochs": "3",
        "per_device_train_batch_size": "4"
    }
)

estimator.fit({"training": train_data})
```

### Tasks:

- [ ] Deploy JumpStart model
- [ ] Fine-tune Llama
- [ ] Compare fine-tuned vs base
- [ ] Deploy fine-tuned model

---

## Giai Đoạn 6: MLOps

### SageMaker Pipelines

```python
from sagemaker.workflow.pipeline import Pipeline
from sagemaker.workflow.steps import TrainingStep, ProcessingStep

# Define steps
processing_step = ProcessingStep(...)
training_step = TrainingStep(...)

# Create pipeline
pipeline = Pipeline(
    name="my-ml-pipeline",
    steps=[processing_step, training_step]
)

pipeline.upsert(role_arn=role)
pipeline.start()
```

### Model Registry

```python
from sagemaker.model_registry import ModelPackage

model_package = ModelPackage(
    model_package_arn="arn:aws:sagemaker:..."
)

# Approve model
model_package.approve()
```

### MLOps Checklist:

- [ ] Version control code
- [ ] Automated pipelines
- [ ] Model registry
- [ ] A/B testing
- [ ] Model monitoring
- [ ] Automated retraining

---

## Giai Đoạn 7: Advanced Topics

### Feature Store

```python
from sagemaker.feature_store.feature_group import FeatureGroup

feature_group = FeatureGroup(
    name='my-features',
    sagemaker_session=session
)

feature_group.create(
    s3_uri=f's3://{bucket}/feature-store/',
    record_identifier_name='id',
    event_time_feature_name='timestamp'
)
```

### Model Monitor

```python
from sagemaker.model_monitor import ModelMonitor

monitor = ModelMonitor(
    role=role,
    instance_count=1,
    instance_type='ml.m5.xlarge'
)

monitor.create_monitoring_schedule(
    endpoint_input=endpoint_name,
    schedule_cron_expression='cron(0 * ? * * *)'
)
```

---

## Hardware Options

### Compute Types

| Type | Use Case | Cost |
|------|----------|------|
| ml.m5 | General | Medium |
| ml.c5 | Compute | Medium |
| ml.g4dn | GPU training | Higher |
| ml.p4d | Large models | Highest |
| ml.inf2 | Inference | Lower |
| ml.trn1 | Trainium | Cost-effective |

### Cost Optimization

- [ ] Use Spot Instances (70% savings)
- [ ] Right-size instances
- [ ] Serverless for variable load
- [ ] Trainium for training

---

## Certification

### ML Specialty

```
Domains:
1. Data Engineering (20%)
2. Exploratory Data Analysis (24%)
3. Modeling (36%)
4. ML Implementation & Operations (20%)
```

### Study Plan

| Week | Focus |
|------|-------|
| 1-2 | Data engineering |
| 3-4 | EDA & feature engineering |
| 5-8 | Modeling & algorithms |
| 9-10 | MLOps & deployment |
| 11-12 | Mock exams & review |

---

## Resources

### Official

- [SageMaker Developer Guide](https://docs.aws.amazon.com/sagemaker/)
- [AWS Skill Builder](https://skillbuilder.aws/)
- [ML Specialty Guide](https://aws.amazon.com/certification/certified-machine-learning-specialty/)

### Hands-on

- SageMaker Studio Lab (free)
- AWS Free Tier
- Workshops (workshops.aws)

---

**Xem thêm:**
- [Lộ trình Developer](developer.md)
- [Model Guide](models.md)
- [Full Roadmap](/amazon-ai-learning-roadmap.md)
