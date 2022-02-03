require 'socket'

# INETはinternetの略称
# IPv4のソケット
# STREAMにすることでUDPソケットを参照する
socket = Socket.new(Socket::AF_INET,Socket::SOCK_STREAM)

# ポート番号はソケットエンドポイントの拡張子

socket = Socket.new(:INET6, :STREAM)

=begin
ソケットのmanページ
1.一般コマンド
２.システムコール用
３.Cライブラリ関数用
4.特殊ファイル
5.ファイル形式
7.tcpが重要。さまざまな概念を説明する。

TCPは２つのエンドポイントで行われる通信
ソケットを作成する際、
イニシエーター、リスナーの２つの役割が必要
リッスンするソケット：サーバー
接続を開始するソケット：クライアント
=end


