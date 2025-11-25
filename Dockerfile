# Usar una imagen base de Python ligera
FROM python:3.10-slim

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el archivo de requisitos e instalar las dependencias
# Esto aprovecha el cache de Docker: si los requisitos no cambian, este paso no se ejecuta de nuevo
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto en el que se ejecutará la API (Uvicorn por defecto usa 8000)
EXPOSE 8000

# Comando para ejecutar la aplicación con uvicorn, escuchando en todas las interfaces de red
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
