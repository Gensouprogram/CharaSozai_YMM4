title ゆっくり・立ち絵ymm4対応コンバーター Version 1.3.1
@echo off
setlocal
:setting
cls
rem タイトル表示
echo =============================================
echo   いろいろゆっくり立ち絵ymm4対応コンバーター
echo              Version 1.3.1919810
echo ---------------------------------------------
echo 対応ゆっくり一覧
echo ・きつね式ゆっくり（全種一括変換対応）
echo ・新きつね式ゆっくり（一括変換未対応）
echo ・らくがき式キャラ素材（一括変換対応）
echo ・神威式ゆっくり（一括変換対応）
echo ・ぷにゆっくり（一括変換対応）
echo ・きつねキャラ素材（一括変換対応）
echo ・ゆっくりキャラ素材（一括変換対応）
echo ・二ヶのん式ゆっくり（一括変換未対応）
echo ・とりみそ式ゆっくり（一括変換対応）
echo ・みかん式立ち絵（一括変換対応）
echo ・ふにちか式立ち絵（一括変換未対応）
echo =============================================
echo.

echo モードを選択してください。
echo 1.通常口調
echo h.helpを表示

:settone

set /p x="口調選択："
if "%x%" == "1" (
    echo 通常口調が選択されました。
    set word=1.単体ファイルのみ変換、2.きつね式対応のすべての東方系ゆっくり変換のどちらを選びますか？ 
    set word2=コンバートしたいゆっくり立ち絵がまとまって入っているフォルダのパスを入力してください
    set word3=コンバートしたいゆっくり立ち絵単体キャラのフォルダのパスを入力してください
    set word4=開始します。処理には1分30秒程度かかります。
    set word5=処理が終了しました。変換されていないファイルがあったら単体ファイルのみで変換してください。
    set word6=処理が終了しました。変換されていないファイルがあったらもう一度やり直すか、手作業で変換してください。
    set word7=Enterキーで終了します。
    set NotFound=ファイルを指定してください。
    set cancel=再度指定します。
    set NoAnswer=再度設定してください。
) else (
    echo.
    echo きつね式ゆっくり立ち絵ymm4対応コンバーター
    echo Version 1.3.1
    echo 更新内容
    echo ・一括変換の高速化
    echo ・一括変換対応のゆっくりが増加
    echo ・ファイルパスを何回も指定しなくてよいように
	echo ・続けて変換できるように
    echo ※対応立ち絵はタイトル画面に記述しています。
    echo.
  goto :settone
)

:selectwhich

echo.
rem 一括もしくは単体のどちらかを選ぶ
echo %word%
set /p which="変換設定(1/2)>>>"
if "%which%" == "2" (
    rem 続きへ
) else if "%which%" == "1" (
    goto :only
) else (
    echo "%"NoAnswer%"
    goto :selectwhich
)

echo %word2%

