=begin
create
bind
listen
accept
close

バインドするポート番号
1~65535

0~1024：使用してはいけない
理由：システムで使用するために予約されているポートだから。

49000~65535：使用してはいけない
理由：このポートを利用すると一部のユーザーに害がある。

=end
# サーバーバインド
require "socket"

# サーバーは特定のポート番号にバインドする
# Create the server socket.
server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)

# Accept a connection.
connection, _ = server.accept

print 'Connection class: '
p connection.class

print 'Server fileno: '
p server.fileno

print 'Connection fileno: '
p connection.fileno

print 'Local address: '
p connection.local_address

print 'Remote address: '
p connection.remote_address