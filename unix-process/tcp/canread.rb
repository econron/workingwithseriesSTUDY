require 'socket'

# Socket.tcp_server_loop(4481) do |connection|
#   puts connection.read
#   puts connection.close
# end

one_kb = 1024 # bytes

Socket.tcp_server_loop(4481) do |connection|
  # Read data in chunks of 1 kb.
  while data = connection.read(one_kb) do
    puts data
  end

  connection.close
end

