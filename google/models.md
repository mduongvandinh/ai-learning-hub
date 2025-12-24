# Google AI Models Guide 2025

> Hướng dẫn chọn model phù hợp cho từng use case

---

## Model Families Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                      GOOGLE AI MODELS                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Gemini Family          Open Models        Specialized         │
│  ┌─────────────┐       ┌─────────────┐   ┌─────────────┐      │
│  │ Gemini 2.0  │       │ Gemma 2     │   │ Imagen 3    │      │
│  │ Flash       │       │ (2B-27B)    │   │ Veo 2       │      │
│  │ Gemini 1.5  │       │ CodeGemma   │   │ Chirp       │      │
│  │ Pro/Flash   │       │ PaliGemma   │   │ Embeddings  │      │
│  └─────────────┘       └─────────────┘   └─────────────┘      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Gemini 2.0 Family

### Gemini 2.0 Flash

| Aspect | Details |
|--------|---------|
| Strengths | Fast, multimodal, efficient |
| Context | 1M tokens |
| Best For | General purpose, speed-critical |
| Status | Available (exp) |

### Gemini 2.0 Flash Thinking

| Aspect | Details |
|--------|---------|
| Strengths | Visible reasoning process |
| Best For | Complex problems, math |
| Note | Shows thinking steps |

---

## Gemini 1.5 Family

### Gemini 1.5 Pro

| Aspect | Details |
|--------|---------|
| Strengths | Longest context (2M tokens) |
| Context | 2,000,000 tokens |
| Best For | Long documents, code analysis |
| Pricing | $1.25/$5.00 per 1M tokens |

### Gemini 1.5 Flash

| Aspect | Details |
|--------|---------|
| Strengths | Fast, cost-effective |
| Context | 1M tokens |
| Best For | High volume, real-time |
| Pricing | $0.075/$0.30 per 1M tokens |

### Selection Guide

```
Need 2M context?         → Gemini 1.5 Pro
Need speed & cost?       → Gemini 1.5 Flash
Need latest features?    → Gemini 2.0 Flash
Need reasoning?          → Gemini 2.0 Flash Thinking
```

---

## Context Window Comparison

```
┌─────────────────────────────────────────────────────────────────┐
│                    CONTEXT WINDOWS                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Gemini 1.5 Pro    ████████████████████████████████████  2M    │
│  Gemini 1.5 Flash  ████████████████████  1M                    │
│  Gemini 2.0 Flash  ████████████████████  1M                    │
│  GPT-4o            ██████  128K                                │
│  Claude 3.5        ████████  200K                              │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Google có context window lớn nhất!**

---

## Open Models (Gemma)

### Gemma 2

| Size | Use Case | Deployment |
|------|----------|------------|
| 2B | Mobile, edge | On-device |
| 9B | Balanced | Server |
| 27B | Quality focus | Cloud |

### CodeGemma

| Aspect | Details |
|--------|---------|
| Optimized for | Code generation, completion |
| Languages | 500+ programming languages |
| Best For | IDE integration, coding tools |

### PaliGemma

| Aspect | Details |
|--------|---------|
| Type | Vision-language model |
| Best For | Image understanding |
| Open Source | Yes |

---

## Specialized Models

### Imagen 3

| Aspect | Details |
|--------|---------|
| Quality | Highest in Google lineup |
| Features | Photorealistic, text rendering |
| Access | AI Studio, Vertex AI |

### Veo 2

| Aspect | Details |
|--------|---------|
| Type | Video generation |
| Quality | 4K, long clips |
| Access | VideoFX, Vertex AI |

### Chirp (Speech)

| Feature | Details |
|---------|---------|
| Languages | 100+ |
| Quality | Production-ready |
| Features | Real-time, batch |

---

## Embedding Models

### text-embedding-004

| Aspect | Details |
|--------|---------|
| Dimensions | 768 |
| Best For | Semantic search, RAG |
| Languages | Multilingual |

### multimodal-embedding

| Aspect | Details |
|--------|---------|
| Type | Text + Image |
| Best For | Cross-modal search |
| Dimensions | 1408 |

---

## Model Selection Decision Tree

```
START
  │
  ├─ Need very long context? ────────► Gemini 1.5 Pro (2M)
  │
  ├─ Need speed & cost? ─────────────► Gemini 1.5 Flash
  │
  ├─ Need reasoning? ────────────────► Gemini 2.0 Flash Thinking
  │
  ├─ Need on-device? ────────────────► Gemma 2 (2B)
  │
  ├─ Need code focus? ───────────────► CodeGemma
  │
  ├─ Need images? ───────────────────► Imagen 3
  │
  ├─ Need video? ────────────────────► Veo 2
  │
  └─ General purpose? ───────────────► Gemini 2.0 Flash
```

---

## Pricing Summary (per 1M tokens)

| Model | Input | Output |
|-------|-------|--------|
| Gemini 1.5 Pro | $1.25 | $5.00 |
| Gemini 1.5 Flash | $0.075 | $0.30 |
| Gemini 2.0 Flash | Preview pricing |
| Gemma 2 | Free (open source) |
| text-embedding | $0.00025 | - |

---

## Free Tier

### Google AI Studio

| Model | Free Limits |
|-------|-------------|
| Gemini 1.5 Flash | 15 RPM, 1M TPD |
| Gemini 1.5 Pro | 2 RPM, 50 RPD |
| Gemini 2.0 Flash | Available in preview |

### Colab & Kaggle

- Free GPU: NVIDIA T4
- Free TPU: TPU v2 (limited)
- Generous quotas

---

## Best Practices

### 1. Start with Flash
Bắt đầu với Gemini 1.5 Flash, upgrade khi cần Pro.

### 2. Leverage Context Window
```
Unique Google advantage:
- Upload entire codebases
- Analyze long documents
- No chunking needed for most tasks
```

### 3. Multi-Model Strategy
```
Routing logic:
- Simple queries → Gemini 1.5 Flash
- Long documents → Gemini 1.5 Pro
- Reasoning → Gemini 2.0 Flash Thinking
- Edge deployment → Gemma 2
```

### 4. Use Multimodal Native
```
Gemini is natively multimodal:
- Upload images, audio, video directly
- No separate vision model needed
- Better understanding than add-on models
```

---

**Xem thêm:**
- [Lộ trình Developer](developer.md)
- [So sánh với Microsoft/Amazon](/comparison/models.md)
- [Full Roadmap](/google-ai-learning-roadmap.md)
