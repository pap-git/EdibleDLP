# EdibleDLP
yt-dlp 用に作られたAutohotkey 1.1でつくったGUI用のダウンローダー

[<img src="https://img.shields.io/badge/Autohotkey_1.1-green?style=for-the-badge&logo=AutoHotkey">](http://www.autohotkey.com)
[<img src="https://img.shields.io/badge/YT--DLP-gray?style=for-the-badge&logo=youtube">](http://github.com/yt-dlp/yt-dlp)
[<img src="https://img.shields.io/badge/FFmpeg-black_green?style=for-the-badge&logo=ffmpeg">](http://ffmpeg.org)

[**See English versions of README**](../main/README.md)

## なにこれ
普通のダウンローダーにゴミ機能を追加しただけの代物

## 使い方
このダウンローダーを使う前にAutohotkey **バージョン 1.1**を[ここ](https://www.autohotkey.com/download/ahk-install.exe)から入れてください。
入れないとahk版は動きません。

インストールが終了したら**EdibleDLP.ahk**を実行してください。(exeにコンバートした場合は**EdibleDLP.exe**を起動してください)

起動したら**yt-dlp v2024.10.22/ffmpeg/ffprobe**を自動的に入れてくれます。
> [!NOTE]
> yt-dlpがこのバージョンである理由は**Windows 7/8.1をサポートする最後のバージョンだからです。**
> 
> 開発環境がWindows 7なんですよね。
> 
> Windows 10ユーザーなら"Update yt-dlp"ボタンからyt-dlpをアップデートできます。

![Main GUI of EdibleDLP](https://github.com/pap-git/EdibleDLP/blob/main/readme-img/main-gui.png?raw=true)

この画面が出てきたらこれらの方法で動画をリストに追加してください。
- **YouTube/ニコニコ動画/またはyt-dlpで使えるプラットフォームのURLのリンクをクリップボードにコピーしてEdibleDLPのウィンドウをアクティブにしてCtrl+Shift+Vを押す**
- **リストの下のテキストボックスにURLを入力して"Add URL..."ボタンを押す**

そしたらPrefix欄からどんな感じにDLするかを選んでください。一覧は下行けば見れます。音声のみとかはこっから。

そのあと、ダウンロードした後どこに保存するかを選んでください。デフォルトかカスタムかどっちか選べます。

デフォルトの保存場所はここです→ `EdibleDLP.ahk/Downloaded`

そしたら**Download them**ボタンを押すかShift+Enterを押してください。ダウンロードが始まります。

## 使えるプリセット一覧
> [!IMPORTANT]
> ここにあるプリセットはテストされてません。下に書いてあるプリセットに何か問題があったらIssue立ててケチ付けてください。
> - 480p (MP4)
> - 360p (MP4)
> - 240p (MP4)
> - 144p (MP4)

> [!TIP]
> ダウンロードされた動画は**Windows Media Player**または**VP9をサポートしていないプレイヤー**では再生できないかもしれません。

- 1080p (MP4): `yt-dlp.exe -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[height<=1080][ext=mp4]"`
- 720p (MP4): `yt-dlp.exe -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"`
- 480p (MP4): `yt-dlp.exe -f "bestvideo[height<=480][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"`
- 360p (MP4): `yt-dlp.exe -f "bestvideo[height<=360][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"`
- 240p (MP4): `yt-dlp.exe -f "bestvideo[height<=240][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"`
- 144p (MP4): `yt-dlp.exe -f "bestvideo[height<=144][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"`
- Best Quality: `yt-dlp.exe`
- Best Quality (MP4): `yt-dlp.exe -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]"`
- Best Quality (Only MP3): `yt-dlp.exe -x --audio-format mp3`
- Best Quality (Only WAV): `yt-dlp.exe -x --audio-format wav`
- Custom

## トラブルシューティング / よくある質問
#### Q. `yt-dlp closed with errorlevel: X`エラーでとまったんだけど？
A. がんばってください
#### Q. exeファイルでのリリースがないのはなぜ？
A. これ最初に友達にexe化して配布したときウイルス判定されたんですよね　だからexe化するんだったらAhk2Exeとかで自分でしてください！
#### Q. こんなすくりぷとにまじになっちゃってどうするの
A. 🤗

## AHKからEXEファイルに変換する方法
### なぜこれを掲載するの？
 - タスクバーに固定できない！ごみ！みたいな意見が出たからには気にせずにはいられない
 - かといってバイナリで配布するとWindows Defenderとかがウイルス扱いしてたまらない
### やりかた
[**Autohotkey 1.1**](https://www.autohotkey.com/download/ahk-install.exe)と[**Ahk2Exe**](https://github.com/AutoHotkey/Ahk2Exe/releases/latest)と**変換したいバージョンのEdibleDLP.ahk**をダウンロードしてください



Autohotkeyはインストールを済ませておいてください

そしたら**Ahk2Exeを開いて、Sourceって欄のところの右にあるBrowseボタンを押してEdibleDLP.ahkを参照してください**

そしたら**Compileを押せばEdibleDLP.ahkと同じところにEdibleDLP.exeが出るはず**です

## すでにわかってる問題 / 意見
 - もっといいフォルダーピッカーがほしい
   - 実装がめんどくさいので、**[Windhawk](https://windhawk.net/)の[Modernize Folder Picker Dialog](https://windhawk.net/mods/modernize-folder-picker-dialog)を使ってください**
 - Ctrl+Shift+Vでコピペするとサイト検出機が動かない

## クレジット
 - **yt-dlp** (https://github.com/yt-dlp/yt-dlp) ダウンローダー用
 - **ffmpeg** (https://ffmpeg.org/) 上のやつのマージ用
 - **Autohotkey** (https://autohotkey.com/) かみ
 - **Autohotkey Wiki** (https://ahkwiki.net) ↑の日本語版docs かみ
 - アーリーテスト版をさわってくれたひと: @minottoplus, [Yukkuri7ch](https://x.com/Yukuri7ch)
## ライセンス
**GNU General Public License v3.0**でライセンスしたかんじのスクリプトです
> Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights.

[LICENSE](https://github.com/pap-git/EdibleDLP/blob/main/LICENSE)ファイルに全文が書いてあります。
