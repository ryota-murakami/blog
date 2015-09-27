namespace :unicornctl do
  desc "Start unicorn for production env."
  task start: :environment do
    config = File.expand_path('config/unicorn.conf', Rails.root)
    sh "bundle exec unicorn_rails -c #{config} -E production -D"
  end

  desc "Start unicorn for development env."
  task dev: :environment do
    config = File.expand_path('config/unicorn.conf', Rails.root)
    sh "bundle exec unicorn_rails -c #{config} -E development -D"
  end

  desc "Stop unicorn"
  task stop: :environment do
    unicorn_signal :QUIT
  end

  desc "Restart unicorn with USR2"
  task restart: :environment do
    unicorn_signal :USR2
  end

  desc "Increment number of worker processes"
  task increment: :environmen do
    unicorn_signal :TTIN
  end

  desc "Decrement number of worker processes"
  task decrement: :environment do
    unicorn_signal :TTOU
  end

  desc "Unicorn pstree (depends on pstree command)"
  task pstree: :environment do
    sh "pstree '#{unicorn_pid}'"
  end

  def unicorn_signal signal
    Process.kill signal, unicorn_pid
  end

  def unicorn_pid
    begin
      File.read(File.expand_path('tmp/pids/unicorn.pid', Rails.root)).to_i
    rescue Errno::ENOENT
      raise "Unicorn doesn't seem to be running"
    end
  end
end
