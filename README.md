# Laravel PHP Project

This is a Laravel-based PHP application. The project has been dockerized for easy setup and development.

## Dockerized Setup Instructions

### Prerequisites

- Docker and Docker Compose installed on your machine
- Git

### Getting Started

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. Create a `.env.example` file by running the provided batch file (Windows):
   ```bash
   create-env-example.bat
   ```

   Or manually create a `.env.example` file with the content specified in the batch file.

3. Build and start the Docker containers:
   ```bash
   docker-compose up -d
   ```

4. The entrypoint script will automatically:
   - Create a `.env` file from `.env.example` if it doesn't exist
   - Generate the application key
   - Create storage link
   - Set proper permissions

5. To run migrations manually (if needed):
   ```bash
   docker-compose exec app php artisan migrate
   ```

### Accessing the Application

- Web Application: http://localhost:8765
- MySQL Database: host: localhost, port: 3307
- Redis: host: localhost, port: 6378
- MailHog (Email Testing): http://localhost:8026

### Default Admin Access

- Email: `admin@example.in`
- Password: `admin123`

## Project Structure

- All business logic is under `app/Yantrana/Components/`
- Frontend assets are in `public/dist`
- Uploaded media is stored in `public/media-storage`
- Database configuration and migrations are in the `database` directory

## Ports Used

This Docker configuration uses non-standard ports:
- Web Server: 8765 (instead of 80)
- MySQL: 3307 (instead of 3306)
- Redis: 6378 (instead of 6379)
- MailHog: 1026 and 8026 (instead of 1025 and 8025)

## Troubleshooting

- If you encounter database connection issues, make sure the correct credentials are in the `.env` file
- To check container logs: `docker-compose logs -f app`
- To restart a specific service: `docker-compose restart <service-name>`
- If you need to reset everything and start fresh: `docker-compose down -v` followed by `docker-compose up -d` 