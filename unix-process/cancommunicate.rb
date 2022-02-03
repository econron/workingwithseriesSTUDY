=begin
パイプ：データの単方向ストリーム

パイプを開く
一方がパイプの端をリクエスト
もう一方がパイプのもう1つの端をリクエスト
→　データをパイプによって渡す

親リーダー：端 open
親ライター：端 close
子リーダー：端 ???
子ライター：端 open close
=end

#パイプを作成する方法
reader, writer = IO.pipe
writer.write("Into the pipe I go")
writer.close
puts reader.read

#パイプの共有
reader, writer = IO.pipe
fork do
  # EOFの送信を妨げないよう、パイプの未使用の端が閉じられている
  # ファイル記述子がコピーされたため、4つのインスタンスが浮かんでいる
  # 2つだけが通信に使用される。
  # 他のインスタンス２つを閉じる必要がある。
  reader.close
  10.times do
    writer.puts "Another one bites the dust"
  end
end

writer.close
while message = reader.gets
  $stdout.puts message
end