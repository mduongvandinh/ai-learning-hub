# Lộ Trình Architect - Google AI 2025

> Thiết kế và triển khai AI systems trên Google Cloud

---

## Tổng Quan Lộ Trình

```
Foundation: GCP AI Services Overview
             |
             v
Design: AI Architecture Patterns
             |
             v
Security: Enterprise Security
             |
             v
Scale: Production & Optimization
             |
             v
Certifications: Professional Cloud Architect + ML Engineer
```

---

## Giai Đoạn 1: GCP AI Architecture

### AI Services Landscape

```
┌─────────────────────────────────────────────────────────────────┐
│                       GOOGLE CLOUD AI                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────────────────────────────────────────────┐      │
│  │                    VERTEX AI                          │      │
│  │  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐     │      │
│  │  │ Gemini │  │ Model  │  │ Agent  │  │ Search │     │      │
│  │  │  API   │  │ Garden │  │ Builder│  │        │     │      │
│  │  └────────┘  └────────┘  └────────┘  └────────┘     │      │
│  └──────────────────────────────────────────────────────┘      │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │ Vision AI    │  │ Speech AI    │  │ Language AI  │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │ Translation  │  │ Document AI  │  │ Video AI     │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Tasks:

- [ ] Master GCP AI service catalog
- [ ] Hiểu pricing models
- [ ] Regional availability
- [ ] Quotas và limits

---

## Giai Đoạn 2: Architecture Patterns

### RAG Architecture on GCP

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Client    │───▶│  Cloud Run  │───▶│  Vertex AI  │
│             │    │   API       │    │   Gemini    │
└─────────────┘    └──────┬──────┘    └──────┬──────┘
                          │                   │
                          ▼                   ▼
                   ┌─────────────┐    ┌─────────────┐
                   │ Vertex AI   │    │  Firestore  │
                   │   Search    │    │  (Context)  │
                   └─────────────┘    └─────────────┘
```

### Agent Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    VERTEX AI AGENT BUILDER                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌───────────────────────────────────────────────────────┐     │
│  │                     Orchestration                      │     │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐  │     │
│  │  │ Intent  │─▶│ Context │─▶│ Action  │─▶│Response │  │     │
│  │  │ Detect  │  │ Gather  │  │ Execute │  │ Format  │  │     │
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────┘  │     │
│  └───────────────────────────────────────────────────────┘     │
│                                                                 │
│  Grounding: Vertex Search, Cloud SQL, BigQuery, APIs           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Multi-model Strategy

```python
# Model routing pattern
def select_model(query: str, requirements: dict) -> str:
    if requirements.get("vision"):
        return "gemini-1.5-pro-vision"
    elif requirements.get("long_context"):
        return "gemini-1.5-pro"  # 2M tokens
    elif requirements.get("speed"):
        return "gemini-1.5-flash"
    elif requirements.get("open_source"):
        return "gemma-2-27b"
    else:
        return "gemini-1.5-flash"  # default
```

---

## Giai Đoạn 3: Enterprise Security

### Security Layers

| Layer | GCP Implementation |
|-------|-------------------|
| Network | VPC, Private Google Access |
| Identity | IAM, Workload Identity |
| Data | CMEK, DLP |
| Application | API Gateway, Cloud Armor |

### Security Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     SECURITY PERIMETER                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │   Cloud     │  │  Identity   │  │  Security   │             │
│  │   Armor     │  │  Platform   │  │  Command    │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
│                                                                 │
│  ┌─────────────────────────────────────────────────┐           │
│  │              VPC Service Controls               │           │
│  └─────────────────────────────────────────────────┘           │
│                                                                 │
│        ┌─────────────────────────────────┐                     │
│        │          Vertex AI              │                     │
│        │   (Private Endpoints)           │                     │
│        └─────────────────────────────────┘                     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Security Checklist:

- [ ] VPC Service Controls
- [ ] Private Service Connect
- [ ] IAM least privilege
- [ ] CMEK for data encryption
- [ ] Audit logging
- [ ] DLP policies

---

## Giai Đoạn 4: Cost Optimization

### Cost Strategies

| Strategy | Impact |
|----------|--------|
| Use Flash models | 60-80% savings |
| Committed use discounts | 20-30% |
| Batch processing | 50% |
| Response caching | 40-60% |
| Shorter prompts | Variable |

### Cost Monitoring

```python
# Setup budget alerts
from google.cloud import billing_budgets

budget = billing_budgets.Budget(
    display_name="AI-Budget",
    amount={"specified_amount": {"currency_code": "USD", "units": 1000}},
    threshold_rules=[
        {"threshold_percent": 0.5},
        {"threshold_percent": 0.9},
        {"threshold_percent": 1.0}
    ]
)
```

---

## Giai Đoạn 5: Production Patterns

### High Availability

```
┌─────────────────────────────────────────────────────────────────┐
│                    GLOBAL LOAD BALANCER                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│    ┌───────────────┐                    ┌───────────────┐      │
│    │  us-central1  │                    │  europe-west1 │      │
│    ├───────────────┤                    ├───────────────┤      │
│    │ Cloud Run     │                    │ Cloud Run     │      │
│    │ Vertex AI     │                    │ Vertex AI     │      │
│    │ Firestore     │◄──Replication────▶│ Firestore     │      │
│    └───────────────┘                    └───────────────┘      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Production Checklist:

- [ ] Multi-region deployment
- [ ] Auto-scaling configuration
- [ ] Circuit breaker implementation
- [ ] Graceful degradation
- [ ] Canary deployments
- [ ] Disaster recovery plan

---

## Giai Đoạn 6: Advanced Topics

### TPU Optimization

```python
# TPU training setup
import jax

devices = jax.devices("tpu")
mesh = jax.sharding.Mesh(devices, ("data",))

# Distributed training
with mesh:
    model.train()
```

### Model Garden

| Model Type | Examples |
|------------|----------|
| Foundation | Gemini, Claude, Llama |
| Task-specific | BERT, T5, Whisper |
| Vision | Imagen, Stable Diffusion |
| Embeddings | text-embedding, multimodal |

---

## Certifications

### Recommended Path

```
Professional Cloud Architect
            +
Professional ML Engineer
            =
   Complete AI Architect skillset
```

### Study Plan

| Week | Focus |
|------|-------|
| 1-4 | Cloud Architect prep |
| 5-6 | Cloud Architect exam |
| 7-10 | ML Engineer prep |
| 11-12 | ML Engineer exam |

---

## Resources

### Official

- [AI Architecture Center](https://cloud.google.com/architecture/ai-ml)
- [Vertex AI Best Practices](https://cloud.google.com/vertex-ai/docs/best-practices)
- [Security Best Practices](https://cloud.google.com/security/best-practices)

### Reference Architectures

- [RAG with Vertex AI](https://cloud.google.com/architecture/rag-using-vertex-ai)
- [MLOps on GCP](https://cloud.google.com/architecture/mlops-on-gcp)

---

**Xem thêm:**
- [Model Guide](models.md)
- [So sánh platforms](/comparison/overview.md)
- [Full Roadmap](/google-ai-learning-roadmap.md)
