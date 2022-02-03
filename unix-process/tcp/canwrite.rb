require "socket"

Socket.tcp_server_loop(4481) do |connection|
  connection.write("welcome!")
  connection.close
end

=begin
writeメソッドが実行されたあと唯一保証されているのは、データが転送されたということ。
writeメソッド利用時は、全てのデータがRAMに書き込まれないよう考慮する必要がある。
=end