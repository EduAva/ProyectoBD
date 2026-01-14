# Usamos PHP con Apache (servidor web)
FROM php:8.2-apache

# Instalamos las librerías necesarias para conectar con PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Copiamos tus archivos al servidor
COPY . /var/www/html/

# Le decimos a Render que escuche en el puerto 80
EXPOSE 80
