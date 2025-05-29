#!/bin/bash

# Setup script for Laravel Docker deployment
echo "Setting up Laravel Docker deployment..."

# Create .env.example file if not exists
if [ ! -f .env.example ] && [ -f ".env copy" ]; then
    echo "Creating .env.example file from .env copy..."
    cp ".env copy" .env.example
fi

# Create .env file if not exists
if [ ! -f .env ]; then
    echo "Creating .env file..."
    cp ".env copy" .env

    # Update DB connection details for Docker
    sed -i 's/DB_HOST=localhost/DB_HOST=db/g' .env
    sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=secure_db_password/g' .env
    sed -i 's/APP_ENV=development/APP_ENV=production/g' .env
    sed -i 's/APP_DEBUG=true/APP_DEBUG=false/g' .env
    
    # Add Redis host
    echo "REDIS_HOST=redis" >> .env
    
    # Update SMTP configuration
    sed -i 's/MAIL_MAILER=sendmail/MAIL_MAILER=smtp/g' .env
    sed -i 's/MAIL_HOST=smtp.mailtrap.io/MAIL_HOST=smtp.eu.mailgun.org/g' .env
    sed -i 's/MAIL_PORT=2525/MAIL_PORT=587/g' .env
    sed -i 's/MAIL_USERNAME=null/MAIL_USERNAME=whatsapp@mail.codecrumble.in/g' .env
    sed -i 's/MAIL_PASSWORD=null/MAIL_PASSWORD=Whatsapp@00code/g' .env
    sed -i 's/MAIL_ENCRYPTION=null/MAIL_ENCRYPTION=tls/g' .env
    sed -i 's/MAIL_FROM_ADDRESS=null/MAIL_FROM_ADDRESS=whatsapp@mail.codecrumble.in/g' .env
fi

# Make sure docker directory files are executable
echo "Setting permissions for scripts..."
chmod +x docker/entrypoint.sh
chmod +x docker/healthcheck.sh

# Start Docker containers with forced rebuild
echo "Starting Docker containers..."
docker compose up -d --build --force-recreate

echo "Setup complete! Your Laravel application should now be running."
echo "To check container status: docker compose ps"
echo "To view logs: docker compose logs -f app" 