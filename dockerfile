# Imagem base oficial do Python (leve)
FROM python:3.12-slim
 
# Diretório de trabalho dentro do container
WORKDIR /app
 
# Evita arquivos .pyc e força saída de log sem buffer
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
 
# Copia apenas o requirements primeiro (cache de build mais eficiente)
COPY requirements.txt .
 
RUN pip install --no-cache-dir -r requirements.txt
 
# Copia o restante do código da aplicação
COPY . .
 
# Porta que o Flask vai expor
EXPOSE 5000
 
# Comando para iniciar a aplicação em produção (Gunicorn)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "3", "app:app"]
 