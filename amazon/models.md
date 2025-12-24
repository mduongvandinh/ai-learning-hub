# Amazon AI Models Guide 2025

> Hướng dẫn chọn model phù hợp cho từng use case trên Bedrock

---

## Model Families Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                    AMAZON BEDROCK MODELS                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Amazon Nova        Third Party         Amazon Titan           │
│  ┌─────────────┐   ┌─────────────┐     ┌─────────────┐        │
│  │ Nova Micro  │   │ Claude 3.5  │     │ Titan Text  │        │
│  │ Nova Lite   │   │ Llama 3.2   │     │ Titan Embed │        │
│  │ Nova Pro    │   │ Mistral     │     │ Titan Image │        │
│  │ Nova Premier│   │ Cohere      │     │             │        │
│  │ Nova Canvas │   │ AI21        │     │             │        │
│  │ Nova Reel   │   │ Stability   │     │             │        │
│  └─────────────┘   └─────────────┘     └─────────────┘        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Amazon Nova Family

### Nova Micro

| Aspect | Details |
|--------|---------|
| Type | Text only |
| Strengths | Fastest, cheapest |
| Context | 128K tokens |
| Best For | Simple tasks, high volume |
| Pricing | $0.035/$0.14 per 1M |

### Nova Lite

| Aspect | Details |
|--------|---------|
| Type | Multimodal (text, image, video) |
| Strengths | Cost-effective multimodal |
| Context | 300K tokens |
| Best For | General multimodal, cost-sensitive |
| Pricing | $0.06/$0.24 per 1M |

### Nova Pro

| Aspect | Details |
|--------|---------|
| Type | Multimodal |
| Strengths | Balanced quality/cost |
| Context | 300K tokens |
| Best For | Production workloads |
| Pricing | $0.80/$3.20 per 1M |

### Nova Premier (Coming Q1 2025)

| Aspect | Details |
|--------|---------|
| Type | Most capable |
| Strengths | Complex reasoning |
| Best For | Enterprise, complex tasks |

### Nova Canvas

| Aspect | Details |
|--------|---------|
| Type | Image generation |
| Features | High quality, fast |
| Best For | Creative, marketing |

### Nova Reel

| Aspect | Details |
|--------|---------|
| Type | Video generation |
| Length | Up to 6 seconds |
| Best For | Short videos, ads |

---

## Third-Party Models

### Anthropic Claude

| Model | Strengths | Pricing |
|-------|-----------|---------|
| Claude 3.5 Sonnet | Coding, analysis | $3/$15 |
| Claude 3.5 Haiku | Fast, efficient | $0.25/$1.25 |
| Claude 3 Opus | Most capable | $15/$75 |

### Meta Llama

| Model | Parameters | Best For |
|-------|------------|----------|
| Llama 3.2 1B | 1B | On-device, edge |
| Llama 3.2 3B | 3B | Efficient inference |
| Llama 3.2 11B | 11B | Vision tasks |
| Llama 3.2 90B | 90B | Complex tasks |

### Mistral AI

| Model | Strengths | Best For |
|-------|-----------|----------|
| Mistral Large | Most capable | Enterprise |
| Mistral Small | Efficient | Cost-sensitive |
| Mixtral 8x7B | MoE architecture | Balanced |

### Other Providers

| Provider | Models | Best For |
|----------|--------|----------|
| Cohere | Command R+ | Enterprise search |
| AI21 Labs | Jamba | Long context |
| Stability AI | SDXL | Image generation |

---

## Model Selection Decision Tree

```
START
  │
  ├─ Need cheapest option? ──────────► Nova Micro (text)
  │                                   Nova Lite (multimodal)
  │
  ├─ Need coding focus? ─────────────► Claude 3.5 Sonnet
  │
  ├─ Need open source? ──────────────► Llama 3.2
  │
  ├─ Need long context? ─────────────► Claude 3.5 (200K)
  │                                   Nova Pro (300K)
  │
  ├─ Need image gen? ────────────────► Nova Canvas
  │                                   Stability SDXL
  │
  ├─ Need video gen? ────────────────► Nova Reel
  │
  ├─ Balanced quality/cost? ─────────► Nova Pro
  │
  └─ Maximum capability? ────────────► Claude 3 Opus
                                      Nova Premier (coming)
```

