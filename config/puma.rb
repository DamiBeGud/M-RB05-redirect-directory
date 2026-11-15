bind "tcp://0.0.0.0:#{ENV.fetch('PORT','8405')}"
threads 1,3
environment ENV.fetch('RAILS_ENV','production')
