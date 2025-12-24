# Lộ Trình Architect - Amazon AI 2025

> Thiết kế và triển khai AI systems trên AWS

---

## Tổng Quan Lộ Trình

```
Foundation: AWS AI Services Overview
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
Certifications: Solutions Architect + ML Specialty
```

---

## Giai Đoạn 1: AWS AI Architecture

### AI Services Landscape

```
┌─────────────────────────────────────────────────────────────────┐
│                        AWS AI SERVICES                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────────────────────────────────────────────┐      │
│  │                  AMAZON BEDROCK                       │      │
│  │  ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐     │      │
│  │  │ Models │  │ Agents │  │  KBs   │  │ Guard  │     │      │
│  │  └────────┘  └────────┘  └────────┘  └────────┘     │      │
│  └──────────────────────────────────────────────────────┘      │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  SageMaker   │  │   Amazon Q   │  │   Rekognition│          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │   Textract   │  │   Comprehend │  │   Transcribe │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │    Polly     │  │     Lex      │  │   Translate  │          │
│  └──────────────┘  └──────────────┘  └──────────────┘          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Tasks:

- [ ] Master AWS AI service catalog
- [ ] Hiểu pricing models
- [ ] Regional availability
- [ ] Quotas và limits

---

## Giai Đoạn 2: Architecture Patterns

### RAG Architecture on AWS

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Client    │───▶│   API GW    │───▶│   Lambda    │
│             │    │             │    │             │
└─────────────┘    └─────────────┘    └──────┬──────┘
                                             │
                   ┌─────────────────────────┼─────────────────────────┐
                   │                         │                         │
                   ▼                         ▼                         ▼
            ┌─────────────┐          ┌─────────────┐          ┌─────────────┐
            │   Bedrock   │          │   OpenSearch│          │  DynamoDB   │
            │   Knowledge │          │  Serverless │          │             │
            │     Base    │          │  (Vectors)  │          │             │
            └─────────────┘          └─────────────┘          └─────────────┘
```

### Multi-Model Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    MODEL ROUTER (Lambda)                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   Route: /simple     →  Nova Lite (cheapest)                   │
│   Route: /complex    →  Claude 3.5 Sonnet (powerful)           │
│   Route: /code       →  Claude 3.5 Sonnet (code)               │
│   Route: /fast       →  Nova Micro (fastest)                   │
│   Route: /image      →  Nova Canvas                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Bedrock Agents Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     BEDROCK AGENT                               │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌───────────────────────────────────────────────────────┐    │
│   │                   Orchestration                        │    │
│   │   ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐ │    │
│   │   │  Parse  │→ │  Plan   │→ │ Execute │→ │ Respond │ │    │
│   │   │  Input  │  │  Steps  │  │ Actions │  │         │ │    │
│   │   └─────────┘  └─────────┘  └─────────┘  └─────────┘ │    │
│   └───────────────────────────────────────────────────────┘    │
│                                                                 │
│   Action Groups: Lambda | API Gateway | S3 | DynamoDB          │
│   Knowledge Bases: S3 | SharePoint | Confluence | Web          │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Giai Đoạn 3: Enterprise Security

### Security Layers

| Layer | AWS Implementation |
|-------|-------------------|
| Network | VPC, PrivateLink |
| Identity | IAM, Identity Center |
| Data | KMS, S3 encryption |
| Application | WAF, Shield |
| Audit | CloudTrail, Config |

### Security Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     SECURITY PERIMETER                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │
│  │     WAF     │  │   Shield    │  │  GuardDuty  │             │
│  └─────────────┘  └─────────────┘  └─────────────┘             │
│                                                                 │
│  ┌─────────────────────────────────────────────────┐           │
│  │                    VPC                          │           │
│  │  ┌─────────────────────────────────────────┐   │           │
│  │  │           Private Subnet                 │   │           │
│  │  │  ┌───────────┐      ┌───────────┐       │   │           │
│  │  │  │  Bedrock  │      │ SageMaker │       │   │           │
│  │  │  │ (Private  │      │ (Private  │       │   │           │
│  │  │  │ Endpoint) │      │ Endpoint) │       │   │           │
│  │  │  └───────────┘      └───────────┘       │   │           │
│  │  └─────────────────────────────────────────┘   │           │
│  └─────────────────────────────────────────────────┘           │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Security Checklist:

- [ ] VPC endpoints for all AI services
- [ ] IAM least privilege
- [ ] KMS encryption at rest
- [ ] TLS in transit
- [ ] CloudTrail logging
- [ ] Bedrock Guardrails

