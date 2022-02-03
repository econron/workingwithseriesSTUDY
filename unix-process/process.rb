=begin
・Unixは全てがファイル（ソケット、ネットワーク、プロセス、ファイルなどをまとめてリソースと呼ぶ）
・ファイル記述子番号は、未使用の最低値が割り当て
・リソースが閉じられた時点で、ファイル記述子番号が使用可能になる
→　Unixカーネルの視点から・・・
　・リソースが閉じられると、カーネルがリソースの追跡を停止できるようハードウェアレイヤと対話する必要がなくなる

p Process.getrlimit(:NOFILE)
結果：
[10240, 9223372036854775807]

0：ファイル記述子の数のソフト制限
1：ファイル記述子の数のハード制限

ソフト制限：この数を超えると例外が生じる。ただし、その制限数を必要に応じて変更可能

プロセスにはargがある
argv　→　引数ベクトルの短縮形

プロセスには名前がある
プロセスには終了コードがある

プロセスはフォークできる
・フォークを開始するプロセスは親と呼ばれる
・新しく作成されたプロセスは子と呼ばれる

子プロセス
・親プロセスで使用されている全てのメモリのコピー
・親プロセスに属する開いているファイル記述子
を継承する。
→　つまりフォークするとメモリを２倍消費する・・・？

計測してみた結果・・・
parent process pid is 84938
entered the if block from 84938
entered the else block from 84942
Process: 84938: RSS = 24.768 MB, VSZ = 408437.136 MB
Process: 84942: RSS = 1.6 MB, VSZ = 4735.12 MB
・RSS：プロセスが確保している物理メモリサイズ
・VSZ：プロセスが確保している仮想メモリサイズ

子プロセスがコピーするものはなんだ・・・？

孤立したプロセス：
ターミナルを介してプロセスを開始する場合、書き込みやSTDOUT、キーボード入力を受け付けるのは１プロセス。
親プロセスが終了しても、子プロセスは残り続ける

デーモンプロセス：意図的に孤立し、永久に実行され続けることを目的とした長時間実行プロセス
ターミナルセッションに接続されていないプロセスとの通信

プロセスはCoWフレンドリー
CoW：コピーオンライトという名称のセマンティクス。

=end

puts "parent process pid is #{Process.pid}"

if fork
  puts "entered the if block from #{Process.pid}"
else
  puts "entered the else block from #{Process.pid}"
end

rss = `ps -o rss= -p #{Process.pid}`.to_i * 0.001
vsz = `ps -o vsz= -p #{Process.pid}`.to_i * 0.001
puts "Process: #{Process.pid}: RSS = #{rss} MB, VSZ = #{vsz} MB"

arr = [1,2,3]

fork do
  p arr
end