web: rake mara:start && bundle exec rails server -p $PORT
worker: bundle exec sidekiq -t 25 -e production -c 3