---

## Pricing Comparison (per 1M tokens)

### Text Models

| Model | Input | Output |
|-------|-------|--------|
| Nova Micro | $0.035 | $0.14 |
| Nova Lite | $0.06 | $0.24 |
| Nova Pro | $0.80 | $3.20 |
| Claude 3.5 Sonnet | $3.00 | $15.00 |
| Claude 3.5 Haiku | $0.25 | $1.25 |
| Llama 3.2 8B | $0.22 | $0.22 |
| Mistral Large | $4.00 | $12.00 |

### Cost Efficiency Ranking

```
Most Cost-Effective:
1. Nova Micro       ████  Cheapest
2. Nova Lite        █████ Great value
3. Claude Haiku     ██████ Fast & cheap
4. Nova Pro         ███████ Balanced
5. Claude Sonnet    ████████ Quality
6. Claude Opus      ██████████ Premium
```

---

## Embedding Models

### Amazon Titan Embeddings

| Model | Dimensions | Best For |
|-------|------------|----------|
| Titan Embed Text v2 | 1024 | Semantic search |
| Titan Embed Image | 1024 | Image search |
| Titan Multimodal | 1024 | Cross-modal |

### Cohere Embeddings

| Model | Dimensions | Best For |
|-------|------------|----------|
| Embed English | 1024 | English text |
| Embed Multilingual | 1024 | 100+ languages |

---

## Unique AWS Advantage: Model Choice

```
┌─────────────────────────────────────────────────────────────────┐
│              WHY BEDROCK HAS MOST CHOICE                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  8+ Model Providers:                                           │
│  ✓ Amazon (Nova, Titan)                                        │
│  ✓ Anthropic (Claude)                                          │
│  ✓ Meta (Llama)                                                │
│  ✓ Mistral AI                                                  │
│  ✓ Cohere                                                      │
│  ✓ AI21 Labs                                                   │
│  ✓ Stability AI                                                │
│  ✓ More coming...                                              │
│                                                                 │
│  Benefits:                                                      │
│  → No vendor lock-in                                           │
│  → Best model for each task                                    │
│  → Easy switching                                              │
│  → Unified API                                                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Best Practices

### 1. Start with Nova
Bắt đầu với Nova Lite/Pro, thêm Claude khi cần quality cao hơn.

### 2. Multi-Model Strategy

```python
def select_model(task_type: str) -> str:
    model_map = {
        'simple_chat': 'amazon.nova-lite-v1:0',
        'complex_analysis': 'amazon.nova-pro-v1:0',
        'coding': 'anthropic.claude-3-5-sonnet-20241022-v2:0',
        'cost_sensitive': 'amazon.nova-micro-v1:0',
        'image_gen': 'amazon.nova-canvas-v1:0'
    }
    return model_map.get(task_type, 'amazon.nova-pro-v1:0')
```

### 3. Use Provisioned Throughput

For predictable workloads:
- Commit to usage
- Get reserved capacity
- Lower per-token costs

### 4. Leverage Nova for Cost

```
Potential savings:
- Nova Lite vs Claude Sonnet: ~50x cheaper
- Nova Pro vs Claude Sonnet: ~4x cheaper
- Nova Micro vs any: Cheapest on market
```

---

## Model Availability by Region

| Region | Nova | Claude | Llama |
|--------|------|--------|-------|
| us-east-1 | ✓ | ✓ | ✓ |
| us-west-2 | ✓ | ✓ | ✓ |
| eu-west-1 | ✓ | ✓ | ✓ |
| ap-northeast-1 | ✓ | Partial | ✓ |

---

**Xem thêm:**
- [Lộ trình Developer](developer.md)
- [So sánh với Microsoft/Google](/comparison/models.md)
- [Full Roadmap](/amazon-ai-learning-roadmap.md)
