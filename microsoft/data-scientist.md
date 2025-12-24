# Lộ Trình Data Scientist - Microsoft AI 2025

> Từ ML Engineer đến AI Specialist trên Azure

---

## Tổng Quan Lộ Trình

```
Foundation: Azure ML Basics
      |
      v
Core Skills: AutoML, MLOps
      |
      v
Advanced: Fine-tuning, LLMOps
      |
      v
Certification: DP-100
```

---

## Giai Đoạn 1: Azure ML Foundation

### Azure ML Studio

- [ ] Tạo Azure ML Workspace
- [ ] Hiểu giao diện Studio
- [ ] Setup Compute Instances
- [ ] Manage Datastores

### Tuần 1-2: Basic ML Pipeline

```python
# Azure ML v2 SDK
from azure.ai.ml import MLClient, command
from azure.identity import DefaultAzureCredential

# Connect to workspace
ml_client = MLClient(
    DefaultAzureCredential(),
    subscription_id,
    resource_group,
    workspace
)

# Create training job
job = command(
    code="./src",
    command="python train.py --epochs 10",
    environment="azureml:sklearn-env:1",
    compute="cpu-cluster"
)

ml_client.jobs.create_or_update(job)
```

---

## Giai Đoạn 2: AutoML & Experiments

### AutoML Tasks

| Task | Use Case |
|------|----------|
| Classification | Churn prediction |
| Regression | Price forecasting |
| Time Series | Demand prediction |
| NLP | Text classification |
| Vision | Image recognition |

### Thực hành:

- [ ] Train AutoML classification model
- [ ] Analyze model explanations
- [ ] Deploy best model
- [ ] Compare với manual training

---

## Giai Đoạn 3: MLOps

### ML Pipelines

```yaml
# Azure ML Pipeline YAML
$schema: https://azuremlschemas.azureedge.net/latest/pipelineJob.schema.json
type: pipeline

jobs:
  preprocess:
    type: command
    component: azureml:preprocess@latest

  train:
    type: command
    component: azureml:train@latest
    inputs:
      data: ${{parent.jobs.preprocess.outputs.data}}

  evaluate:
    type: command
    component: azureml:evaluate@latest
```

### MLOps Checklist:

- [ ] Version control models
- [ ] Automated training pipelines
- [ ] Model registry
- [ ] A/B testing
- [ ] Monitoring & alerts

---

## Giai Đoạn 4: Fine-tuning LLMs

### Options trên Azure

| Model | Method | Best For |
|-------|--------|----------|
| GPT-4o-mini | Azure fine-tuning | Custom tone/style |
| Phi-4 | Full fine-tune | On-device apps |
| Mistral | LoRA | Cost-effective |

### Fine-tuning GPT-4o-mini

```python
# Prepare training data
training_data = [
    {
        "messages": [
            {"role": "system", "content": "You are an expert..."},
            {"role": "user", "content": "Question here"},
            {"role": "assistant", "content": "Answer here"}
        ]
    }
    # More examples...
]

# Submit fine-tuning job via Azure portal or API
```

### Tasks:

- [ ] Prepare training dataset
- [ ] Fine-tune GPT-4o-mini
- [ ] Evaluate fine-tuned model
- [ ] Deploy và compare

---

## Giai Đoạn 5: LLMOps

### Prompt Flow for LLMOps

- [ ] Version control prompts
- [ ] A/B test prompts
- [ ] Evaluate với built-in metrics
- [ ] Deploy as managed endpoint

### Evaluation Metrics

| Metric | Description |
|--------|-------------|
| Groundedness | Factual accuracy |
| Relevance | Answer quality |
| Coherence | Logical flow |
| Fluency | Language quality |
| Similarity | Semantic matching |

---

## Giai Đoạn 6: Advanced Topics

### Responsible AI

- [ ] Implement content filters
- [ ] Analyze model fairness
- [ ] Setup safety monitoring
- [ ] Document model cards

### Vector Databases

- [ ] Azure AI Search vectors
- [ ] Embedding optimization
- [ ] Hybrid search strategies
- [ ] Chunking strategies

---

## Certification Path

```
DP-100: Azure Data Scientist Associate
           |
           v
AI-102: Azure AI Engineer (complementary)
           |
           v
AZ-305: Azure Solutions Architect (optional)
```

---

## Tài Nguyên

### Microsoft Learn

- [DP-100 Learning Path](https://learn.microsoft.com/certifications/azure-data-scientist/)
- [Azure ML Documentation](https://learn.microsoft.com/azure/machine-learning/)

### Hands-on

- [Azure ML Examples GitHub](https://github.com/Azure/azureml-examples)
- [Prompt Flow Samples](https://github.com/microsoft/promptflow)

---

**Xem thêm:**
- [Lộ trình Developer](developer.md)
- [Model Guide](models.md)
- [Full Roadmap](/microsoft-ai-learning-roadmap.md)
