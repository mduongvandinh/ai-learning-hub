# Lộ Trình ML Engineer - Google AI 2025

> Từ ML basics đến production với Google Cloud

---

## Tổng Quan Lộ Trình

```
Foundation: TensorFlow/JAX Basics
         |
         v
Core: Vertex AI Platform
         |
         v
Advanced: MLOps & AutoML
         |
         v
Certification: Professional ML Engineer
```

---

## Giai Đoạn 1: ML Frameworks

### TensorFlow 2.x

```python
import tensorflow as tf

# Simple model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(128, activation='relu'),
    tf.keras.layers.Dropout(0.2),
    tf.keras.layers.Dense(10, activation='softmax')
])

model.compile(
    optimizer='adam',
    loss='sparse_categorical_crossentropy',
    metrics=['accuracy']
)

model.fit(x_train, y_train, epochs=5)
```

### Keras 3.0 (Multi-backend)

```python
import os
os.environ["KERAS_BACKEND"] = "jax"  # or "tensorflow", "torch"

import keras

model = keras.Sequential([
    keras.layers.Dense(128, activation='relu'),
    keras.layers.Dense(10, activation='softmax')
])
```

### JAX (Advanced)

```python
import jax
import jax.numpy as jnp
from flax import linen as nn

class MLP(nn.Module):
    @nn.compact
    def __call__(self, x):
        x = nn.Dense(128)(x)
        x = nn.relu(x)
        x = nn.Dense(10)(x)
        return x
```

### Tasks:

- [ ] Master TensorFlow 2.x
- [ ] Học Keras 3.0 multi-backend
- [ ] Thử nghiệm JAX basics
- [ ] Build image classifier

---

## Giai Đoạn 2: Vertex AI Platform

### Core Components

```
┌─────────────────────────────────────────────────────────────────┐
│                        VERTEX AI                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │   Datasets   │  │   Training   │  │   Models     │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Pipelines   │  │  Endpoints   │  │ Experiments  │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │   Feature    │  │   Model      │  │  Metadata    │          │
│  │   Store      │  │   Registry   │  │   Store      │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Vertex AI Training

```python
from google.cloud import aiplatform

aiplatform.init(project="your-project", location="us-central1")

# Custom training job
job = aiplatform.CustomTrainingJob(
    display_name="my-training-job",
    script_path="trainer/task.py",
    container_uri="gcr.io/cloud-aiplatform/training/tf-cpu:latest",
    requirements=["tensorflow==2.14"]
)

model = job.run(
    machine_type="n1-standard-4",
    accelerator_type="NVIDIA_TESLA_T4",
    accelerator_count=1
)
```

### Tasks:

- [ ] Setup Vertex AI project
- [ ] Create managed dataset
- [ ] Run custom training job
- [ ] Deploy model endpoint

---

## Giai Đoạn 3: AutoML

### AutoML Tables

```python
# AutoML for tabular data
dataset = aiplatform.TabularDataset.create(
    display_name="my-dataset",
    gcs_source="gs://bucket/data.csv"
)

job = aiplatform.AutoMLTabularTrainingJob(
    display_name="automl-training",
    optimization_prediction_type="classification"
)

model = job.run(
    dataset=dataset,
    target_column="label",
    training_fraction_split=0.8
)
```

### AutoML Options

| Type | Use Case |
|------|----------|
| AutoML Tables | Tabular data |
| AutoML Vision | Image classification |
| AutoML Video | Video analysis |
| AutoML Text | NLP tasks |

### Tasks:

- [ ] Train AutoML model
- [ ] Analyze feature importance
- [ ] Deploy và evaluate
- [ ] Compare vs custom model

---

## Giai Đoạn 4: MLOps

### Vertex AI Pipelines

```python
from kfp import dsl
from kfp.v2 import compiler
from google.cloud import aiplatform

@dsl.component
def preprocess_data(input_data: str) -> str:
    # Preprocessing logic
    return processed_data

@dsl.component
def train_model(data: str) -> str:
    # Training logic
    return model_path

@dsl.pipeline(name="my-pipeline")
def my_pipeline():
    preprocess_task = preprocess_data(input_data="gs://...")
    train_task = train_model(data=preprocess_task.output)

# Compile and run
compiler.Compiler().compile(my_pipeline, "pipeline.json")
aiplatform.PipelineJob(
    display_name="my-pipeline",
    template_path="pipeline.json"
).run()
```

### MLOps Checklist:

- [ ] Version control code & data
- [ ] Automated training pipelines
- [ ] Model registry
- [ ] Continuous training
- [ ] Model monitoring
- [ ] A/B testing endpoints

---

## Giai Đoạn 5: Fine-tuning LLMs

### Vertex AI Fine-tuning

```python
# Fine-tune Gemini
from vertexai.tuning import sft

tuning_job = sft.train(
    source_model="gemini-1.5-flash",
    train_dataset="gs://bucket/train.jsonl",
    validation_dataset="gs://bucket/val.jsonl",
    epochs=3,
    learning_rate_multiplier=1.0
)

# Wait for completion
tuning_job.refresh()
```

### Fine-tuning Options

| Model | Method | Best For |
|-------|--------|----------|
| Gemini | Supervised | Custom tasks |
| Gemma | Full fine-tune | Open source |
| PaLM 2 | Tuning API | Legacy |

---

## Giai Đoạn 6: Advanced Topics

### Feature Store

```python
# Create feature store
feature_store = aiplatform.FeatureStore.create(
    featurestore_id="my-feature-store"
)

# Create entity type
entity_type = feature_store.create_entity_type(
    entity_type_id="users"
)

# Create feature
feature = entity_type.create_feature(
    feature_id="age",
    value_type="INT64"
)
```

### Model Monitoring

```python
# Setup monitoring
model_monitoring_job = aiplatform.ModelDeploymentMonitoringJob.create(
    display_name="my-monitoring",
    endpoint=endpoint,
    logging_sampling_strategy={...},
    alert_config={...}
)
```

---

## Certification

### Professional ML Engineer

```
Topics:
1. ML Problem Framing (15%)
2. ML Solution Architecture (20%)
3. Data Preparation (20%)
4. Model Development (20%)
5. ML Pipeline Automation (15%)
6. Solution Monitoring (10%)
```

### Study Path

| Week | Focus |
|------|-------|
| 1-2 | ML fundamentals |
| 3-4 | Vertex AI hands-on |
| 5-6 | MLOps practices |
| 7-8 | Mock exams & review |

---

## Resources

### Official

- [Vertex AI Documentation](https://cloud.google.com/vertex-ai/docs)
- [Cloud Skills Boost](https://www.cloudskillsboost.google/)
- [Google ML Crash Course](https://developers.google.com/machine-learning/crash-course)

### Hands-on

- Google Colab (free GPU)
- Kaggle (free TPU)
- Vertex AI Workbench

---

**Xem thêm:**
- [Lộ trình Developer](developer.md)
- [Model Guide](models.md)
- [Full Roadmap](/google-ai-learning-roadmap.md)
