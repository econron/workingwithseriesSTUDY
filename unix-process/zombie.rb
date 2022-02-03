=begin
ゾンビプロセス
・カーネルは終了した子プロセスに関するステータスをキューに入れる
・Process.waitのあとも、ステータス情報は引き続き利用可能。

カーネルは、親プロセスがProcess.wait使用してそのステータスを要求するまで、終了した子プロセスのステータスを保持する
つまり、親がステータスを要求しないと、カーネルはそのステータス情報を取得できない。
つまり
・子プロセスのステータス情報を取得しない
・fire and forgetのみですます
子プロセスを作成するのは、カーネルリソースの不適切な使用方法。

まとめ：
・ステータス情報を参照しないとカーネルリソースの使用が不適切になる


=end

puts "parent process pid is #{Process.pid}"
message = "hogehoge"
recipient = "my friend"

pid = fork do
  puts "child process is #{Process.pid}"
  puts message
  puts recipient
end

Process.detach(pid)
puts pid
# 結果は戻らなかった

#ゾンビの見方
pid = fork { sleep 1 }
puts pid
sleep 5