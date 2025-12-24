# Lộ Trình Architect - Microsoft AI 2025

> Thiết kế và triển khai AI systems trên Azure

---

## Tổng Quan Lộ Trình

```
Foundation: Azure AI Services Overview
             |
             v
Design: AI Architecture Patterns
             |
             v
Security: Enterprise Security & Governance
             |
             v
Scale: Production & Optimization
             |
             v
Certifications: AZ-305 + AI-102
```

---

## Giai Đoạn 1: Azure AI Architecture

### AI Services Landscape

```
┌─────────────────────────────────────────────────────────────────┐
│                    AZURE AI FOUNDRY                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │ Azure OpenAI │  │  AI Search   │  │   AI Vision  │          │
│  │   Service    │  │              │  │              │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │ AI Speech    │  │ AI Document  │  │   AI Lang    │          │
│  │              │  │ Intelligence │  │              │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Azure ML    │  │ Prompt Flow  │  │  Content     │          │
│  │              │  │              │  │  Safety      │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Tasks:

- [ ] Master Azure AI service catalog
- [ ] Hiểu pricing models
- [ ] Regional availability
- [ ] Service limits & quotas

---

## Giai Đoạn 2: Architecture Patterns

### RAG Architecture

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Client    │───▶│  API Layer  │───▶│   Prompt    │
└─────────────┘    └─────────────┘    │   Flow      │
                                      └──────┬──────┘
                                             │
                   ┌─────────────────────────┼─────────────────────────┐
                   │                         │                         │
                   ▼                         ▼                         ▼
            ┌─────────────┐          ┌─────────────┐          ┌─────────────┐
            │  AI Search  │          │ Azure OpenAI│          │   Cosmos    │
            │  (Vectors)  │          │   Service   │          │     DB      │
            └─────────────┘          └─────────────┘          └─────────────┘
```

### Multi-Model Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                       AI GATEWAY (APIM)                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Route: /simple     →  GPT-4o-mini (cost-effective)           │
│   Route: /complex    →  GPT-4o (powerful)                      │
│   Route: /reasoning  →  o1 (specialized)                       │
│   Route: /vision     →  GPT-4o-vision                          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Agent Architecture

- [ ] Semantic Kernel patterns
- [ ] AutoGen multi-agent
- [ ] Orchestration strategies
- [ ] State management

---

## Giai Đoạn 3: Enterprise Security

### Security Layers

| Layer | Implementation |
|-------|----------------|
| Network | Private endpoints, VNet |
| Identity | Managed Identity, RBAC |
| Data | CMK encryption, DLP |
| Application | API keys rotation, OAuth |

### Security Checklist:

- [ ] Private Link cho tất cả AI services
- [ ] Managed Identity (no API keys in code)
- [ ] Key Vault cho secrets
- [ ] RBAC least privilege
- [ ] Audit logging
- [ ] Data residency compliance

### Content Safety

```python
# Azure Content Safety
from azure.ai.contentsafety import ContentSafetyClient

client = ContentSafetyClient(endpoint, credential)

# Analyze text
result = client.analyze_text(
    AnalyzeTextOptions(
        text="content to check",
        categories=[
            TextCategory.HATE,
            TextCategory.VIOLENCE,
            TextCategory.SELF_HARM,
            TextCategory.SEXUAL
        ]
    )
)
```

---

## Giai Đoạn 4: Cost Optimization

### Cost Strategies

| Strategy | Savings |
|----------|---------|
| Use GPT-4o-mini where possible | 60-80% |
| PTU (Provisioned Throughput) | Predictable costs |
| Caching common responses | 40-60% |
| Prompt optimization | 20-30% |
| Batch processing | 50% |

### Monitoring

- [ ] Setup Azure Monitor for AI
- [ ] Token usage tracking
- [ ] Cost alerts
- [ ] Performance dashboards

---

## Giai Đoạn 5: Production Patterns

### High Availability

```
┌─────────────────────────────────────────────────────────────────┐
│                    TRAFFIC MANAGER / FRONT DOOR                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│    ┌───────────────┐                    ┌───────────────┐      │
│    │   Region A    │                    │   Region B    │      │
│    │  (Primary)    │                    │  (Secondary)  │      │
│    ├───────────────┤                    ├───────────────┤      │
│    │ Azure OpenAI  │                    │ Azure OpenAI  │      │
│    │ AI Search     │───Replication────▶ │ AI Search     │      │
│    │ Cosmos DB     │                    │ Cosmos DB     │      │
│    └───────────────┘                    └───────────────┘      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Production Checklist:

- [ ] Multi-region deployment
- [ ] Retry policies
- [ ] Circuit breaker pattern
- [ ] Graceful degradation
- [ ] Blue-green deployments

---

## Certifications

### Path đề xuất:

```
AZ-305: Azure Solutions Architect Expert
                    +
AI-102: Azure AI Engineer Associate
                    =
       Complete AI Architect skillset
```

### Study Plan

| Week | Focus |
|------|-------|
| 1-4 | AZ-305 preparation |
| 5-6 | AZ-305 exam |
| 7-10 | AI-102 preparation |
| 11-12 | AI-102 exam |

---

## Tài Nguyên

### Microsoft Learn

- [Azure AI Architecture Center](https://learn.microsoft.com/azure/architecture/ai-ml/)
- [Well-Architected Framework AI](https://learn.microsoft.com/azure/well-architected/ai/)

### Reference Architectures

- [RAG with Azure OpenAI](https://learn.microsoft.com/azure/architecture/ai-ml/architecture/rag-knowledge-mining)
- [Intelligent App Workload](https://learn.microsoft.com/azure/architecture/ai-ml/architecture/baseline-openai-e2e-chat)

---

**Xem thêm:**
- [Model Guide](models.md)
- [So sánh platforms](/comparison/overview.md)
- [Full Roadmap](/microsoft-ai-learning-roadmap.md)
