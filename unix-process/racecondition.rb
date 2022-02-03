2.times do
  fork do
    abort "Finished!"
  end
end

puts Process.wait
sleep 5

puts Process.wait

=begin
子プロセスを調べるという考え方は、一般的なUnixプログラミングパターンの中核。
ベビーシッタープロセス、マスタ/ワーカー、preforkとも呼ばれる。

このパターンの核になるのは
・並行性のため複数の子プロセスをフォークする１つのプロセスがあり、それらの処理に時間を費やす、という概念
　・応答性を維持したり、いずれかが終了した場合に反応したりする
=end