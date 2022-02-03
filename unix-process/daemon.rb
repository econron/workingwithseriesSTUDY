=begin
・バックグラウンドで実行されるプロセス
　例：リクエストを処理するために常にバックグラウンドで実行されるwebサーバー、データベースサーバー

・OSの中核。
・システムを正常に起動させるためのプロセスの多くはデーモン。

RubyだとProcess.daemonでデーモンプロセスが作れる
中身について：
ジョブ制御：プロセスが端末によって処理される方法

プロセスグループ：
・全てのプロセスはグループに属し、各グループに一意の整数IDがある
・関連するプロセスのコレクション
　・通常、親プロセスとその子。
　・rubyだと、Process.setgrp(new_group_id)によりプロセスを任意にグループ化できる
=end
def daemonize_app
  if RUBY_VERSION < "1.9"
    exit if fork
    Process.setsid
    exit if fork
    Dir.chdir "/"
    STDIN.reopen "/dev/null"
    STDOUT.reopen "/dev/null", "a"
    STDERR.reopen "/dev/null", "a"
  else
    Process.daemon
  end
end