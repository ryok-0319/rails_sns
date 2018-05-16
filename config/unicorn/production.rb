worker_processes ENV['WORKER_PROCESSES'].to_i

application_path = '/home/ubuntu/rails_sns'

listen 3000
pid File.expand_path('unicorn.pid', '/tmp')

preload_app true

before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = "#{application_path}/Gemfile"
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = ((worker.nr + 1) >= server.worker_processes) ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      warn 'Process already dead'
    end
  end
  sleep 1
end
