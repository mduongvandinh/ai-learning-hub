# So Sánh Chi Phí AI Platforms 2025

> Phân tích chi tiết pricing của Microsoft, Google và Amazon

---

## Tổng Quan Chi Phí

### LLM Pricing (per 1M tokens)

| Model | Input | Output | Ghi Chú |
|-------|-------|--------|---------|
| **Microsoft** |
| GPT-4o | $2.50 | $10.00 | Flagship |
| GPT-4o-mini | $0.15 | $0.60 | Best value |
| o1 | $15.00 | $60.00 | Reasoning |
| o1-mini | $3.00 | $12.00 | Efficient reasoning |
| **Google** |
| Gemini 1.5 Pro | $1.25 | $5.00 | 2M context |
| Gemini 1.5 Flash | $0.075 | $0.30 | Nhanh, rẻ |
| Gemini 2.0 Flash | Preview | Preview | Mới nhất |
| **Amazon** |
| Nova Micro | $0.035 | $0.14 | Rẻ nhất |
| Nova Lite | $0.06 | $0.24 | Multimodal rẻ |
| Nova Pro | $0.80 | $3.20 | Cân bằng |
| Claude 3.5 Sonnet | $3.00 | $15.00 | Code focus |
| Claude 3.5 Haiku | $0.25 | $1.25 | Nhanh |

---

## So Sánh Trực Quan

```
┌─────────────────────────────────────────────────────────────────┐
│                 CHI PHÍ OUTPUT (per 1M tokens)                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Nova Micro    $0.14   █                                       │
│  Nova Lite     $0.24   █                                       │
│  Gemini Flash  $0.30   █                                       │
│  GPT-4o-mini   $0.60   ██                                      │
│  Claude Haiku  $1.25   ███                                     │
│  Nova Pro      $3.20   ██████                                  │
│  Gemini Pro    $5.00   ██████████                              │
│  GPT-4o        $10.00  ████████████████████                    │
│  Claude Sonnet $15.00  ██████████████████████████████          │
│  o1            $60.00  ████████████████████████████████████... │
│                                                                 │
│  Thang đo: █ = $0.50                                           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Ước Tính Chi Phí Theo Use Case

### Use Case 1: Chatbot Đơn Giản

**Giả định**: 100,000 conversations/tháng, 500 tokens/conversation

| Platform | Model | Chi Phí/Tháng |
|----------|-------|---------------|
| Amazon | Nova Lite | ~$15 |
| Google | Gemini Flash | ~$20 |
| Microsoft | GPT-4o-mini | ~$37 |

### Use Case 2: RAG Enterprise

**Giả định**: 50,000 queries/tháng, 2000 tokens/query (including context)

| Platform | Model | Chi Phí/Tháng |
|----------|-------|---------------|
| Amazon | Nova Pro | ~$400 |
| Google | Gemini Pro | ~$625 |
| Microsoft | GPT-4o | ~$1,250 |

### Use Case 3: Code Assistant

**Giả định**: 10 developers, 1000 completions/ngày/dev

| Platform | Sản Phẩm | Chi Phí/Tháng |
|----------|----------|---------------|
| Microsoft | GitHub Copilot | $190 ($19/user) |
| Amazon | Q Developer Pro | $190 ($19/user) |
| Google | Duet AI | ~$190 ($19/user) |

---

## Free Tier So Sánh

### Microsoft Azure

| Dịch Vụ | Free Tier |
|---------|-----------|
| Azure OpenAI | Không có free tier |
| GitHub Copilot | 2000 completions/tháng (free tier) |
| Azure ML | $200 credits mới |

### Google Cloud

| Dịch Vụ | Free Tier |
|---------|-----------|
| AI Studio | 15 RPM, 1M TPD (Flash) |
| Colab | Free GPU (T4) |
| Kaggle | 30 hrs GPU/tuần |
| Vertex AI | $300 credits mới |

### Amazon AWS

| Dịch Vụ | Free Tier |
|---------|-----------|
| Bedrock | Trial period |
| PartyRock | Hoàn toàn miễn phí |
| SageMaker Studio Lab | Free notebooks + GPU |
| Q Developer | Free tier cho cá nhân |

<div class="tip">

**🏆 Free Tier Tốt Nhất: Google**
- Colab miễn phí với GPU
- AI Studio generous quota
- Kaggle free TPU

</div>

---

## Chi Phí Ẩn Cần Xem Xét

### 1. Chi Phí Cơ Sở Hạ Tầng

| Hạng Mục | Microsoft | Google | Amazon |
|----------|-----------|--------|--------|
| Compute | Azure VMs | GCE | EC2 |
| Storage | Blob | GCS | S3 |
| Network | Egress fees | Egress fees | Egress fees |

### 2. Chi Phí Phát Triển

```
Cần tính thêm:
- Developer time (learning curve)
- Integration effort
- Migration costs
- Training & certification
```

### 3. Chi Phí Vận Hành

| Hạng Mục | Ước Tính |
|----------|----------|
| Monitoring | 5-10% of AI costs |
| Logging | 2-5% of AI costs |
| Security | 5-10% of AI costs |
| Support | Varies by tier |

---

## Chiến Lược Tối Ưu Chi Phí

### 1. Chọn Model Phù Hợp

```
Quy tắc 80/20:
- 80% queries: Dùng model rẻ (Nova Lite, Gemini Flash, GPT-4o-mini)
- 20% complex queries: Dùng model mạnh hơn

