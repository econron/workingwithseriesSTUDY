require 'socket'

server = TCPServer.new(4481)

Socket.accept_loop(server) do |connection|
  connection.close
end

=begin
ストリームについて・・・・
・クライアントは配列を送ったが
・サーバーは連続した１つのデータとして受信した
→　つまり、クライアントの意思に寄らない
=end