# Microsoft AI Models Guide 2025

> Hướng dẫn chọn model phù hợp cho từng use case

---

## Model Families Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                   AZURE OPENAI MODELS                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  GPT-4 Family          O-Series            Small Models        │
│  ┌─────────────┐      ┌─────────────┐     ┌─────────────┐     │
│  │ GPT-4.5     │      │ o1          │     │ Phi-4       │     │
│  │ GPT-4o      │      │ o1-mini     │     │ Phi-3.5     │     │
│  │ GPT-4o-mini │      │ o3 (preview)│     │             │     │
│  │ GPT-4 Turbo │      │ o3-mini     │     │             │     │
│  └─────────────┘      └─────────────┘     └─────────────┘     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## GPT-4 Family

### GPT-4.5 (NEW 2025)

| Aspect | Details |
|--------|---------|
| Strengths | High EQ, creativity, reduced hallucinations |
| Context | 128K tokens |
| Best For | Writing, analysis, nuanced conversations |
| Pricing | Premium tier |

### GPT-4o (Omni)

| Aspect | Details |
|--------|---------|
| Strengths | Multimodal (text + vision + audio) |
| Context | 128K tokens |
| Best For | General purpose, vision tasks |
| Pricing | $2.50 / 1M input, $10.00 / 1M output |

### GPT-4o-mini

| Aspect | Details |
|--------|---------|
| Strengths | Fast, cost-effective, good quality |
| Context | 128K tokens |
| Best For | High volume, simpler tasks |
| Pricing | $0.15 / 1M input, $0.60 / 1M output |

### Selection Guide

```
Need best quality?           → GPT-4.5 or GPT-4o
Need vision/audio?           → GPT-4o
Need cost efficiency?        → GPT-4o-mini
Need long context (>128K)?   → Use Google Gemini
```

---

## O-Series (Reasoning Models)

### o1 (General Availability)

| Aspect | Details |
|--------|---------|
| Strengths | Deep reasoning, chain-of-thought |
| Context | 200K tokens |
| Best For | Math, science, coding, complex problems |
| Note | Higher latency (thinking time) |

### o1-mini

| Aspect | Details |
|--------|---------|
| Strengths | Faster reasoning, cost-effective |
| Best For | STEM tasks where speed matters |
| Pricing | Lower than o1 |

### o3 (Preview 2025)

| Aspect | Details |
|--------|---------|
| Strengths | Next-gen reasoning, benchmark leader |
| Status | Limited preview |
| Best For | Most complex reasoning tasks |

### o3-mini

| Aspect | Details |
|--------|---------|
| Strengths | Efficient reasoning |
| Status | Preview |
| Best For | Balanced reasoning/cost |

### When to Use O-Series

```
Use O-Series when:
- Math proofs và derivations
- Scientific analysis
- Complex coding (algorithms, debugging)
- Multi-step problem solving
- Logic puzzles

DON'T use O-Series when:
- Simple chat/Q&A
- Content generation
- Quick responses needed
- Cost is primary concern
```

---

## Phi-4 (Small Language Model)

### Specifications

| Aspect | Details |
|--------|---------|
| Parameters | 14B |
| Strengths | Efficient, on-device capable |
| Context | 16K tokens |
| Best For | Edge, mobile, low-latency |

### Use Cases

- Copilot+ PC features
- Mobile apps
- Edge devices
- Privacy-sensitive scenarios
- Cost optimization

### Comparison vs GPT-4o-mini

| Aspect | Phi-4 | GPT-4o-mini |
|--------|-------|-------------|
| Size | 14B | Unknown |
| On-device | Yes | No |
| Quality | Good | Better |
| Cost | Very low | Low |
| Latency | Lowest | Low |

---

## Embedding Models

### text-embedding-3-large

| Aspect | Details |
|--------|---------|
| Dimensions | 3072 (configurable) |
| Best For | Semantic search, RAG |
| Quality | Highest |

### text-embedding-3-small

| Aspect | Details |
|--------|---------|
| Dimensions | 1536 |
| Best For | Cost-effective embeddings |
| Quality | Good |

---

## Image Generation

### DALL-E 3

| Aspect | Details |
|--------|---------|
| Quality | High |
| Styles | Diverse |
| Best For | Marketing, creative |
| Safety | Built-in filters |

---

## Model Selection Decision Tree

```
START
  │
  ├─ Need reasoning? ────────────────────► o1 or o3
  │
  ├─ Need vision? ───────────────────────► GPT-4o
  │
  ├─ Need on-device? ────────────────────► Phi-4
  │
  ├─ Need embeddings? ───────────────────► text-embedding-3
  │
  ├─ Need images? ───────────────────────► DALL-E 3
  │
  ├─ High volume, simple tasks? ─────────► GPT-4o-mini
  │
  └─ General purpose, quality? ──────────► GPT-4o or GPT-4.5
```

---

## Pricing Summary (per 1M tokens)

| Model | Input | Output |
|-------|-------|--------|
| GPT-4o | $2.50 | $10.00 |
| GPT-4o-mini | $0.15 | $0.60 |
| o1 | $15.00 | $60.00 |
| o1-mini | $3.00 | $12.00 |
| Embedding-large | $0.13 | - |
| Embedding-small | $0.02 | - |

---

## Best Practices

### 1. Start Small
Begin với GPT-4o-mini, upgrade khi cần.

### 2. Multi-Model Strategy
```
Routing logic:
- Simple queries → GPT-4o-mini
- Complex analysis → GPT-4o
- Reasoning tasks → o1
- Edge deployment → Phi-4
```

### 3. Cost Optimization
- Cache common responses
- Optimize prompts (shorter = cheaper)
- Use batch API khi có thể
- Monitor token usage

---

**Xem thêm:**
- [Lộ trình Developer](developer.md)
- [So sánh với Google/Amazon](/comparison/models.md)
- [Full Roadmap](/microsoft-ai-learning-roadmap.md)
