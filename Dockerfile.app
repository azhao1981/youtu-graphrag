FROM youtu-graphrag-base:latest

# 复制项目代码
COPY . .

# 安装项目特定的spaCy中文模型
RUN uv pip install ./zh_core_web_lg-3.8.0.tar.gz

# 设置启动命令 - 直接使用uv运行backend.py
CMD ["uv", "run", "python", "backend.py"]