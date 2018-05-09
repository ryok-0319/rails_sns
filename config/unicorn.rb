rails_root = File.expand_path('../../', __FILE__)

worker_processes 2
working_directory rails_root

listen 3000
pid "#{rails_root}/tmp/unicorn.pid"

stderr_path "#{rails_root}/log/unicorn_error.log"
stdout_path "#{rails_root}/log/unicorn.log"
