FROM youtu-graphrag-base:latest

# 安装项目特定的spaCy中文模型
COPY ./zh_core_web_lg-3.8.0.tar.gz .
RUN UV_HTTP_TIMEOUT=300 uv pip install ./zh_core_web_lg-3.8.0.tar.gz -i https://mirrors.cloud.tencent.com/pypi/simple
RUN rm zh_core_web_lg-3.8.0.tar.gz

# 复制项目代码
COPY . .

# COPY ./utils/logger.py /youtu_graphrag/utils/logger.py
# COPY ./frontend/index.html /youtu_graphrag/frontend/index.html

# 设置启动命令 - 直接使用uv运行backend.py
CMD ["uv", "run", "python", "backend.py"]