git clone git@github.com:Nifler/laravel-box.git www
GD=$(id -g ${USER}) UD=$(id -u ${USER}) docker-compose up -d --build
docker-compose exec php composer install
docker-compose exec php cp .env.example .env
docker-compose exec php php artisan key:generate
docker-compose exec php php artisan migrate
