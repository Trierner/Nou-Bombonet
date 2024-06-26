# Proyecto React y Laravel
![React](https://img.shields.io/badge/-React-61DBFB?style=for-the-badge&labelColor=black&logo=react&logoColor=61DBFB)
![Laravel](https://img.shields.io/badge/-Laravel-FF2D20?style=for-the-badge&labelColor=black&logo=laravel&logoColor=FF2D20)

Este repositorio contiene un proyecto que integra React en el frontend y Laravel en el backend. Proporciona una estructura básica para comenzar a desarrollar una aplicación web completa.

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalados los siguientes requisitos:

- **PHP**: Instalado y configurado correctamente. Se recomienda usar XAMPP para un entorno local.
  - Descarga XAMPP: [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html)

- **Composer**: Herramienta de gestión de dependencias de PHP.
  - Instalación de Composer: [https://getcomposer.org/download/](https://getcomposer.org/download/)

- **Node.js y npm**: Instalados globalmente en tu máquina.
  - Descarga Node.js: [https://nodejs.org/](https://nodejs.org/)

## Configuración del Proyecto

Sigue estos pasos para configurar y ejecutar el proyecto localmente:

### Backend (Laravel)

1. Instala las dependencias de Composer:

   ```bash
   composer install

2. Instala las dependencias de npm:

   ```bash
   npm install

3. Copia el archivo de configuración .env.example y configúralo con tus detalles de base de datos:

    ```bash
    cp .env.example .env

4. Genera la clave de aplicación:

    ```bash
    php artisan key:generate

5. Importa la BBDD que esta en la carpeta de SQL

6. Inicia el servidor de desarrollo de Laravel:

    ```bash
    php artisan serve

### Frontend (React)

1. Instala las dependencias de npm:

   ```bash
   npm install

2. Inicia la aplicación React:

   ```bash
   npm start

## Comandos Disponibles

En el directorio del proyecto frontend (`frontend`), puedes ejecutar los siguientes comandos:

    npm start       # Inicia la aplicación en modo de desarrollo.
    npm run build   # Compila la aplicación para producción en la carpeta build.
    npm test        # Inicia el corredor de pruebas en modo interactivo.

En el directorio del proyecto backend (`backend`), puedes ejecutar comandos Laravel estándar como `php artisan ...` para gestionar rutas, controladores, modelos y más.

## Notas Adicionales

- Asegúrate de tener una base de datos configurada correctamente en tu entorno local para que Laravel pueda conectarse.
- Para más detalles sobre Laravel, consulta la [documentación oficial de Laravel](https://laravel.com/docs).
- Para más detalles sobre React, consulta la [documentación oficial de React](https://reactjs.org/docs).