＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝ PingPong サンプル

PingPong サンプルは、ToCoNet の単純な送受信の例です。
片方からブロードキャストメッセージ（同報通信）を送信すると、受信した
別方は送信元に対してメッセージを送り返します。

ノードＡ　　　　ノードＢ
   ｜－－－－－－－＞ PING メッセージ
   ＜－－－－－－－｜ PONG メッセージ

本ファームウェアには親子関係はなく、２台のノードに同じファームウェアを
書き込みます。特別な設定もありません。

◆ UART の設定
  UART0 115200bps 8bin None 1

◆ 実行例
=============== ノードＡ (t を押す)
# [t] -->
Fire PING Broadcast Message. <-- 1: Ping メッセージを送信した

[PKT Ad:81000038,Ln:018,Seq:019,Lq:228,Tms:39076 "PONG: 86300001C"] <-- 4:受信メッセージ
PONG Message from 81000038 <-- 5:Pong メッセージを受信した

=============== ノードＢ
[PKT Ad:86300001,Ln:018,Seq:019,Lq:222,Tms:40720 "PING: 86300001C"] <-- 2:受信メッセージ
Fire PONG Message to 86300001 <-- 3:Pong メッセージを送信し返した

  ※ 受信メッセージは複数回表示されることが有ります。送信元で３回送っているため。

◆ 主要関数
・void vHandleSerialInput()
  シリアルポートからの入力を処理する。

    - 't' 入力時に送信処理を行う

・void cbToCoNet_vRxEvent(tsRxDataApp *pRx)
  パケットの受信処理。

    - PING メッセージが来た時は PONG メッセージを送り元に対し送信する
    - PONG メッセージが来た時は UART にメッセージを出力する

・ToCoNet_bMacTxReq()
  ToCoNet のネットワーク無しモデル（中継層が無い）の送信手続き。

◆ その他
・'s' キー
  スリープのテストを行います。

＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