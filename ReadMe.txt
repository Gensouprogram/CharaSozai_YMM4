======================================================================================== 
              きつね式ゆっくり立ち絵ymm4対応コンバーターの説明書 
                              Version 1.3.1
======================================================================================== 
機能==================================================================================== 
・口パクと瞬きの素材を両方同時変換できます。 
・きつね式ゆっくりなどは一括で自動変換可能です。 
・それ以外も単体で指定して変換可能です。 
・"D&D"式ではなくファイルパス指定式です。 
・実行ファイルはBatファイルのみでほとんどのWindowsで動きます。 
・自分でBatファイルを編集することにより、口調の変更やせりふの変更が可能になります
・folder.txtに使用するフォルダパスを入力して多数の変換が簡単になります
動作OS================================================================================== 
　Windows 95/98/2000/Me/XP/Vista/7/8/10/11/その他Server系
推奨OS==================================================================================
　Windows 8.1/10/21
　（YMM4対応OSに合わせています）
  Windows XP/Vista/7/8の方はYMM3までしか対応していないので必要ありません
注意事項================================================================================ 
・ファイルパス・フォルダパスは"C:\yukkrui"のように、ファイル名まで指定してください。 
・フォルダパスに最後に"\"を入れるとうまく変換できなくなります。 
・一括変換選択の場合、すべてのキャラクターを参照するため、31分程度変換にはかかります。 
・一括変換は一部のキャラクターのみしか対応していません。
・ほとんどのwindowsで動きますが、処理速度はPCの性能に依存します。 
アンインストール======================================================================== 
このフォルダごと削除してアンインストールできます。 
対応キャラ素材スクリプト================================================================
　|一括変換|単体変換|該当ゆっくり
5f|　 Ｘ　 |　 〇　 |私式、新きつね式(単体)
4a|　 △　 |　 〇　 |
1a|　 〇 　|　 〇　 |ゆっくりキャラ素材
	凡例（半霊）　○：変換可能
　　　　　　　　　　　△：一部可能
		　　　Ｘ：変換不可

対応ゆっくり============================================================================
　　　　|きつね式（東方）|きつね式（その他）|新きつね式|らくがき式|神威式|私式|ぷに|きつねキャラ|ゆっくりキャラ|QH式|二ヶのん式|とりみそ式|みかん式|ふにちか式|dairi&はるか式|
一括変換|　　　 ○ 　　　|　　　　○　　　　|　　Ｘ　　|　　○　　|　○　| Ｘ | ○ |　　 ○ 　　|　　　〇　　　| ー |　　Ｘ　　|　　○　　|　 ○ 　|　　Ｘ　　| 不要(PSD式)　|
単体変換|　　　 ○ 　　　|　　　　○　　　　|　　○　　|　　○　　|　○　| Ｘ | ○ |　　 ○ 　　|　　　〇　　　| ー |　　○　　|　　○　　|　 ○ 　|　　○　　| 不要(PSD式)　|
 Y M M 4|　　　 △ 　　　|　　　　△　　　　|　　△　　|　　△　　|　△　| Ｘ | △ |　　 △ 　　|　　　Ｘ　　　| ● |　　△　　|　　△　　|　 △ 　|　　△　　| 　　○　　 　|
 Y M M 3|　　　 ○ 　　　|　　　　○　　　　|　　Ｘ　　|　　○　　|　○　| Ｘ | ○ |　　 ○ 　　|　　　Ｘ　　　| 〇 |　　〇　　|　　〇　　|　 〇 　|　　〇　　| 　　Ｘ　　 　|
 Y M M 2|　　　 Ｘ 　　　|　　　　Ｘ　　　　|　　Ｘ　　|　　Ｘ　　|　Ｘ　| Ｘ | Ｘ |　　 Ｘ 　　|　　　〇　　　| Ｘ |　　Ｘ　　|　　Ｘ　　|　 Ｘ 　|　　Ｘ　　| 　　Ｘ　　 　|

　　凡例（半霊）　○：変換可能（なお「ファイルが見つかりません」と出る場合がありますがゆっくりによっては出てくるので無視してください
　　　　　　　　　Ｘ：変換不可
		　ー：変換不要
　　YMMのバージョンの場合　○：そのまま使えます
			　 ●：変換が不要な場合があります（下記を確認）
			　 △：変換して使えます
			　 Ｘ：使えません
　　QH式の場合：Ver1.0のみ対応しています。
		YMM4は、Ver2.0以降なら動作します。
		それ以外の場合は、変換必要です
　　ふにちか式の場合：PSDが配布されています。
		　　　霊夢と魔理沙だけ動くキャラ素材がありますが、2キャラだけなので単体変換を使用してください
更新記録================================================================================ 
・V1.0   単体フォルダのみの変換 
・V1.1   キャラごとの変換 
・V1.2   ツンデレなどの口調選択
　　　   脱Python
　　　   すべてのゆっくりが自動変換できるように 
・V1.2.1 東方系ゆっくり以外の他キャラ対応
　　　　 新きつね式対応に
・V1.3　 大幅な軽量化
         一括変換のシステムをまるごと変更
　　　 　一括変換対応のゆっくりが増加
・V1.3.1 一括変換の高速化（回数当たりで1.32倍、キャラ当たりでは1.8倍高速化）
	 一括変換対応のゆっくりが増加
　　　　 ファイルパスを何回も指定しなくてよいように
	 続けて変換できるように
一括変換の時間を計測している端末のスペック==============================================
PC:GPD P2 MAX
CPU:Intel Core m3-8100Y
GPU:Intel UHD Graphics 615
メモリ:16GB
ディスク容量:512GB PCle SSD