# Lộ Trình Developer - Amazon AI 2025

> Hướng dẫn từ zero đến production với AWS AI

---

## Tổng Quan Lộ Trình

```
Month 1-2: Foundation
    |
    v
Month 3-4: Bedrock & Q Developer
    |
    v
Month 5-6: Production & Certification
    |
    v
Certification: AWS ML Specialty
```

---

## Giai Đoạn 1: Foundation

### Tuần 1-2: AWS Setup

- [ ] Tạo AWS account
- [ ] Enable Bedrock trong supported region
- [ ] Setup IAM permissions
- [ ] Install AWS CLI

### Free Tier Options

| Service | Free Tier |
|---------|-----------|
| Bedrock | Limited free trial |
| PartyRock | Free |
| Q Developer | Free tier (individual) |
| SageMaker | 2 months free |

### Tuần 3-4: PartyRock (No-Code)

- [ ] Explore PartyRock.aws
- [ ] Build first app without code
- [ ] Understand AI app concepts
- [ ] Test different models

---

## Giai Đoạn 2: Amazon Bedrock

### Setup

```python
# Install boto3
# pip install boto3

import boto3

# Create Bedrock client
bedrock = boto3.client(
    service_name='bedrock-runtime',
    region_name='us-east-1'
)
```

### Basic Usage

```python
import json

# Invoke Claude 3.5 Sonnet
response = bedrock.invoke_model(
    modelId='anthropic.claude-3-5-sonnet-20241022-v2:0',
    body=json.dumps({
        "anthropic_version": "bedrock-2023-05-31",
        "max_tokens": 1000,
        "messages": [
            {"role": "user", "content": "Hello!"}
        ]
    })
)

result = json.loads(response['body'].read())
print(result['content'][0]['text'])
```

### Amazon Nova

```python
# Invoke Nova Pro
response = bedrock.invoke_model(
    modelId='amazon.nova-pro-v1:0',
    body=json.dumps({
        "messages": [
            {"role": "user", "content": "Hello Nova!"}
        ]
    })
)
```

### Tasks:

- [ ] Invoke Claude 3.5 Sonnet
- [ ] Invoke Amazon Nova models
- [ ] Try Llama 3.2
- [ ] Compare model outputs
- [ ] Implement streaming

---

## Giai Đoạn 3: Advanced Bedrock

### Knowledge Bases (RAG)

```python
# Create knowledge base
bedrock_agent = boto3.client('bedrock-agent')

# Retrieve and generate
response = bedrock_agent.retrieve_and_generate(
    input={'text': 'What is our return policy?'},
    retrieveAndGenerateConfiguration={
        'type': 'KNOWLEDGE_BASE',
        'knowledgeBaseConfiguration': {
            'knowledgeBaseId': 'YOUR_KB_ID',
            'modelArn': 'arn:aws:bedrock:...'
        }
    }
)
```

### Agents

```python
# Invoke agent
response = bedrock_agent.invoke_agent(
    agentId='YOUR_AGENT_ID',
    agentAliasId='YOUR_ALIAS_ID',
    sessionId='session-123',
    inputText='Book a flight to Tokyo'
)
```

### Tasks:

- [ ] Create Knowledge Base
- [ ] Setup S3 data source
- [ ] Build RAG application
- [ ] Create Bedrock Agent
- [ ] Implement custom tools

---

## Giai Đoạn 4: Amazon Q Developer

### Setup trong IDE

- [ ] Install Q Developer extension (VS Code)
- [ ] Authenticate with AWS
- [ ] Configure workspace
- [ ] Enable @workspace feature

### Features

| Feature | Description |
|---------|-------------|
| Chat | Ask coding questions |
| Inline completion | Real-time suggestions |
| @workspace | Codebase understanding |
| Security scans | Vulnerability detection |
| Transformation | Code upgrades |

### Example Prompts

```
"Explain this function"
"Write unit tests for this class"
"Find security vulnerabilities"
"Upgrade this Java 8 code to Java 17"
"How does authentication work in this project?"
```

---

## Giai Đoạn 5: LangChain Integration

### Setup

```python
# pip install langchain-aws

from langchain_aws import ChatBedrock

llm = ChatBedrock(
    model_id="anthropic.claude-3-5-sonnet-20241022-v2:0",
    model_kwargs={"temperature": 0.7}
)

response = llm.invoke("Hello!")
```

### RAG with LangChain

```python
from langchain_aws import BedrockEmbeddings
from langchain_community.vectorstores import FAISS

# Create embeddings
embeddings = BedrockEmbeddings(
    model_id="amazon.titan-embed-text-v2:0"
)

# Create vector store
vectorstore = FAISS.from_documents(documents, embeddings)

# Query
results = vectorstore.similarity_search("query")
```

---

## Giai Đoạn 6: Production

### Deployment Options

| Option | Best For |
|--------|----------|
| Lambda | Serverless APIs |
| ECS/Fargate | Containerized apps |
| EKS | Kubernetes workloads |
| AppRunner | Quick deployments |

### Lambda Example

```python
import json
import boto3

bedrock = boto3.client('bedrock-runtime')

def lambda_handler(event, context):
    prompt = event.get('prompt', '')

    response = bedrock.invoke_model(
        modelId='amazon.nova-lite-v1:0',
        body=json.dumps({
            "messages": [{"role": "user", "content": prompt}]
        })
    )

    result = json.loads(response['body'].read())
    return {
        'statusCode': 200,
        'body': json.dumps(result)
    }
```

### Production Checklist:

- [ ] Setup VPC endpoints
- [ ] Implement error handling
- [ ] Add retry logic
- [ ] Setup CloudWatch monitoring
- [ ] Configure cost alerts
- [ ] Implement guardrails

---

## Certification Path

### AWS Certifications

```
Cloud Practitioner (Foundation)
         |
         v
Solutions Architect Associate
         |
         v
ML Specialty / AI Practitioner
```

### Study Resources

- [AWS Skill Builder](https://skillbuilder.aws/)
- [AWS Training](https://aws.amazon.com/training/)
- [Official Docs](https://docs.aws.amazon.com/)

---

## Tips

### Cost Optimization

1. **Start with Nova Lite** - cheapest option
2. **Use provisioned throughput** for predictable costs
3. **Cache responses** when possible
4. **Monitor token usage** with CloudWatch

### Best Practices

1. **Use IAM roles** instead of keys
2. **Implement retries** with exponential backoff
3. **Handle rate limits** gracefully
4. **Log all requests** for debugging

---

**Xem thêm:**
- [Model Guide](models.md)
- [Tài nguyên học tập](resources.md)
- [Checklist theo dõi](/checklist/amazon.md)
