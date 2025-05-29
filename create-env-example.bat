@echo off
echo Creating .env.example file...

echo APP_NAME="Laravel App" > .env.example
echo APP_ENV=local >> .env.example
echo APP_KEY= >> .env.example
echo APP_DEBUG=true >> .env.example
echo APP_URL=http://localhost:8765 >> .env.example
echo. >> .env.example
echo LOG_CHANNEL=stack >> .env.example
echo LOG_DEPRECATIONS_CHANNEL=null >> .env.example
echo LOG_LEVEL=debug >> .env.example
echo. >> .env.example
echo DB_CONNECTION=mysql >> .env.example
echo DB_HOST=db >> .env.example
echo DB_PORT=3306 >> .env.example
echo DB_DATABASE=u932436910_bots >> .env.example
echo DB_USERNAME=u932436910_bots >> .env.example
echo DB_PASSWORD=q747DqEku?M >> .env.example
echo. >> .env.example
echo BROADCAST_DRIVER=log >> .env.example
echo CACHE_DRIVER=file >> .env.example
echo FILESYSTEM_DISK=local >> .env.example
echo QUEUE_CONNECTION=sync >> .env.example
echo SESSION_DRIVER=file >> .env.example
echo SESSION_LIFETIME=120 >> .env.example
echo. >> .env.example
echo MEMCACHED_HOST=127.0.0.1 >> .env.example
echo. >> .env.example
echo REDIS_HOST=redis >> .env.example
echo REDIS_PASSWORD=null >> .env.example
echo REDIS_PORT=6379 >> .env.example
echo. >> .env.example
echo MAIL_MAILER=smtp >> .env.example
echo MAIL_HOST=mailhog >> .env.example
echo MAIL_PORT=1025 >> .env.example
echo MAIL_USERNAME=null >> .env.example
echo MAIL_PASSWORD=null >> .env.example
echo MAIL_ENCRYPTION=null >> .env.example
echo MAIL_FROM_ADDRESS="hello@example.com" >> .env.example
echo MAIL_FROM_NAME="${APP_NAME}" >> .env.example
echo. >> .env.example
echo AWS_ACCESS_KEY_ID= >> .env.example
echo AWS_SECRET_ACCESS_KEY= >> .env.example
echo AWS_DEFAULT_REGION=us-east-1 >> .env.example
echo AWS_BUCKET= >> .env.example
echo AWS_USE_PATH_STYLE_ENDPOINT=false >> .env.example
echo. >> .env.example
echo PUSHER_APP_ID= >> .env.example
echo PUSHER_APP_KEY= >> .env.example
echo PUSHER_APP_SECRET= >> .env.example
echo PUSHER_HOST= >> .env.example
echo PUSHER_PORT=443 >> .env.example
echo PUSHER_SCHEME=https >> .env.example
echo PUSHER_APP_CLUSTER=mt1 >> .env.example
echo. >> .env.example
echo VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}" >> .env.example
echo VITE_PUSHER_HOST="${PUSHER_HOST}" >> .env.example
echo VITE_PUSHER_PORT="${PUSHER_PORT}" >> .env.example
echo VITE_PUSHER_SCHEME="${PUSHER_SCHEME}" >> .env.example
echo VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}" >> .env.example
echo. >> .env.example
echo RUN_MIGRATIONS=false >> .env.example

echo .env.example file created successfully!
echo. 