Tiết kiệm: 50-70%
```

### 2. Caching Responses

```python
# Redis cache example
cache_key = hash(prompt)
if cached := redis.get(cache_key):
    return cached
response = call_llm(prompt)
redis.set(cache_key, response, ttl=3600)
```

**Tiết kiệm**: 30-60% cho queries lặp lại

### 3. Prompt Optimization

```
Trước: 500 tokens prompt + 500 tokens response = 1000 tokens
Sau: 200 tokens prompt + 500 tokens response = 700 tokens

Tiết kiệm: 30% chi phí input
```

### 4. Batch Processing

| Phương Pháp | Tiết Kiệm |
|-------------|-----------|
| Real-time | 0% (baseline) |
| Batch API | 50% |
| Off-peak hours | 10-20% (một số providers) |

### 5. Committed Use / Reserved

| Provider | Chương Trình | Tiết Kiệm |
|----------|--------------|-----------|
| Microsoft | PTU | Predictable costs |
| Google | Committed Use | 20-30% |
| Amazon | Provisioned Throughput | Reserved pricing |

---

## Calculator Nhanh

### Công Thức Tính Chi Phí

```
Chi phí = (Input Tokens × Input Price) + (Output Tokens × Output Price)
         ─────────────────────────────────────────────────────────────
                               1,000,000

Ví dụ với GPT-4o:
- 50,000 input tokens × $2.50/1M = $0.125
- 10,000 output tokens × $10.00/1M = $0.10
- Tổng = $0.225 cho 1 request
```

### Bảng Ước Tính Nhanh

**Chi phí cho 1M output tokens (bao gồm ~200K input)**

| Model | Chi Phí Ước Tính |
|-------|------------------|
| Nova Micro | ~$0.15 |
| Nova Lite | ~$0.25 |
| Gemini Flash | ~$0.32 |
| GPT-4o-mini | ~$0.63 |
| Nova Pro | ~$3.36 |
| Gemini Pro | ~$5.25 |
| GPT-4o | ~$10.50 |
| Claude Sonnet | ~$15.60 |

---

## Khuyến Nghị Theo Ngân Sách

### Ngân Sách Hạn Chế (< $100/tháng)

**Khuyến nghị**: Amazon Nova Lite hoặc Google Gemini Flash
- Multimodal support
- Chất lượng tốt
- Chi phí thấp nhất

### Ngân Sách Trung Bình ($100-1000/tháng)

**Khuyến nghị**: Multi-model strategy
- Simple: Nova Lite/Gemini Flash
- Complex: Nova Pro/GPT-4o-mini
- Code: Claude 3.5 Haiku

### Ngân Sách Doanh Nghiệp ($1000+/tháng)

**Khuyến nghị**: Best-fit cho từng use case
- Đàm phán enterprise pricing
- Committed use discounts
- Support tier upgrades

---

## Kết Luận

<div class="info">

**Điểm Chính:**

1. **Amazon rẻ nhất** cho high-volume (Nova Micro/Lite)
2. **Google free tier tốt nhất** cho learning/prototyping
3. **Microsoft premium** nhưng có GitHub Copilot value
4. **Chi phí thực tế** thường cao hơn 20-30% do overhead

</div>

---

**Xem thêm:**
- [So sánh Models](models.md)
- [So sánh Features](features.md)
- [Hướng dẫn chọn Platform](decision-guide.md)
