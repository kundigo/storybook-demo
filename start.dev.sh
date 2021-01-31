echo 'set -e ---------------------------------------------'
set -e
echo 'foreman run yarn install ---------------------------'
foreman run yarn install
echo 'foreman run bundle install --------------------------'
foreman run bundle install
echo 'foreman run docker-compose up -d --------------------'
foreman run docker-compose up -d
echo 'foreman run bundle exec rake db:migrate -------------'
foreman run bundle exec rake db:migrate
echo 'foreman run bundle exec rake db:test:prepare --------'
foreman run bundle exec rake db:test:prepare
echo 'foreman start -f Procfile.dev -----------'
foreman start -f Procfile.dev

