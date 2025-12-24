# Lộ Trình Developer - Microsoft AI 2025

> Hướng dẫn từ zero đến production cho developers

---

## Tổng Quan Lộ Trình

```
Month 1-2: Foundation
    |
    v
Month 3-4: Azure AI Services
    |
    v
Month 5-6: Frameworks & Production
    |
    v
Certification: AI-102
```

---

## Giai Đoạn 1: Foundation (Tháng 1-2)

### Tuần 1-2: Setup & Basics

- [ ] Tạo Azure account (free $200 credits)
- [ ] Cài đặt VS Code + extensions
- [ ] Cài đặt GitHub Copilot
- [ ] Hoàn thành AI-900 learning path

### Tuần 3-4: Prompt Engineering

- [ ] Master basic prompting
- [ ] Học system prompts
- [ ] Hiểu few-shot learning
- [ ] Thực hành với Azure AI Foundry

### Tuần 5-8: GitHub Copilot Mastery

- [ ] Copilot Chat trong VS Code
- [ ] Copilot Agent mode
- [ ] Copilot for CLI
- [ ] Copilot Workspace (preview)

---

## Giai Đoạn 2: Azure AI Services (Tháng 3-4)

### Azure OpenAI Service

```python
# Basic Azure OpenAI call
from openai import AzureOpenAI

client = AzureOpenAI(
    api_version="2024-10-01-preview",
    azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT"),
    api_key=os.getenv("AZURE_OPENAI_API_KEY")
)

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": "You are a helpful assistant"},
        {"role": "user", "content": "Hello!"}
    ]
)
```

### Tasks:

- [ ] Deploy GPT-4o model
- [ ] Implement chat completion
- [ ] Sử dụng Assistants API
- [ ] Build RAG với AI Search
- [ ] Thử nghiệm o1/o3 models

### Azure AI Search (RAG)

- [ ] Index documents
- [ ] Semantic search
- [ ] Hybrid search
- [ ] Integrate với OpenAI

---

## Giai Đoạn 3: Frameworks (Tháng 5-6)

### Semantic Kernel

```python
# Semantic Kernel Python
import semantic_kernel as sk

kernel = sk.Kernel()
kernel.add_chat_service(
    "azure_openai",
    AzureChatCompletion(...)
)

# Create agent
agent = ChatCompletionAgent(
    kernel=kernel,
    name="Assistant"
)
```

### AutoGen

```python
# AutoGen multi-agent
from autogen import ConversableAgent

assistant = ConversableAgent(
    name="assistant",
    llm_config={"model": "gpt-4o"}
)

user_proxy = ConversableAgent(
    name="user",
    human_input_mode="NEVER"
)

# Start conversation
user_proxy.initiate_chat(assistant, message="Hello!")
```

### Tasks:

- [ ] Build AI Agent với Semantic Kernel
- [ ] Tạo multi-agent system với AutoGen
- [ ] Deploy với Prompt Flow
- [ ] Implement function calling

---

## Giai Đoạn 4: Production (Ongoing)

### Deployment Options

| Option | Best For |
|--------|----------|
| Azure Container Apps | Scalable APIs |
| Azure Functions | Event-driven |
| AKS | Complex workloads |
| Static Web Apps | Frontend + API |

### Checklist:

- [ ] Setup Azure Container Apps
- [ ] Implement monitoring (App Insights)
- [ ] Setup cost alerts
- [ ] Implement rate limiting
- [ ] Content safety filters
- [ ] CI/CD pipeline

---

## Tài Nguyên Học Tập

### Microsoft Learn Paths

1. **AI-900**: Azure AI Fundamentals
2. **AI-102**: Azure AI Engineer Associate
3. **GitHub Copilot** learning path

### Hands-on Labs

- [Azure OpenAI Service Labs](https://learn.microsoft.com/training/paths/develop-ai-solutions-azure-openai/)
- [Semantic Kernel Samples](https://github.com/microsoft/semantic-kernel)
- [AutoGen Examples](https://github.com/microsoft/autogen)

### YouTube Channels

- Microsoft Developer
- Azure AI
- GitHub

---

## Certification Path

```
AI-900 (Foundation)
     |
     v
AI-102 (Developer)
     |
     v
AZ-305 (Architect) - Optional
```

---

**Xem thêm:**
- [Model Guide](models.md)
- [Tài nguyên học tập](resources.md)
- [Checklist theo dõi](/checklist/microsoft.md)
