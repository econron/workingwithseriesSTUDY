=begin
Process.waitにより、子プロセスが全て終了するまで親プロセスを待たせることができる
=end
puts "parent process pid is #{Process.pid}"
fork do
  5.times do
    puts "child process is #{Process.pid}"
    sleep 1
    puts 'I am an orphan!'
  end
end
puts "#{Process.pid}"
puts Process.wait
# abort 'Parent process died...'

puts "parent process pid is #{Process.pid}"
3.times do
  fork do
    puts "child process is #{Process.pid}"
    sleep rand(5)
  end
end

3.times do
  puts Process.wait
end

favourite = fork do
  exit 77
end

middle_child = fork do
  abort 'I want to be waited on'
end

pid, status = Process.waitpid2 favourite
puts status.exitstatus