### Bedrock Guardrails

```python
# Create guardrail
guardrail = bedrock.create_guardrail(
    name='content-filter',
    blockedInputMessaging='Sorry, I cannot process that request.',
    contentPolicyConfig={
        'filtersConfig': [
            {'type': 'SEXUAL', 'inputStrength': 'HIGH'},
            {'type': 'HATE', 'inputStrength': 'HIGH'},
            {'type': 'VIOLENCE', 'inputStrength': 'HIGH'}
        ]
    }
)
```

---

## Giai Đoạn 4: Cost Optimization

### Cost Strategies

| Strategy | Impact |
|----------|--------|
| Use Nova Lite | 80%+ savings vs Claude |
| Provisioned throughput | Predictable costs |
| Caching (ElastiCache) | 50-70% reduction |
| Right-size compute | Variable |
| Spot for SageMaker | 70% training savings |

### Cost Monitoring

```python
# CloudWatch budget alarm
cloudwatch.put_metric_alarm(
    AlarmName='bedrock-cost-alarm',
    MetricName='InvocationModelTokens',
    Namespace='AWS/Bedrock',
    Threshold=1000000,
    ComparisonOperator='GreaterThanThreshold'
)
```

### Model Pricing Comparison

| Model | Input/1M | Output/1M |
|-------|----------|-----------|
| Nova Micro | $0.035 | $0.14 |
| Nova Lite | $0.06 | $0.24 |
| Nova Pro | $0.80 | $3.20 |
| Claude 3.5 Sonnet | $3.00 | $15.00 |

---

## Giai Đoạn 5: Production Patterns

### High Availability

```
┌─────────────────────────────────────────────────────────────────┐
│                  ROUTE 53 (Global Load Balancer)                │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│    ┌───────────────┐                    ┌───────────────┐      │
│    │   us-east-1   │                    │   eu-west-1   │      │
│    ├───────────────┤                    ├───────────────┤      │
│    │ ALB + Lambda  │                    │ ALB + Lambda  │      │
│    │ Bedrock       │                    │ Bedrock       │      │
│    │ DynamoDB      │◄──Global Tables──▶│ DynamoDB      │      │
│    │ (Global)      │                    │ (Global)      │      │
│    └───────────────┘                    └───────────────┘      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Production Checklist:

- [ ] Multi-region deployment
- [ ] Auto-scaling (Lambda, ECS)
- [ ] Circuit breaker pattern
- [ ] Graceful degradation
- [ ] Blue-green deployments
- [ ] Disaster recovery tested

---

## Giai Đoạn 6: Advanced Topics

### Custom Chips Strategy

| Chip | Use Case | Savings |
|------|----------|---------|
| Trainium2 | Training | 50%+ |
| Inferentia2 | Inference | 40%+ |
| Graviton | General | 20-40% |

### Multi-Model Routing

```python
def route_to_model(query: dict) -> str:
    complexity = analyze_complexity(query)

    if complexity == 'simple':
        return 'amazon.nova-lite-v1:0'
    elif complexity == 'code':
        return 'anthropic.claude-3-5-sonnet-20241022-v2:0'
    elif complexity == 'vision':
        return 'amazon.nova-pro-v1:0'
    else:
        return 'amazon.nova-pro-v1:0'  # default
```

---

## Certifications

### Recommended Path

```
Solutions Architect Associate
            +
Solutions Architect Professional
            +
ML Specialty
            =
   Complete AI Architect skillset
```

### Study Plan

| Week | Focus |
|------|-------|
| 1-4 | SA Associate prep |
| 5-6 | SA Associate exam |
| 7-10 | ML Specialty prep |
| 11-12 | ML Specialty exam |

---

## Resources

### Official

- [AWS Architecture Center](https://aws.amazon.com/architecture/)
- [Bedrock Best Practices](https://docs.aws.amazon.com/bedrock/latest/userguide/best-practices.html)
- [Well-Architected ML Lens](https://docs.aws.amazon.com/wellarchitected/latest/machine-learning-lens/)

### Reference Architectures

- [Serverless RAG](https://aws.amazon.com/blogs/machine-learning/build-a-serverless-rag-solution-with-amazon-bedrock/)
- [Multi-tenant GenAI](https://aws.amazon.com/blogs/architecture/)

---

**Xem thêm:**
- [Model Guide](models.md)
- [So sánh platforms](/comparison/overview.md)
- [Full Roadmap](/amazon-ai-learning-roadmap.md)
