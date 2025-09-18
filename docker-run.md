# Docker 运行说明

## 构建流程

### 1. 构建基础镜像
```bash
sudo docker build -f Dockerfile.base -t youtu-graphrag-base:latest .
```

### 2. 构建应用镜像
```bash
sudo docker build -f Dockerfile.app -t youtu-graphrag:latest .
```

### 3. 运行容器
```bash
sudo docker run -d -p 8000:8000 \
  -v $(pwd)/output:/youtu_graphrag/output \
  -v $(pwd)/retriever:/youtu_graphrag/retriever \
  --name youtu-graphrag \
  youtu-graphrag:latest
```

## 环境变量配置

创建 `.env` 文件（参考 `.env.example`）：
```env
LLM_MODEL=deepseek-chat
LLM_BASE_URL=https://api.deepseek.com
LLM_API_KEY=sk-xxxxxx
```

## 数据持久化

- `output/`：知识图谱和生成输出
- `retriever/`：检索缓存数据
- 日志：容器内 `/youtu_graphrag/output/logs/`

## 访问应用

应用启动后访问：http://localhost:8000

## 开发模式

如需开发调试，使用挂载代码的方式运行：
```bash
docker run -it -p 8000:8000 \
  -v $(pwd):/youtu_graphrag \
  -v $(pwd)/output:/youtu_graphrag/output \
  -v $(pwd)/retriever:/youtu_graphrag/retriever \
  --name youtu-graphrag-dev \
  youtu-graphrag-base:latest \
  uv run python backend.py
```