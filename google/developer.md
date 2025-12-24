# Lộ Trình Developer - Google AI 2025

> Hướng dẫn từ zero đến production với Google AI

---

## Tổng Quan Lộ Trình

```
Tháng 1-2: Nền tảng (Free tier)
    |
    v
Tháng 3-4: Gemini API & Vertex AI
    |
    v
Tháng 5-6: Production & Chứng chỉ
    |
    v
Chứng chỉ: Google Cloud ML/AI
```

---

## Giai Đoạn 1: Nền Tảng (MIỄN PHÍ)

### Tuần 1-2: Google AI Studio

- [ ] Tạo Google AI Studio account (miễn phí)
- [ ] Thử nghiệm Gemini 1.5 Flash
- [ ] Học prompt engineering cơ bản
- [ ] Export code snippets

### Tính năng Google AI Studio

```
Free Tier bao gồm:
- Gemini 1.5 Flash: 15 RPM, 1M TPD
- Gemini 1.5 Pro: 2 RPM, 50 RPD
- Prompt gallery
- Code export (Python, JS, cURL)
```

### Tuần 3-4: Colab & Kaggle

- [ ] Thành thạo Google Colab
- [ ] Học các techniques trên Kaggle
- [ ] Thử nghiệm free GPU/TPU
- [ ] Xây dựng dự án AI đầu tiên

### Tài nguyên miễn phí

| Platform | Free Tier |
|----------|-----------|
| AI Studio | Quota miễn phí rộng rãi |
| Colab | GPU miễn phí (T4) |
| Kaggle | 30 giờ GPU/tuần |

---

## Giai Đoạn 2: Phát triển với Gemini API

### Cài đặt

```python
# Cài đặt SDK
# pip install google-generativeai

import google.generativeai as genai

genai.configure(api_key="YOUR_API_KEY")

# Sử dụng Gemini 2.0 Flash
model = genai.GenerativeModel('gemini-2.0-flash-exp')

response = model.generate_content("Xin chào, Gemini!")
print(response.text)
```

### Tính năng chính

- [ ] Tạo văn bản
- [ ] Multimodal (hình ảnh, âm thanh, video)
- [ ] Chat/hội thoại
- [ ] Function calling
- [ ] Structured output (JSON mode)

### Ví dụ Multimodal

```python
import PIL.Image

# Tải hình ảnh
image = PIL.Image.open("photo.jpg")

# Phân tích với Gemini
response = model.generate_content([
    "Có gì trong hình này?",
    image
])
```

### Nhiệm vụ:

- [ ] Xây dựng ứng dụng chat
- [ ] Triển khai tính năng vision
- [ ] Sử dụng function calling
- [ ] Xử lý streaming responses

---

## Giai Đoạn 3: Vertex AI

### Thiết lập GCP Project

- [ ] Tạo Google Cloud account
- [ ] Bật Vertex AI API
- [ ] Thiết lập billing (miễn phí $300 credits)
- [ ] Cài đặt gcloud CLI

### Vertex AI Gemini

```python
from vertexai.generative_models import GenerativeModel
import vertexai

# Khởi tạo
vertexai.init(project="your-project", location="us-central1")

# Sử dụng model
model = GenerativeModel("gemini-1.5-pro")
response = model.generate_content("Xin chào!")
```

### Tính năng Vertex AI

| Tính năng | Mô tả |
|-----------|-------|
| Model Garden | Truy cập 150+ models |
| Agent Builder | Xây dựng AI hội thoại |
| Vertex AI Search | Tìm kiếm doanh nghiệp |
| Grounding | Kết nối với dữ liệu |

### Nhiệm vụ:

- [ ] Deploy Gemini trên Vertex AI
- [ ] Xây dựng RAG với Vertex AI Search
- [ ] Tạo agent với Agent Builder
- [ ] Triển khai grounding

---

## Giai Đoạn 4: Phát triển nâng cao

### Tích hợp LangChain

```python
from langchain_google_genai import ChatGoogleGenerativeAI

llm = ChatGoogleGenerativeAI(
    model="gemini-1.5-pro",
    temperature=0.7
)

response = llm.invoke("Xin chào!")
```

### Function Calling

```python
# Định nghĩa function
def get_weather(city: str) -> dict:
    return {"temp": 25, "condition": "sunny"}

# Tạo tool
weather_tool = genai.protos.Tool(
    function_declarations=[
        genai.protos.FunctionDeclaration(
            name="get_weather",
            description="Lấy thời tiết hiện tại",
            parameters=...
        )
    ]
)

# Sử dụng với model
model = genai.GenerativeModel(
    'gemini-1.5-pro',
    tools=[weather_tool]
)
```

### Nhiệm vụ:

- [ ] Tích hợp LangChain
- [ ] Function calling phức tạp
- [ ] Multi-step agents
- [ ] Custom embeddings

---

## Giai Đoạn 5: Production

### Các lựa chọn triển khai

| Lựa chọn | Phù hợp cho |
|----------|-------------|
| Cloud Run | APIs có thể scale |
| Cloud Functions | Event-driven |
| GKE | Workloads phức tạp |
| App Engine | Web apps |

### Triển khai Cloud Run

```yaml
# cloudbuild.yaml
steps:
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 'gcr.io/$PROJECT_ID/gemini-app', '.']
  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', 'gcr.io/$PROJECT_ID/gemini-app']
  - name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
    entrypoint: gcloud
    args:
      - 'run'
      - 'deploy'
      - 'gemini-app'
      - '--image=gcr.io/$PROJECT_ID/gemini-app'
      - '--region=us-central1'
```

### Checklist Production:

- [ ] Thiết lập Cloud Run
- [ ] Triển khai monitoring
- [ ] Xử lý lỗi
- [ ] Rate limiting
- [ ] Tối ưu chi phí
- [ ] Bảo mật (IAM, Secret Manager)

---

## Lộ trình chứng chỉ

### Chứng chỉ Google Cloud

```
Cloud Digital Leader (Nền tảng)
         |
         v
Professional ML Engineer
         |
         v
Professional Cloud Architect (Tùy chọn)
```

### Tài nguyên học tập

- [Google Cloud Skills Boost](https://www.cloudskillsboost.google/)
- [Hướng dẫn chứng chỉ chính thức](https://cloud.google.com/certification)

---

## Mẹo

### Tối ưu chi phí

1. **Bắt đầu với AI Studio** (miễn phí)
2. **Dùng Flash models** khi có thể
3. **Batch requests** để hiệu quả hơn
4. **Cache responses** khi phù hợp

### Best Practices phát triển

1. **Dùng streaming** để UX tốt hơn
2. **Triển khai retries** với exponential backoff
3. **Xử lý safety filters** một cách graceful
4. **Theo dõi token usage**

---

**Xem thêm:**
- [Hướng dẫn Model](models.md)
- [Tài nguyên học tập](resources.md)
- [Checklist theo dõi](/checklist/google.md)
