=begin
プロセスはシグナルを取得できる
・「親プロセスが忙しい」・・・・・？
　→　つまりブロッキング呼び出ししている暇がない・・・？
=end

child_processes = 3
dead_processes = 0

child_processes.times do
  fork do
    sleep 3
  end
end

trap(:CHLD) do
  begin
    while pid = Process.wait(-1, Process::WNOHANG)
      puts pid
      dead_processes += 1
    end
    rescue Errno::ECHILD
  end
end

loop do
  exit if dead_processes == child_processes
  sleep 1
end