rem 名前指定
echo 1.名前を指定する
echo 2.名前を指定せずfolder.txtからロードする
set /p ans=">>>"
if "%ans%" == "1" (
    goto :allname
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
goto :endallname

:allname
rem パス指定
set /p folder="パスを入力（￥を最後に入れる）>>>"
:endallname
rem ﾓｰﾄﾞ
echo 1.ゆっくりキャラ素材を一括変換 2.それ以外を一括変換
set /p ans=">>>"
if "%ans%" == "1" (
    goto :yukkurichara
)
rem 確認
echo ファイルパス:%folder%
echo モード:一括変換
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

rem 全キャラYMM3 to YMM4 変換
rem 画面リセット
rem 初期状態にする
set frame=1
set add=1
set name=00
set chara=1
set charaname=\あきゅう
rem キャラ数(目口セット,新式は2)
set /a maxchara=156*284
:run
rem cls
rem frameを数値にして、元と後を設定。空白は不可なので仮定する。
if %frame% == 2 (
    set framename=a
    set endname=.1
) else if %frame% == 3 (
    set framename=b
    set endname=.2
) else if %frame% == 4 (
    set framename=c
    set endname=.3
) else if %frame% == 5 (
    set framename=d
    set endname=.4
) else if %frame% == 6 (
    set framename=e
    set endname=x
)
rem 進展用echo
set /a progress=progress+1
rem 確認用echo
echo %folder%%charaname%\口\%name%%framename%.png ーー＞ %name%%endname%.png %progress%/%maxchara%
rem 装飾
rem frameが2~5で変換でき、それ以外はエラー吐く
ren %folder%%charaname%\口\%name%%framename%.png %framename%%endname%.png
rem frameが1で変換でき、それ以外はエラー吐く
ren %folder%%charaname%\口\%name%.png %framename%.0.png
rem frameが6で変換でき、それ以外はエラー吐く
ren %folder%%charaname%\口\%name%x.png %framename%.png
rem frame追加
set /a frame=frame+1
rem frameが7を超えた場合、frameを1にリセットしてnameを1増加する
    if %frame% == 7 (
        rem 続きへ
    ) else (
        goto :run
    )
    set frame=1
    rem nameが1~9なら、最初に0を付ける（ファイルの都合上）
    if %name% == 00 (
        set name=01
        goto :next
    )
    if %name% == 01 (
        set name=02
        goto :next
    )
    if %name% == 02 (
        set name=03
        goto :next
    )
    if %name% == 03 (
        set name=04
        goto :next
    )
    if %name% == 04 (
        set name=05
        goto :next
    )
    if %name% == 05 (
        set name=06
        goto :next
    )
    if %name% == 06 (
        set name=07
        goto :next
    )
    if %name% == 07 (
        set name=08
        goto :next
    )
    if %name% == 08 (
        set name=09
        goto :next
    )
    if %name% == 09 (
        set name=10
        goto :next
    ) else (
        set /a name=name+1
    )
    :next
    rem nameが19を超えた場合、nameを00にリセットしてcharaを1追加する
    if %name% == 19 (
        rem 続きへ
    ) else (
        goto :run
    )
    set name=0
    :eye
    rem cls
rem frameを数値にして、元と後を設定。空白は不可なので仮定する。
if %frame% == 2 (
    set framename=a
    set endname=.1
) else if %frame% == 3 (
    set framename=b
    set endname=.2
) else if %frame% == 4 (
    set framename=c
    set endname=.3
) else if %frame% == 5 (
    set framename=d
    set endname=.4
) else if %frame% == 6 (
    set framename=e
    set endname=x
)
rem 進展用echo
set /a progress=progress+1
rem 確認用echo
echo %folder%%charaname%\目\0%name%%framename%.png ーー＞ %name%%endname%.png %progress%/%maxchara%
rem 装飾
rem frameが2~5で変換でき、それ以外はエラー吐く
ren %folder%%charaname%\目\0%name%%framename%.png %framename%%endname%.png
rem frameが1で変換でき、それ以外はエラー吐く
ren %folder%%charaname%\目\0%name%.png %framename%.0.png
rem frameが6で変換でき、それ以外はエラー吐く
ren %folder%%charaname%\目\0%name%x.png %framename%.png
rem frame追加
set /a frame=frame+1
rem frameが7を超えた場合、frameを1にリセットしてnameを1増加する
    if %frame% == 7 (
        rem 続きへ
    ) else (
        goto :eye
    )
    set frame=1
    set /a name=name+1
    rem nameが7を超えた場合、nameを00にリセットしてcharaを1追加する
    if %name% == 7 (
        rem 続きへ
    ) else (
        goto :eye
    )
    set name=00
    set /a chara=chara+1
    rem キャラに応じて名前変更。通常は目と口の二個記述、新きつねは目と口,aとbの合計4つを記述。
    rem きつね式ゆっくり
    rem 東方系ゆっくり
if %chara% == 2 (
        set charaname=\あきゅう
        goto :run
    )
    if %chara% == 3 (
        set charaname=\ありす
        goto :run
    )
    if %chara% == 4 (
        set charaname=\いく
        goto :run
    )
    if %chara% == 5 (
        set charaname=\いちりん
        goto :run
    )
    if %chara% == 6 (
        set charaname=\うどんげ
        goto :run
    )
    if %chara% == 7 (
        set charaname=\えいき
        goto :run
    )
    if %chara% == 8 (
        set charaname=\えーりん
        goto :run
    )
    if %chara% == 9 (
        set charaname=\おくう
        goto :run
    )
    if %chara% == 10 (
        set charaname=\おりん
        goto :run
    )
    if %chara% == 11 (
        set charaname=\かぐや
        goto :run
    )
    if %chara% == 12 (
        set charaname=\かげろう
        goto :run
    )
    if %chara% == 13 (
        set charaname=\かせん
        goto :run
    )
    if %chara% == 14 (
        set charaname=\かなこ
        goto :run
    )
    if %chara% == 15 (
        set charaname=\きすめ
        goto :run
    )
    if %chara% == 16 (
        set charaname=\きめぇまる
        goto :run
    )
    if %chara% == 17 (
        set charaname=\きもけーね
        goto :run
    )
    if %chara% == 18 (
        set charaname=\きょうこ
        goto :run
    )
    if %chara% == 19 (
        set charaname=\けーね
        goto :run
    )
    if %chara% == 20 (
        set charaname=\こあくま
        goto :run
    )
    if %chara% == 21 (
        set charaname=\こいし
        goto :run
    )
    if %chara% == 22 (
        set charaname=\こがさ
        goto :run
    )
    if %chara% == 23 (
        set charaname=\こころ
        goto :run
    )
    if %chara% == 24 (
        set charaname=\こすず
        goto :run
    )
    if %chara% == 25 (
        set charaname=\こまち
        goto :run
    )
    if %chara% == 26 (
        set charaname=\こーりん
        goto :run
    )
    if %chara% == 27 (
        set charaname=\さくや
        goto :run
    )
    if %chara% == 28 (
        set charaname=\さとり
        goto :run
    )
    if %chara% == 29 (
        set charaname=\さなえ
        goto :run
    )
    if %chara% == 30 (
        set charaname=\さにーみるく
        goto :run
    )
    if %chara% == 31 (
        set charaname=\しずは
        goto :run
    )
    if %chara% == 32 (
        set charaname=\しゃめいまる
        goto :run
    )
    if %chara% == 33 (
        set charaname=\しゅがーさてら
        goto :run
    )
    if %chara% == 34 (
        set charaname=\しんみょうまる
        goto :run
    )
    if %chara% == 35 (
        set charaname=\すいか
        goto :run
    )
    if %chara% == 36 (
        set charaname=\すたーさふぁいあ
        goto :run
    )
    if %chara% == 37 (
        set charaname=\すわこ
        goto :run
    )
    if %chara% == 38 (
        set charaname=\せいが
        goto :run
    )
    if %chara% == 39 (
        set charaname=\せいじゃ
        goto :run
    )
    if %chara% == 40 (
        set charaname=\せきばんき
        goto :run
    )
    if %chara% == 41 (
        set charaname=\だいようせい
        goto :run
    )
    if %chara% == 42 (
        set charaname=\ちぇん
        goto :run
    )
    if %chara% == 43 (
        set charaname=\ちるの
        goto :run
    )
    if %chara% == 44 (
        set charaname=\てゐ
        goto :run
    )
    if %chara% == 45 (
        set charaname=\てんこ
        goto :run
    )
    if %chara% == 46 (
        set charaname=\ときこ
        goto :run
    )
    if %chara% == 47 (
        set charaname=\とじこ
        goto :run
    )
    if %chara% == 48 (
        set charaname=\とよひめ
        goto :run
    )
    if %chara% == 49 (
        set charaname=\とらまる
        goto :run
    )
    if %chara% == 50 (
        set charaname=\なずーりん
        goto :run
    )
    if %chara% == 51 (
        set charaname=\にとり
        goto :run
    )
    if %chara% == 52 (
        set charaname=\ぬえ
        goto :run
    )
    if %chara% == 53 (
        set charaname=\のうかりん
        goto :run
    )
    if %chara% == 54 (
        set charaname=\はたて
        goto :run
    )
    if %chara% == 55 (
        set charaname=\ぱちゅりー
        goto :run
    )
    if %chara% == 56 (
        set charaname=\ぱるすぃ
        goto :run
    )
    if %chara% == 57 (
        set charaname=\ひじり
        goto :run
    )
    if %chara% == 58 (
        set charaname=\ひな
        goto :run
    )
    if %chara% == 59 (
        set charaname=\ふと
        goto :run
    )
    if %chara% == 60 (
        set charaname=\ふらん
        goto :run
    )
    if %chara% == 61 (
        set charaname=\べんべん
        goto :run
    )
    if %chara% == 62 (
        set charaname=\まみぞう
        goto :run
    )
    if %chara% == 63 (
        set charaname=\まりさ
        goto :run
    )
    if %chara% == 64 (
        set charaname=\みこ
        goto :run
    )
    if %chara% == 65 (
        set charaname=\みすちー
        goto :run
    )
    if %chara% == 66 (
        set charaname=\みすちー２
        goto :run
    )
    if %chara% == 67 (
        set charaname=\みのりこ
        goto :run
    )
    if %chara% == 68 (
        set charaname=\むらさ
        goto :run
    )
    if %chara% == 69 (
        set charaname=\めーりん
        goto :run
    )
    if %chara% == 70 (
        set charaname=\めかにとり
        goto :run
    )
    if %chara% == 71 (
        set charaname=\めでぃすん
        goto :run
    )
    if %chara% == 72 (
        set charaname=\めりー
        goto :run
    )
    if %chara% == 73 (
        set charaname=\めるらん
        goto :run
    )
    if %chara% == 74 (
        set charaname=\もこう
        goto :run
    )
    if %chara% == 75 (
        set charaname=\もみじ
        goto :run
    )
    if %chara% == 76 (
        set charaname=\やまめ
        goto :run
    )
    if %chara% == 77 (
        set charaname=\やつはし
        goto :run
    )
    if %chara% == 78 (
        set charaname=\ゆうか
        goto :run
    )
    if %chara% == 79 (
        set charaname=\ゆうぎ
        goto :run
    )
    if %chara% == 80 (
        set charaname=\ゆかり
        goto :run
    )
    if %chara% == 81 (
        set charaname=\ゆゆこ
        goto :run
    )
    if %chara% == 82 (
        set charaname=\ようむ
        goto :run
    )
    if %chara% == 83 (
        set charaname=\よしか
        goto :run
    )
    if %chara% == 84 (
        set charaname=\よりひめ
        goto :run
    )
    if %chara% == 85 (
        set charaname=\らいこ
        goto :run
    )
    if %chara% == 86 (
        set charaname=\らん
        goto :run
    )
    if %chara% == 87 (
        set charaname=\りぐる
        goto :run
    )
    if %chara% == 88 (
        set charaname=\りりーぶらっく
        goto :run
    )
    if %chara% == 89 (
        set charaname=\りりーほわいと
        goto :run
    )
    if %chara% == 90 (
        set charaname=\りりか
        goto :run
    )
    if %chara% == 91 (
        set charaname=\るーみあ
        goto :run
    )
    if %chara% == 92 (
        set charaname=\るなさ
        goto :run
    )
    if %chara% == 93 (
        set charaname=\るなちゃいるど
        goto :run
    )
    if %chara% == 94 (
        set charaname=\れいせん
        goto :run
    )
    if %chara% == 95 (
        set charaname=\れいむ
        goto :run
    )
    if %chara% == 96 (
        set charaname=\れてぃ
        goto :run
    )
    if %chara% == 97 (
        set charaname=\れみりあ
        goto :run
    )
    if %chara% == 98 (
        set charaname=\れんこ
        goto :run
    )
    if %chara% == 99 (
        set charaname=\わかさぎひめ
        goto :run
    )
    rem VOCALOID系ゆっくり
    if %chara% == 100 (
        set charaname=\いあ
        goto :run
    )
    if %chara% == 101 (
        set charaname=\きよてる
        goto :run
    )
    if %chara% == 102 (
        set charaname=\かる
        goto :run
    )
    if %chara% == 103 (
        set charaname=\ぐみ
        goto :run
    )
    if %chara% == 104 (
        set charaname=\ここね
        goto :run
    )
    if %chara% == 105 (
        set charaname=\ちか
        goto :run
    )
    if %chara% == 106 (
        set charaname=\ねる
        goto :run
    )
    if %chara% == 107 (
        set charaname=\はく
        goto :run
    )
    if %chara% == 108 (
        set charaname=\まゆ
        goto :run
    )
    if %chara% == 109 (
        set charaname=\みく
        goto :run
    )
    if %chara% == 110 (
        set charaname=\ゆきみく
        goto :run
    )
    if %chara% == 111 (
        set charaname=\りりー
        goto :run
    )
    if %chara% == 112 (
        set charaname=\りん
        goto :run
    )
    if %chara% == 113 (
        set charaname=\るか
        goto :run
    )
    if %chara% == 114 (
        set charaname=\れん
        goto :run
    )
    if %chara% == 115 (
        set charaname=\ろろ
        goto :run
    )
rem UTAU系ゆっくり
    if %chara% == 116 (
        set charaname=\てと
        goto :run
    )
    if %chara% == 117 (
        set charaname=\でふぉこ
        goto :run
    )
    if %chara% == 118 (
        set charaname=\もも
        goto :run
    )
rem ボイスロイド系ゆっくり
    if %chara% == 119 (
        set charaname=\あおい
        goto :run
    )
    if %chara% == 120 (
        set charaname=\あかね
        goto :run
    )
    if %chara% == 121 (
        set charaname=\ずんこ
        goto :run
    )
    if %chara% == 122 (
        set charaname=\まき
        goto :run
    )
    if %chara% == 123 (
        set charaname=\ゆづきゆかり
        goto :run
    )
rem CeVIO系ゆっくり
    if %chara% == 124 (
        set charaname=\おね
        goto :run
    )
    if %chara% == 125 (
        set charaname=\ささら
        goto :run
    )
    if %chara% == 126 (
        set charaname=\たかはし
        goto :run
    )
    if %chara% == 127 (
        set charaname=\つづみ
        goto :run
    )
rem 艦これ系ゆっくり
    if %chara% == 128 (
        set charaname=\あおば
        goto :run
    )
    if %chara% == 129 (
        set charaname=\さみだれ
        goto :run
    )
    if %chara% == 130 (
        set charaname=\提督
        goto :run
    )
rem その他
    if %chara% == 131 (
        set charaname=\罪袋
        goto :run
    )
rem らくがき式
    if %chara% == 132 (
        set charaname=\らくがき式霊夢
        goto :run
    )
    if %chara% == 133 (
        set charaname=\らくがき式魔理沙
        goto :run
    )
    if %chara% == 134 (
        set charaname=\らくがき式諏訪子
        goto :run
    )
    if %chara% == 135 (
        set charaname=\らくがき式フラン
        goto :run
    )
    if %chara% == 136 (
        set charaname=\らくがき式レミリア
        goto :run
    )
    if %chara% == 137 (
        set charaname=\らくがき式パチュリー
        goto :run
    )
    if %chara% == 138 (
        set charaname=\らくがき式妹紅
        goto :run
    )
    if %chara% == 139 (
        set charaname=\らくがき式妖夢
        goto :run
    )
    if %chara% == 140 (
        set charaname=\らくがき式蓮子
        goto :run
    )
    if %chara% == 141 (
        set charaname=\らくがき式咲夜
        goto :run
    )
    if %chara% == 142 (
        set charaname=\らくがき式萃香
        goto :run
    )
    if %chara% == 143 (
        set charaname=\らくがき式こいし
        goto :run
    )
    if %chara% == 144 (
        set charaname=\らくがき式こころ
        goto :run
    )
    if %chara% == 145 (
        set charaname=\らくがき式華扇
        goto :run
    )
    if %chara% == 146 (
        set charaname=\らくがき式天子
        goto :run
    )
    if %chara% == 147 (
        set charaname=\らくがき式神子
        goto :run
    )
    if %chara% == 148 (
        set charaname=\らくがき式鈴仙
        goto :run
    )
    if %chara% == 149 (
        set charaname=\らくがき式お燐
        goto :run
    )
    if %chara% == 150 (
        set charaname=\らくがき式ルーミア
        goto :run
    )
    if %chara% == 151 (
        set charaname=\らくがき式チルノ
        goto :run
    )
    if %chara% == 152 (
        set charaname=\らくがき式アリス
        goto :run
    )
    if %chara% == 153 (
        set charaname=\らくがき式さとり
        goto :run
    )
    if %chara% == 154 (
        set charaname=\らくがき式布都
        goto :run
    )
    if %chara% == 155 (
        set charaname=\らくがき式大妖精
        goto :run
    )
    if %chara% == 156 (
        set charaname=\らくがき式結月ゆかり
        goto :run
    )
    if %chara% == 157 (
        set charaname=\らくがき式ナズーリン
        goto :run
    )
    if %chara% == 158 (
        set charaname=\らくがき式橙
        goto :run
    )
    if %chara% == 159 (
        set charaname=\らくがき式メリー
        goto :run
    )
rem 神威式
    if %chara% == 160 (
        set charaname=\神威式霊夢
        goto :run
    )
    if %chara% == 161 (
        set charaname=\神威式魔理沙
        goto :run
    )
    if %chara% == 162 (
        set charaname=\神威式妖夢
        goto :run
    )
    if %chara% == 163 (
        set charaname=\神威式チルノ
        goto :run
    )
    if %chara% == 164 (
        set charaname=\神威式早苗
        goto :run
    )
    if %chara% == 165 (
        set charaname=\神威式咲夜
        goto :run
    )
    if %chara% == 166 (
        set charaname=\神威式文
        goto :run
    )
    if %chara% == 167 (
        set charaname=\神威式優曇華
        goto :run
    )
    if %chara% == 168 (
        set charaname=\神威式魅魔
        goto :run
    )
    if %chara% == 169 (
        set charaname=\神威式麟
        goto :run
    )
    if %chara% == 170 (
        set charaname=\神威式旧作霊夢
        goto :run
    )
    if %chara% == 171 (
        set charaname=\神威式旧作魔理沙
        goto :run
    )
    if %chara% == 172 (
        set charaname=\神威式旧作魔理沙
        goto :run
    )
    if %chara% == 173 (
        set charaname=\神威式旧作幽香
        goto :run
    )
    if %chara% == 174 (
        set charaname=\神威式神玉（女）
        goto :run
    )
    if %chara% == 175 (
        set charaname=\神威式神玉（男）
        goto :run
    )
    if %chara% == 176 (
        set charaname=\神威式コンガラ
        goto :run
    )
    if %chara% == 177 (
        set charaname=\神威式サリエル
        goto :run
    )
    if %chara% == 178 (
        set charaname=\神威式幽幻魔眼
        goto :run
    )
    if %chara% == 179 (
        set charaname=\神威式キクリ
        goto :run
    )
    if %chara% == 180 (
        set charaname=\神威式エリス
        goto :run
    )
    if %chara% == 181 (
        set charaname=\神威式魔梨沙
        goto :run
    )
    if %chara% == 182 (
        set charaname=\神威式魔天使
        goto :run
    )
    if %chara% == 183 (
        set charaname=\神威式呪い子
        goto :run
    )
    if %chara% == 184 (
        set charaname=\神威式明羅
        goto :run
    )
    if %chara% == 185 (
        set charaname=\神威式里香
        goto :run
    )
rem ぷにゆっくり
    if %chara% == 186 (
        set charaname=\ぷにちるの
        goto :run
    )
    if %chara% == 187 (
        set charaname=\ぷにふと
        goto :run
    )
    if %chara% == 188 (
        set charaname=\ぷにふらん
        goto :run
    )
    if %chara% == 189 (
        set charaname=\ぷにまりさ
        goto :run
    )
    if %chara% == 190 (
        set charaname=\ぷにれいむ
        goto :run
    )
    if %chara% == 191 (
        set charaname=\ぷにれみりあ
        goto :run
    )
    if %chara% == 192 (
        set charaname=\ぷにずんこ
        goto :run
    )
    if %chara% == 193 (
        set charaname=\ぷにでふぉこ
        goto :run
    )
    if %chara% == 194 (
        set charaname=\ぷにまき
        goto :run
    )
    if %chara% == 195 (
        set charaname=\ぷにゆかり
        goto :run
    )
    if %chara% == 196 (
        set charaname=\ぷにいちご
        goto :run
    )
    if %chara% == 197 (
        set charaname=\ぷにつるまる
        goto :run
    )
rem きつねキャラ素材
    if %chara% == 198 (
        set charaname=\ずんこさん
        goto :run
    )
    if %chara% == 199 (
        set charaname=\まりささん
        goto :run
    )
    if %chara% == 200 (
        set charaname=\ぐみさん
        goto :run
    )
    if %chara% == 201 (
        set charaname=\れいむさん
        goto :run
    )
    if %chara% == 202 (
        set charaname=\みくさん
        goto :run
    )
    if %chara% == 203 (
        set charaname=\ゆかりさん
        goto :run
    )
    if %chara% == 204 (
        set charaname=\ささらさん
        goto :run
    )
rem QH式ゆっくり
    if %chara% == 205 (
        set charaname=\QH式こいし
        goto :run
    )
    if %chara% == 206 (
        set charaname=\QH式アリス
        goto :run
    )
    if %chara% == 207 (
        set charaname=\QH式チルノ
        goto :run
    )
    if %chara% == 208 (
        set charaname=\QH式パチュリー
        goto :run
    )
    if %chara% == 209 (
        set charaname=\QH式フランドール
        goto :run
    )
    if %chara% == 210 (
        set charaname=\QH式リグル
        goto :run
    )
    if %chara% == 211 (
        set charaname=\QH式レミリア
        goto :run
    )
    if %chara% == 212 (
        set charaname=\QH式咲夜
        goto :run
    )
    if %chara% == 213 (
        set charaname=\QH式妖夢
        goto :run
    )
    if %chara% == 214 (
        set charaname=\QH式文
        goto :run
    )
    if %chara% == 215 (
        set charaname=\QH式慧音
        goto :run
    )
    if %chara% == 216 (
        set charaname=\QH式早苗
        goto :run
    )
    if %chara% == 217 (
        set charaname=\QH式霊夢
        goto :run
    )
    if %chara% == 218 (
        set charaname=\QH式魔理沙
        goto :run
    )
rem みかん式
    if %chara% == 219 (
        set charaname=\みかん式ゆっくりアリス
        goto :run
    )
    if %chara% == 220 (
        set charaname=\みかん式ゆっくり阿求
        goto :run
    )
    if %chara% == 221 (
        set charaname=\みかん式ゆっくりこーりん
        goto :run
    )
    if %chara% == 222 (
        set charaname=\みかん式ゆっくりきめぇまる
        goto :run
    )
    if %chara% == 223 (
        set charaname=\みかん式ゆっくり小悪魔
        goto :run
    )
    if %chara% == 224 (
        set charaname=\みかん式ゆっくりこいし
        goto :run
    )
    if %chara% == 225 (
        set charaname=\みかん式ゆっくりこころ
        goto :run
    )
    if %chara% == 226 (
        set charaname=\みかん式ゆっくりこまち
        goto :run
    )
    if %chara% == 227 (
        set charaname=\みかん式ゆっくり咲夜
        goto :run
    )
    if %chara% == 228 (
        set charaname=\みかん式ゆっくりさとり
        goto :run
    )
    if %chara% == 229 (
        set charaname=\みかん式ゆっくり早苗
        goto :run
    )
    if %chara% == 230 (
        set charaname=\みかん式ゆっくりサニーミルク
        goto :run
    )
    if %chara% == 231 (
        set charaname=\みかん式ゆっくり射命丸
        goto :run
    )
    if %chara% == 232 (
        set charaname=\みかん式ゆっくり四季映姫
        goto :run
    )
    if %chara% == 233 (
        set charaname=\みかん式ゆっくりすいか
        goto :run
    )
    if %chara% == 234 (
        set charaname=\みかん式ゆっくりすわこ
        goto :run
    )
    if %chara% == 235 (
        set charaname=\みかん式ゆっくり瀬笈葉
        goto :run
    )
    if %chara% == 236 (
        set charaname=\みかん式ゆっくり赤蛮奇
        goto :run
    )
    if %chara% == 237 (
        set charaname=\みかん式ゆっくり大妖精
        goto :run
    )
    if %chara% == 238 (
        set charaname=\みかん式ゆっくりチルノ
        goto :run
    )
    if %chara% == 239 (
        set charaname=\みかん式ゆっくりなずーりん
        goto :run
    )
    if %chara% == 240 (
        set charaname=\みかん式ゆっくりパチュリー
        goto :run
    )
    if %chara% == 241 (
        set charaname=\みかん式ゆっくりパルスィ
        goto :run
    )
    if %chara% == 242 (
        set charaname=\みかん式ゆっくりフラン
        goto :run
    )
    if %chara% == 243 (
        set charaname=\みかん式ゆっくり魔理沙
        goto :run
    )
    if %chara% == 244 (
        set charaname=\みかん式ゆっくり神子
        goto :run
    )
    if %chara% == 245 (
        set charaname=\みかん式ゆっくりメリー
        goto :run
    )
    if %chara% == 246 (
        set charaname=\みかん式ゆっくり美鈴
        goto :run
    )
    if %chara% == 247 (
        set charaname=\みかん式ゆっくり妹紅
        goto :run
    )
    if %chara% == 248 (
        set charaname=\みかん式ゆっくり椛
        goto :run
    )
    if %chara% == 249 (
        set charaname=\みかん式ゆっくり幽々子
        goto :run
    )
    if %chara% == 250 (
        set charaname=\みかん式ゆっくり妖夢
        goto :run
    )
    if %chara% == 251 (
        set charaname=\みかん式ゆっくりリリーホワイト
        goto :run
    )
    if %chara% == 252 (
        set charaname=\みかん式ゆっくりルーミア
        goto :run
    )
    if %chara% == 253 (
        set charaname=\みかん式ゆっくり霊夢
        goto :run
    )
    if %chara% == 254 (
        set charaname=\みかん式ゆっくりレミリア
        goto :run
    )
    if %chara% == 255 (
        set charaname=\みかん式ゆっくりレティ
        goto :run
    )
    if %chara% == 256 (
        set charaname=\みかん式ゆっくり蓮子
        goto :run
    )
    if %chara% == 257 (
        set charaname=\みかん式ゆっくり弦巻マキ
        goto :run
    )
    if %chara% == 258 (
        set charaname=\みかん式ゆっくり結月ゆかり
        goto :run
    )
    if %chara% == 259 (
        set charaname=\みかん式ゆっくり琴葉茜
        goto :run
    )
    if %chara% == 260 (
        set charaname=\みかん式ゆっくり琴葉葵
        goto :run
    )
    if %chara% == 261 (
        set charaname=\みかん式ゆっくり東北ずん子
        goto :run
    )
    if %chara% == 262 (
        set charaname=\みかん式ゆっくり東北きりたん
        goto :run
    )
    if %chara% == 263 (
        set charaname=\みかん式ゆっくりIA
        goto :run
    )
    if %chara% == 264 (
        set charaname=\みかん式うぷ主ちゃん（赤）
        goto :run
    )
    if %chara% == 265 (
        set charaname=\みかん式うぷ主ちゃん（黒）
        goto :run
    )
    if %chara% == 266 (
        set charaname=\みかん式うぷ主ちゃん（赤サイドテール）
        goto :run
    )
    if %chara% == 267 (
        set charaname=\みかん式うぷ主ちゃん（サイドテール金髪）
        goto :run
    )
    if %chara% == 268 (
        set charaname=\みかん式うぷ主ちゃん（金サイドテール）        goto :run
    )
    if %chara% == 269 (
        set charaname=\みかん式うぷ主ちゃん（ポニーテール赤）
        goto :run
    )
    if %chara% == 270 (
        set charaname=\みかん式うぷ主ちゃん（ポニーテール金）
        goto :run
    )
    if %chara% == 271 (
        set charaname=\みかん式うぷ主ちゃん（ポニーテール黒）
        goto :run
    )
rem とりみそ式
    if %chara% == 272 (
        set charaname=\霊夢キャラ
        goto :run
    )
    if %chara% == 273 (
        set charaname=\魔理沙キャラ
        goto :run
    )
    if %chara% == 274 (
        set charaname=\フランキャラ
        goto :run
    )
    if %chara% == 275 (
        set charaname=\妖夢キャラ
        goto :run
    )
    if %chara% == 276 (
        set charaname=\こいしキャラ
        goto :run
    )
    if %chara% == 277 (
        set charaname=\諏訪子キャラ
        goto :run
    )
    if %chara% == 278 (
        set charaname=\レミリアキャラ
        goto :run
    )
    if %chara% == 279 (
        set charaname=\早苗キャラ
        goto :run
    )
    if %chara% == 280 (
        set charaname=\蓮子キャラ
        goto :run
    )
    if %chara% == 281 (
        set charaname=\もみじキャラ
        goto :run
    )
    if %chara% == 282 (
        set charaname=\れいせんキャラ
        goto :run
    )
    if %chara% == 283 (
        set charaname=\ゆゆこキャラ
        goto :run
    )
    if %chara% == 284 (
        set charaname=\青霊夢キャラ
        goto :run
    )
cls
rem タイトル表示
echo =============================================
echo   きつね式ゆっくり立ち絵ymm4対応コンバーター
echo              Version 1.3.1
echo ---------------------------------------------
echo 口パク・瞬き両方同時変換
echo 東方系ゆっくりの全キャラは一括で自動変換可能
echo それ以外も単体で可能
echo ファイルパス指定式
echo =============================================
echo.
title きつね式ゆっくりymm4対応コンバーター Version 1.3.1 【変換終了】
echo %word5%
echo %word7%
pause
exit

rem ゆっくりキャラ素材一括変換

:yukkurichara

rem 確認
echo ファイルパス：%folder%
echo ﾓｰﾄﾞ：ゆっくりキャラ素材一括変換
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
    ren %folder%\ゆっくり霊夢\口\00.png 00.0.png
    ren %folder%\ゆっくり霊夢\口\01.png 00.1.png
    ren %folder%\ゆっくり霊夢\口\02.png 00.2.png
    ren %folder%\ゆっくり霊夢\口\03.png 00.3.png
    ren %folder%\ゆっくり霊夢\口\04.png 00.4.png
    ren %folder%\ゆっくり霊夢\口\05.png 00.png
    ren %folder%\ゆっくり魔理沙\口\00.png 00.0.png
    ren %folder%\ゆっくり魔理沙\口\01.png 00.1.png
    ren %folder%\ゆっくり魔理沙\口\02.png 00.2.png
    ren %folder%\ゆっくり魔理沙\口\03.png 00.3.png
    ren %folder%\ゆっくり魔理沙\口\04.png 00.4.png
    ren %folder%\ゆっくり魔理沙\口\05.png 00.png
    ren %folder%\ゆっくり妖夢\口\00.png 00.0.png
    ren %folder%\ゆっくり妖夢\口\01.png 00.1.png
    ren %folder%\ゆっくり妖夢\口\02.png 00.2.png
    ren %folder%\ゆっくり妖夢\口\03.png 00.3.png
    ren %folder%\ゆっくり妖夢\口\04.png 00.4.png
    ren %folder%\ゆっくり妖夢\口\05.png 00.png
    ren %folder%\ゆっくり霊夢\目\00.png 00.0.png
    ren %folder%\ゆっくり霊夢\目\01.png 00.1.png
    ren %folder%\ゆっくり霊夢\目\02.png 00.2.png
    ren %folder%\ゆっくり霊夢\目\03.png 00.3.png
    ren %folder%\ゆっくり霊夢\目\04.png 00.4.png
    ren %folder%\ゆっくり霊夢\目\05.png 00.png
    ren %folder%\ゆっくり魔理沙\目\00.png 00.0.png
    ren %folder%\ゆっくり魔理沙\目\01.png 00.1.png
    ren %folder%\ゆっくり魔理沙\目\02.png 00.2.png
    ren %folder%\ゆっくり魔理沙\目\03.png 00.3.png
    ren %folder%\ゆっくり魔理沙\目\04.png 00.4.png
    ren %folder%\ゆっくり魔理沙\目\05.png 00.png
    ren %folder%\ゆっくり妖夢\目\00.png 00.0.png
    ren %folder%\ゆっくり妖夢\目\01.png 00.1.png
    ren %folder%\ゆっくり妖夢\目\02.png 00.2.png
    ren %folder%\ゆっくり妖夢\目\03.png 00.3.png
    ren %folder%\ゆっくり妖夢\目\04.png 00.4.png
    ren %folder%\ゆっくり妖夢\目\05.png 00.png
    ren %folder%\ゆっくり霊夢改\口\00.png 00.0.png
    ren %folder%\ゆっくり霊夢改\口\01.png 00.1.png
    ren %folder%\ゆっくり霊夢改\口\02.png 00.2.png
    ren %folder%\ゆっくり霊夢改\口\03.png 00.3.png
    ren %folder%\ゆっくり霊夢改\口\04.png 00.4.png
    ren %folder%\ゆっくり霊夢改\口\05.png 00.png
    ren %folder%\ゆっくり魔理沙改\口\00.png 00.0.png
    ren %folder%\ゆっくり魔理沙改\口\01.png 00.1.png
    ren %folder%\ゆっくり魔理沙改\口\02.png 00.2.png
    ren %folder%\ゆっくり魔理沙改\口\03.png 00.3.png
    ren %folder%\ゆっくり魔理沙改\口\04.png 00.4.png
    ren %folder%\ゆっくり魔理沙改\口\05.png 00.png
    ren %folder%\ゆっくり妖夢改\口\00.png 00.0.png
    ren %folder%\ゆっくり妖夢改\口\01.png 00.1.png
    ren %folder%\ゆっくり妖夢改\口\02.png 00.2.png
    ren %folder%\ゆっくり妖夢改\口\03.png 00.3.png
    ren %folder%\ゆっくり妖夢改\口\04.png 00.4.png
    ren %folder%\ゆっくり妖夢改\口\05.png 00.png
    ren %folder%\ゆっくり霊夢改\目\00.png 00.0.png
    ren %folder%\ゆっくり霊夢改\目\01.png 00.1.png
    ren %folder%\ゆっくり霊夢改\目\02.png 00.2.png
    ren %folder%\ゆっくり霊夢改\目\03.png 00.3.png
    ren %folder%\ゆっくり霊夢改\目\04.png 00.4.png
    ren %folder%\ゆっくり霊夢改\目\05.png 00.png
    ren %folder%\ゆっくり魔理沙改\目\00.png 00.0.png
    ren %folder%\ゆっくり魔理沙改\目\01.png 00.1.png
    ren %folder%\ゆっくり魔理沙改\目\02.png 00.2.png
    ren %folder%\ゆっくり魔理沙改\目\03.png 00.3.png
    ren %folder%\ゆっくり魔理沙改\目\04.png 00.4.png
    ren %folder%\ゆっくり魔理沙改\目\05.png 00.png
    ren %folder%\ゆっくり妖夢改\目\00.png 00.0.png
    ren %folder%\ゆっくり妖夢改\目\01.png 00.1.png
    ren %folder%\ゆっくり妖夢改\目\02.png 00.2.png
    ren %folder%\ゆっくり妖夢改\目\03.png 00.3.png
    ren %folder%\ゆっくり妖夢改\目\04.png 00.4.png
    ren %folder%\ゆっくり妖夢改\目\05.png 00.png
    goto :onlyend
rem 単体変換

:only

echo どの立ち絵のタイプを変換しますか？
echo きつね・らくがき・神威・私・ぷに・きつねキャラ・ゆっくりキャラ・二ヶのん・とりみそ・みかん・ふにちか・dairi＆はるか式の立ち絵（k or 未入力）
echo 新きつねゆっくり（n）
echo ゆっくりキャラ素材（y）
set /p which="変換設定(1/2)>>>"
if "%which%" == "k" (
    rem 続きへ
) else if "%which%" == "n" (
    goto :newkitune
) else if "%which%" == "y" (
    goto :onlychara
) else (
    rem 続きへ
)

echo %word3%

rem 名前指定
echo 1.名前を指定する
echo 2.名前を指定せずfolder.txtからロードする
set /p ans=">>>"
if "%ans%" == "1" (
    goto :name1
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
echo キャラを指定してください
set /p charactor=">>>"
set folder=%folder%/%charactor%
goto :endname1
:name1

rem パス指定
set /p folder="パスを入力>>>"

:endname1

rem 確認
echo ファイルパス:%folder%
echo モード:単体きつね・らくがき・神威式ゆっくり
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

rem 一体当たりの変換
    ren %folder%\口\00.png 00.0.png
    ren %folder%\口\00a.png 00.1.png
    ren %folder%\口\00b.png 00.2.png
    ren %folder%\口\00c.png 00.3.png
    ren %folder%\口\00d.png 00.4.png
    ren %folder%\口\00e.png 00.png
    ren %folder%\口\01.png 01.0.png
    ren %folder%\口\01a.png 01.1.png
    ren %folder%\口\01b.png 01.2.png
    ren %folder%\口\01c.png 01.3.png
    ren %folder%\口\01d.png 01.4.png
    ren %folder%\口\01e.png 01.png
    ren %folder%\口\02.png 02.0.png
    ren %folder%\口\02a.png 02.1.png
    ren %folder%\口\02b.png 02.2.png
    ren %folder%\口\02c.png 02.3.png
    ren %folder%\口\02d.png 02.4.png
    ren %folder%\口\02e.png 02.png
    ren %folder%\口\03.png 03.0.png
    ren %folder%\口\03a.png 03.1.png
    ren %folder%\口\03b.png 03.2.png
    ren %folder%\口\03c.png 03.3.png
    ren %folder%\口\03d.png 03.4.png
    ren %folder%\口\03e.png 03.png
    ren %folder%\口\04.png 04.0.png
    ren %folder%\口\04a.png 04.1.png
    ren %folder%\口\04b.png 04.2.png
    ren %folder%\口\04c.png 04.3.png
    ren %folder%\口\04d.png 04.4.png
    ren %folder%\口\04e.png 04.png
    ren %folder%\口\05.png 05.0.png
    ren %folder%\口\05a.png 05.1.png
    ren %folder%\口\05b.png 05.2.png
    ren %folder%\口\05c.png 05.3.png
    ren %folder%\口\05d.png 05.4.png
    ren %folder%\口\05e.png 05.png
    ren %folder%\口\06.png 06.0.png
    ren %folder%\口\06a.png 06.1.png
    ren %folder%\口\06b.png 06.2.png
    ren %folder%\口\06c.png 06.3.png
    ren %folder%\口\06d.png 06.4.png
    ren %folder%\口\06e.png 06.png
    ren %folder%\口\07.png 07.0.png
    ren %folder%\口\07a.png 07.1.png
    ren %folder%\口\07b.png 07.2.png
    ren %folder%\口\07c.png 07.3.png
    ren %folder%\口\07d.png 07.4.png
    ren %folder%\口\07e.png 07.png
    ren %folder%\口\08.png 08.0.png
    ren %folder%\口\08a.png 08.1.png
    ren %folder%\口\08b.png 08.2.png
    ren %folder%\口\08c.png 08.3.png
    ren %folder%\口\08d.png 08.4.png
    ren %folder%\口\08e.png 08.png
    ren %folder%\口\09.png 09.0.png
    ren %folder%\口\09a.png 09.1.png
    ren %folder%\口\09b.png 09.2.png
    ren %folder%\口\09c.png 09.3.png
    ren %folder%\口\09d.png 09.4.png
    ren %folder%\口\09e.png 09.png
    ren %folder%\口\10.png 10.0.png
    ren %folder%\口\10a.png 10.1.png
    ren %folder%\口\10b.png 10.2.png
    ren %folder%\口\10c.png 10.3.png
    ren %folder%\口\10d.png 10.4.png
    ren %folder%\口\10e.png 10.png
    ren %folder%\口\11.png 11.0.png
    ren %folder%\口\11a.png 11.1.png
    ren %folder%\口\11b.png 11.2.png
    ren %folder%\口\11c.png 11.3.png
    ren %folder%\口\11d.png 11.4.png
    ren %folder%\口\11e.png 11.png
    ren %folder%\口\12.png 12.0.png
    ren %folder%\口\12a.png 12.1.png
    ren %folder%\口\12b.png 12.2.png
    ren %folder%\口\12c.png 12.3.png
    ren %folder%\口\12d.png 12.4.png
    ren %folder%\口\12e.png 12.png
    ren %folder%\口\13.png 13.0.png
    ren %folder%\口\13a.png 13.1.png
    ren %folder%\口\13b.png 13.2.png
    ren %folder%\口\13c.png 13.3.png
    ren %folder%\口\13d.png 13.4.png
    ren %folder%\口\13e.png 13.png
    ren %folder%\口\14.png 14.0.png
    ren %folder%\口\14a.png 14.1.png
    ren %folder%\口\14b.png 14.2.png
    ren %folder%\口\14c.png 14.3.png
    ren %folder%\口\14d.png 14.4.png
    ren %folder%\口\14e.png 14.png
    ren %folder%\口\15.png 15.0.png
    ren %folder%\口\15a.png 15.1.png
    ren %folder%\口\15b.png 15.2.png
    ren %folder%\口\15c.png 15.3.png
    ren %folder%\口\15d.png 15.4.png
    ren %folder%\口\15e.png 15.png
    ren %folder%\口\16.png 16.0.png
    ren %folder%\口\16a.png 16.1.png
    ren %folder%\口\16b.png 16.2.png
    ren %folder%\口\16c.png 16.3.png
    ren %folder%\口\16d.png 16.4.png
    ren %folder%\口\16e.png 16.png
    ren %folder%\口\17.png 17.0.png
    ren %folder%\口\17a.png 17.1.png
    ren %folder%\口\17b.png 17.2.png
    ren %folder%\口\17c.png 17.3.png
    ren %folder%\口\17d.png 17.4.png
    ren %folder%\口\17e.png 17.png
    ren %folder%\口\18.png 18.0.png
    ren %folder%\口\18a.png 18.1.png
    ren %folder%\口\18b.png 18.2.png
    ren %folder%\口\18c.png 18.3.png
    ren %folder%\口\18d.png 18.4.png
    ren %folder%\口\18e.png 18.png
    ren %folder%\目\00a.png 00.4.png
    ren %folder%\目\00b.png 00.3.png
    ren %folder%\目\00c.png 00.2.png
    ren %folder%\目\00d.png 00.1.png
    ren %folder%\目\00e.png 00.0.png
    ren %folder%\目\01a.png 01.4.png
    ren %folder%\目\01b.png 01.3.png
    ren %folder%\目\01c.png 01.2.png
    ren %folder%\目\01d.png 01.1.png
    ren %folder%\目\01e.png 01.0.png
    ren %folder%\目\02a.png 02.4.png
    ren %folder%\目\02b.png 02.3.png
    ren %folder%\目\02c.png 02.2.png
    ren %folder%\目\02d.png 02.1.png
    ren %folder%\目\02e.png 02.0.png
    ren %folder%\目\03a.png 03.4.png
    ren %folder%\目\03b.png 03.3.png
    ren %folder%\目\03c.png 03.2.png
    ren %folder%\目\03d.png 03.1.png
    ren %folder%\目\03e.png 03.0.png
    ren %folder%\目\04a.png 04.4.png
    ren %folder%\目\04b.png 04.3.png
    ren %folder%\目\04c.png 04.2.png
    ren %folder%\目\04d.png 04.1.png
    ren %folder%\目\04e.png 04.0.png
    ren %folder%\目\05a.png 05.4.png
    ren %folder%\目\05b.png 05.3.png
    ren %folder%\目\05c.png 05.2.png
    ren %folder%\目\05d.png 05.1.png
    ren %folder%\目\05e.png 05.0.png
    ren %folder%\目\06a.png 06.4.png
    ren %folder%\目\06b.png 06.3.png
    ren %folder%\目\06c.png 06.2.png
    ren %folder%\目\06d.png 06.1.png
    ren %folder%\目\06e.png 06.0.png
cls
rem タイトル表示
:onlyend
cls
echo =============================================
echo   きつね式ゆっくり立ち絵ymm4対応コンバーター
echo              Version 1.3.1
echo ---------------------------------------------
echo 口パク・瞬き両方同時変換
echo 東方系ゆっくりの全キャラは一括で自動変換可能
echo それ以外も単体で可能
echo ファイルパス指定式
echo =============================================
echo.
title きつね式ゆっくりymm4対応コンバーター Version 1.3.1【変換終了】
echo %word6%
echo.
echo 続けて変換しますか？
echo 1.続けて変換する
echo 2.変換しないで終了する
set /p ans=">>>"
if "%ans%" == "1" (
    goto :only
)
pause
exit

rem 新きつね式ゆっくり
:newkitune

rem 名前指定
echo 1.名前を指定する
echo 2.名前を指定せずfolder.txtからロードする
set /p ans=">>>"
if "%ans%" == "1" (
    goto :name2
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
echo キャラを指定してください
set /p charactor=">>>"
set folder=%folder%/%charactor%
goto :endname2
:name2

rem パス指定
set /p folder="パスを入力>>>"

:endname2

rem 確認
echo ファイルパス:%folder%
echo モード:単体,新きつね式ゆっくり
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

rem 新きつね式ゆっくり変換
    ren %folder%\口\00\00.png 00.0.png
    ren %folder%\口\00\00a.png 00.1.png
    ren %folder%\口\00\00b.png 00.2.png
    ren %folder%\口\00\00c.png 00.3.png
    ren %folder%\口\00\00d.png 00.4.png
    ren %folder%\口\00\00e.png 00.png
    ren %folder%\口\00\01.png 01.0.png
    ren %folder%\口\00\01a.png 01.1.png
    ren %folder%\口\00\01b.png 01.2.png
    ren %folder%\口\00\01c.png 01.3.png
    ren %folder%\口\00\01d.png 01.4.png
    ren %folder%\口\00\01e.png 01.png
    ren %folder%\口\00\02.png 02.0.png
    ren %folder%\口\00\02a.png 02.1.png
    ren %folder%\口\00\02b.png 02.2.png
    ren %folder%\口\00\02c.png 02.3.png
    ren %folder%\口\00\02d.png 02.4.png
    ren %folder%\口\00\02e.png 02.png
    ren %folder%\口\00\03.png 03.0.png
    ren %folder%\口\00\03a.png 03.1.png
    ren %folder%\口\00\03b.png 03.2.png
    ren %folder%\口\00\03c.png 03.3.png
    ren %folder%\口\00\03d.png 03.4.png
    ren %folder%\口\00\03e.png 03.png
    ren %folder%\口\00\04.png 04.0.png
    ren %folder%\口\00\04a.png 04.1.png
    ren %folder%\口\00\04b.png 04.2.png
    ren %folder%\口\00\04c.png 04.3.png
    ren %folder%\口\00\04d.png 04.4.png
    ren %folder%\口\00\04e.png 04.png
    ren %folder%\口\00\05.png 05.0.png
    ren %folder%\口\00\05a.png 05.1.png
    ren %folder%\口\00\05b.png 05.2.png
    ren %folder%\口\00\05c.png 05.3.png
    ren %folder%\口\00\05d.png 05.4.png
    ren %folder%\口\00\05e.png 05.png
    ren %folder%\口\00\06.png 06.0.png
    ren %folder%\口\00\06a.png 06.1.png
    ren %folder%\口\00\06b.png 06.2.png
    ren %folder%\口\00\06c.png 06.3.png
    ren %folder%\口\00\06d.png 06.4.png
    ren %folder%\口\00\06e.png 06.png
    ren %folder%\口\00\07.png 07.0.png
    ren %folder%\口\00\07a.png 07.1.png
    ren %folder%\口\00\07b.png 07.2.png
    ren %folder%\口\00\07c.png 07.3.png
    ren %folder%\口\00\07d.png 07.4.png
    ren %folder%\口\00\07e.png 07.png
    ren %folder%\口\00\08.png 08.0.png
    ren %folder%\口\00\08a.png 08.1.png
    ren %folder%\口\00\08b.png 08.2.png
    ren %folder%\口\00\08c.png 08.3.png
    ren %folder%\口\00\08d.png 08.4.png
    ren %folder%\口\00\08e.png 08.png
    ren %folder%\口\00\09.png 09.0.png
    ren %folder%\口\00\09a.png 09.1.png
    ren %folder%\口\00\09b.png 09.2.png
    ren %folder%\口\00\09c.png 09.3.png
    ren %folder%\口\00\09d.png 09.4.png
    ren %folder%\口\00\09e.png 09.png
    ren %folder%\口\00\10.png 10.0.png
    ren %folder%\口\00\10a.png 10.1.png
    ren %folder%\口\00\10b.png 10.2.png
    ren %folder%\口\00\10c.png 10.3.png
    ren %folder%\口\00\10d.png 10.4.png
    ren %folder%\口\00\10e.png 10.png
    ren %folder%\口\00\11.png 11.0.png
    ren %folder%\口\00\11a.png 11.1.png
    ren %folder%\口\00\11b.png 11.2.png
    ren %folder%\口\00\11c.png 11.3.png
    ren %folder%\口\00\11d.png 11.4.png
    ren %folder%\口\00\11e.png 11.png
    ren %folder%\口\00\12.png 12.0.png
    ren %folder%\口\00\12a.png 12.1.png
    ren %folder%\口\00\12b.png 12.2.png
    ren %folder%\口\00\12c.png 12.3.png
    ren %folder%\口\00\12d.png 12.4.png
    ren %folder%\口\00\12e.png 12.png
    ren %folder%\口\00\13.png 13.0.png
    ren %folder%\口\00\13a.png 13.1.png
    ren %folder%\口\00\13b.png 13.2.png
    ren %folder%\口\00\13c.png 13.3.png
    ren %folder%\口\00\13d.png 13.4.png
    ren %folder%\口\00\13e.png 13.png
    ren %folder%\口\00\14.png 14.0.png
    ren %folder%\口\00\14a.png 14.1.png
    ren %folder%\口\00\14b.png 14.2.png
    ren %folder%\口\00\14c.png 14.3.png
    ren %folder%\口\00\14d.png 14.4.png
    ren %folder%\口\00\14e.png 14.png
    ren %folder%\口\00\15.png 15.0.png
    ren %folder%\口\00\15a.png 15.1.png
    ren %folder%\口\00\15b.png 15.2.png
    ren %folder%\口\00\15c.png 15.3.png
    ren %folder%\口\00\15d.png 15.4.png
    ren %folder%\口\00\15e.png 15.png
    ren %folder%\口\00\16.png 16.0.png
    ren %folder%\口\00\16a.png 16.1.png
    ren %folder%\口\00\16b.png 16.2.png
    ren %folder%\口\00\16c.png 16.3.png
    ren %folder%\口\00\16d.png 16.4.png
    ren %folder%\口\00\16e.png 16.png
    ren %folder%\口\00\17.png 17.0.png
    ren %folder%\口\00\17a.png 17.1.png
    ren %folder%\口\00\17b.png 17.2.png
    ren %folder%\口\00\17c.png 17.3.png
    ren %folder%\口\00\17d.png 17.4.png
    ren %folder%\口\00\17e.png 17.png
    ren %folder%\口\00\18.png 18.0.png
    ren %folder%\口\00\18a.png 18.1.png
    ren %folder%\口\00\18b.png 18.2.png
    ren %folder%\口\00\18c.png 18.3.png
    ren %folder%\口\00\18d.png 18.4.png
    ren %folder%\口\00\18e.png 18.png
    ren %folder%\目\00\00a.png 00.4.png
    ren %folder%\目\00\00b.png 00.3.png
    ren %folder%\目\00\00c.png 00.2.png
    ren %folder%\目\00\00d.png 00.1.png
    ren %folder%\目\00\00e.png 00.0.png
    ren %folder%\目\00\01a.png 01.4.png
    ren %folder%\目\00\01b.png 01.3.png
    ren %folder%\目\00\01c.png 01.2.png
    ren %folder%\目\00\01d.png 01.1.png
    ren %folder%\目\00\01e.png 01.0.png
    ren %folder%\目\00\02a.png 02.4.png
    ren %folder%\目\00\02b.png 02.3.png
    ren %folder%\目\00\02c.png 02.2.png
    ren %folder%\目\00\02d.png 02.1.png
    ren %folder%\目\00\02e.png 02.0.png
    ren %folder%\目\00\03a.png 03.4.png
    ren %folder%\目\00\03b.png 03.3.png
    ren %folder%\目\00\03c.png 03.2.png
    ren %folder%\目\00\03d.png 03.1.png
    ren %folder%\目\00\03e.png 03.0.png
    ren %folder%\目\00\04a.png 04.4.png
    ren %folder%\目\00\04b.png 04.3.png
    ren %folder%\目\00\04c.png 04.2.png
    ren %folder%\目\00\04d.png 04.1.png
    ren %folder%\目\00\04e.png 04.0.png
    ren %folder%\目\00\05a.png 05.4.png
    ren %folder%\目\00\05b.png 05.3.png
    ren %folder%\目\00\05c.png 05.2.png
    ren %folder%\目\00\05d.png 05.1.png
    ren %folder%\目\00\05e.png 05.0.png
    ren %folder%\目\00\06a.png 06.4.png
    ren %folder%\目\00\06b.png 06.3.png
    ren %folder%\目\00\06c.png 06.2.png
    ren %folder%\目\00\06d.png 06.1.png
    ren %folder%\目\00\06e.png 06.0.png
    ren %folder%\口\01\00.png 00.0.png
    ren %folder%\口\01\00a.png 00.1.png
    ren %folder%\口\01\00b.png 00.2.png
    ren %folder%\口\01\00c.png 00.3.png
    ren %folder%\口\01\00d.png 00.4.png
    ren %folder%\口\01\00e.png 00.png
    ren %folder%\口\01\01.png 01.0.png
    ren %folder%\口\01\01a.png 01.1.png
    ren %folder%\口\01\01b.png 01.2.png
    ren %folder%\口\01\01c.png 01.3.png
    ren %folder%\口\01\01d.png 01.4.png
    ren %folder%\口\01\01e.png 01.png
    ren %folder%\口\01\02.png 02.0.png
    ren %folder%\口\01\02a.png 02.1.png
    ren %folder%\口\01\02b.png 02.2.png
    ren %folder%\口\01\02c.png 02.3.png
    ren %folder%\口\01\02d.png 02.4.png
    ren %folder%\口\01\02e.png 02.png
    ren %folder%\口\01\03.png 03.0.png
    ren %folder%\口\01\03a.png 03.1.png
    ren %folder%\口\01\03b.png 03.2.png
    ren %folder%\口\01\03c.png 03.3.png
    ren %folder%\口\01\03d.png 03.4.png
    ren %folder%\口\01\03e.png 03.png
    ren %folder%\口\01\04.png 04.0.png
    ren %folder%\口\01\04a.png 04.1.png
    ren %folder%\口\01\04b.png 04.2.png
    ren %folder%\口\01\04c.png 04.3.png
    ren %folder%\口\01\04d.png 04.4.png
    ren %folder%\口\01\04e.png 04.png
    ren %folder%\口\01\05.png 05.0.png
    ren %folder%\口\01\05a.png 05.1.png
    ren %folder%\口\01\05b.png 05.2.png
    ren %folder%\口\01\05c.png 05.3.png
    ren %folder%\口\01\05d.png 05.4.png
    ren %folder%\口\01\05e.png 05.png
    ren %folder%\口\01\06.png 06.0.png
    ren %folder%\口\01\06a.png 06.1.png
    ren %folder%\口\01\06b.png 06.2.png
    ren %folder%\口\01\06c.png 06.3.png
    ren %folder%\口\01\06d.png 06.4.png
    ren %folder%\口\01\06e.png 06.png
    ren %folder%\口\01\07.png 07.0.png
    ren %folder%\口\01\07a.png 07.1.png
    ren %folder%\口\01\07b.png 07.2.png
    ren %folder%\口\01\07c.png 07.3.png
    ren %folder%\口\01\07d.png 07.4.png
    ren %folder%\口\01\07e.png 07.png
    ren %folder%\口\01\08.png 08.0.png
    ren %folder%\口\01\08a.png 08.1.png
    ren %folder%\口\01\08b.png 08.2.png
    ren %folder%\口\01\08c.png 08.3.png
    ren %folder%\口\01\08d.png 08.4.png
    ren %folder%\口\01\08e.png 08.png
    ren %folder%\口\01\09.png 09.0.png
    ren %folder%\口\01\09a.png 09.1.png
    ren %folder%\口\01\09b.png 09.2.png
    ren %folder%\口\01\09c.png 09.3.png
    ren %folder%\口\01\09d.png 09.4.png
    ren %folder%\口\01\09e.png 09.png
    ren %folder%\口\01\10.png 10.0.png
    ren %folder%\口\01\10a.png 10.1.png
    ren %folder%\口\01\10b.png 10.2.png
    ren %folder%\口\01\10c.png 10.3.png
    ren %folder%\口\01\10d.png 10.4.png
    ren %folder%\口\01\10e.png 10.png
    ren %folder%\口\01\11.png 11.0.png
    ren %folder%\口\01\11a.png 11.1.png
    ren %folder%\口\01\11b.png 11.2.png
    ren %folder%\口\01\11c.png 11.3.png
    ren %folder%\口\01\11d.png 11.4.png
    ren %folder%\口\01\11e.png 11.png
    ren %folder%\口\01\12.png 12.0.png
    ren %folder%\口\01\12a.png 12.1.png
    ren %folder%\口\01\12b.png 12.2.png
    ren %folder%\口\01\12c.png 12.3.png
    ren %folder%\口\01\12d.png 12.4.png
    ren %folder%\口\01\12e.png 12.png
    ren %folder%\口\01\13.png 13.0.png
    ren %folder%\口\01\13a.png 13.1.png
    ren %folder%\口\01\13b.png 13.2.png
    ren %folder%\口\01\13c.png 13.3.png
    ren %folder%\口\01\13d.png 13.4.png
    ren %folder%\口\01\13e.png 13.png
    ren %folder%\口\01\14.png 14.0.png
    ren %folder%\口\01\14a.png 14.1.png
    ren %folder%\口\01\14b.png 14.2.png
    ren %folder%\口\01\14c.png 14.3.png
    ren %folder%\口\01\14d.png 14.4.png
    ren %folder%\口\01\14e.png 14.png
    ren %folder%\口\01\15.png 15.0.png
    ren %folder%\口\01\15a.png 15.1.png
    ren %folder%\口\01\15b.png 15.2.png
    ren %folder%\口\01\15c.png 15.3.png
    ren %folder%\口\01\15d.png 15.4.png
    ren %folder%\口\01\15e.png 15.png
    ren %folder%\口\01\16.png 16.0.png
    ren %folder%\口\01\16a.png 16.1.png
    ren %folder%\口\01\16b.png 16.2.png
    ren %folder%\口\01\16c.png 16.3.png
    ren %folder%\口\01\16d.png 16.4.png
    ren %folder%\口\01\16e.png 16.png
    ren %folder%\口\01\17.png 17.0.png
    ren %folder%\口\01\17a.png 17.1.png
    ren %folder%\口\01\17b.png 17.2.png
    ren %folder%\口\01\17c.png 17.3.png
    ren %folder%\口\01\17d.png 17.4.png
    ren %folder%\口\01\17e.png 17.png
    ren %folder%\口\01\18.png 18.0.png
    ren %folder%\口\01\18a.png 18.1.png
    ren %folder%\口\01\18b.png 18.2.png
    ren %folder%\口\01\18c.png 18.3.png
    ren %folder%\口\01\18d.png 18.4.png
    ren %folder%\口\01\18e.png 18.png
    ren %folder%\目\01\00a.png 00.4.png
    ren %folder%\目\01\00b.png 00.3.png
    ren %folder%\目\01\00c.png 00.2.png
    ren %folder%\目\01\00d.png 00.1.png
    ren %folder%\目\01\00e.png 00.0.png
    ren %folder%\目\01\01a.png 01.4.png
    ren %folder%\目\01\01b.png 01.3.png
    ren %folder%\目\01\01c.png 01.2.png
    ren %folder%\目\01\01d.png 01.1.png
    ren %folder%\目\01\01e.png 01.0.png
    ren %folder%\目\01\02a.png 02.4.png
    ren %folder%\目\01\02b.png 02.3.png
    ren %folder%\目\01\02c.png 02.2.png
    ren %folder%\目\01\02d.png 02.1.png
    ren %folder%\目\01\02e.png 02.0.png
    ren %folder%\目\01\03a.png 03.4.png
    ren %folder%\目\01\03b.png 03.3.png
    ren %folder%\目\01\03c.png 03.2.png
    ren %folder%\目\01\03d.png 03.1.png
    ren %folder%\目\01\03e.png 03.0.png
    ren %folder%\目\01\04a.png 04.4.png
    ren %folder%\目\01\04b.png 04.3.png
    ren %folder%\目\01\04c.png 04.2.png
    ren %folder%\目\01\04d.png 04.1.png
    ren %folder%\目\01\04e.png 04.0.png
    ren %folder%\目\01\05a.png 05.4.png
    ren %folder%\目\01\05b.png 05.3.png
    ren %folder%\目\01\05c.png 05.2.png
    ren %folder%\目\01\05d.png 05.1.png
    ren %folder%\目\01\05e.png 05.0.png
    ren %folder%\目\01\06a.png 06.4.png
    ren %folder%\目\01\06b.png 06.3.png
    ren %folder%\目\01\06c.png 06.2.png
    ren %folder%\目\01\06d.png 06.1.png
    ren %folder%\目\01\06e.png 06.0.png
goto :onlyend

rem ゆっくりキャラ素材単体

:onlychara

rem 名前指定
echo 1.名前を指定する
echo 2.名前を指定せずfolder.txtからロードする
set /p ans=">>>"
if "%ans%" == "1" (
    goto :name3
)

for /f %%i in (folder.txt) do (
  set folder=%%i
)
echo キャラを指定してください
set /p charactor=">>>"
set folder=%folder%/%charactor%
goto :endname3
:name3

rem パス指定
set /p folder="パスを入力>>>"

:endname3

rem 確認
echo ファイルパス:%folder%
echo モード:単体ゆっくりキャラ素材
set /p gosign="%word4%(y/n)>>>"
if "%gosign%" == "n" (
    echo "%cancel%"
    goto :setting
)
cls

    ren %folder%\口\00.png 00.0.png
    ren %folder%\口\01.png 00.1.png
    ren %folder%\口\02.png 00.2.png
    ren %folder%\口\03.png 00.3.png
    ren %folder%\口\04.png 00.4.png
    ren %folder%\口\05.png 00.png
    ren %folder%\目\00.png 00.0.png
    ren %folder%\目\01.png 00.1.png
    ren %folder%\目\02.png 00.2.png
    ren %folder%\目\03.png 00.3.png
    ren %folder%\目\04.png 00.4.png
    ren %folder%\目\05.png 00.png

goto :onlyend