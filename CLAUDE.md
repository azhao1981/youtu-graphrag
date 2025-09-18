# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 🏗️ Architecture Overview

Youtu-GraphRAG is a vertically unified agentic framework for Graph Retrieval-Augmented Generation. The architecture consists of:

### Core Components
- **Knowledge Graph Construction** (`models/constructor/`): Builds hierarchical knowledge trees from documents
- **Agentic Retrieval** (`models/retriever/`): Schema-aware query decomposition and parallel processing
- **Community Detection** (`utils/tree_comm.py`): Hierarchical community detection with semantic fusion
- **Web Interface** (`backend.py`, `frontend/`): FastAPI backend with web UI

### Key Data Flow
1. Document ingestion → Knowledge Graph construction (4-level hierarchy)
2. Query → Schema-aware decomposition → Parallel sub-query processing
3. Retrieval → Community-based reasoning → Answer generation

## 🚀 Development Commands

### Environment Setup
```bash
# Install dependencies
./setup_env.sh

# Start development server
./start.sh
```

### Docker Deployment
```bash
# Build Docker image
docker build -t youtu_graphrag:v1 .

# Run container
docker run -d -p 8000:8000 youtu_graphrag:v1
```

### Manual Setup
```bash
# Install Python dependencies
pip install -r requirements.txt

# Download spaCy model
python -m spacy download en_core_web_lg

# Start backend server
python backend.py
```

## 📁 Project Structure

```
youtu-graphrag/
├── config/           # Configuration system (YAML-based)
├── models/           # Core ML models
│   ├── constructor/  # Knowledge graph construction
│   └── retriever/    # Retrieval and decomposition
├── utils/            # Utility modules
├── schemas/          # Dataset schemas
├── frontend/         # Web interface assets
├── output/           # Generated outputs
│   ├── graphs/       # Knowledge graphs
│   ├── chunks/       # Text chunks
│   └── logs/         # Runtime logs
├── main.py           # CLI entry point
├── backend.py        # Web server entry point
└── requirements.txt  # Python dependencies
```

## 🔧 Configuration

Configuration is managed through `config/base_config.yaml` with runtime overrides via environment variables. Key config sections:
- `llm`: LLM API settings (OpenAI-compatible)
- `graph_construction`: Knowledge graph building parameters
- `retrieval`: Retrieval and ranking settings
- `community_detection`: Community detection algorithms

## 🎯 Entry Points

- **Web Interface**: `backend.py` (FastAPI server on port 8000)
- **CLI Interface**: `main.py` (command-line processing)
- **Batch Processing**: Use `main.py` with appropriate arguments

## 📊 Output Locations

- Knowledge Graphs: `output/graphs/`
- Text Chunks: `output/chunks/`
- Logs: `output/logs/`
- Retrieval Cache: `retriever/` directory

## 🔍 Key Dependencies

- **Web Framework**: FastAPI + Uvicorn
- **ML/Embeddings**: PyTorch, Sentence Transformers, FAISS
- **NLP**: spaCy, Transformers
- **Graph Processing**: NetworkX
- **Configuration**: PyYAML, Pydantic

The framework is designed for enterprise-scale deployment with minimal manual intervention for new domains.