![header](https://github.com/user-attachments/assets/e160a7ab-e06f-4f3d-86ed-c6c2387a4b41)
<h1 align="center"> EdibleDLP </h1>
<p align="center">An yt-dlp based gui downloader created with AutoHotKey 1.1</p>

<p align="center">
<a alt="Made with Autohotkey 1.1" href="http://www.autohotkey.com">
  <img src="https://img.shields.io/badge/Autohotkey_1.1-green?style=for-the-badge&logo=AutoHotkey">
</a>
<a alt="Using yt-dlp to its downloader" href="http://github.com/yt-dlp/yt-dlp">
  <img src="https://img.shields.io/badge/YT--DLP-gray?style=for-the-badge&logo=youtube">
</a>
<a alt="Using ffmpeg to its converter" href="http://www.ffmpeg.org">
  <img src="https://img.shields.io/badge/FFmpeg-black_green?style=for-the-badge&logo=ffmpeg">
</a>
 <a alt="日本語版を見る" href="../main/README-ja.md">
  <img src="https://img.shields.io/badge/日本語版のREADMEを読む-red?style=for-the-badge">
</a>
</p>

## What is this?
normal downloader with useless features

## How to use
Before using this downloader, install Autohotkey **version 1.1** from [here](https://www.autohotkey.com/download/ahk-install.exe).

After installing, Launch the **EdibleDLP.ahk** (or if you converted to exe, **EdibleDLP.exe**).

This script will automatically download **yt-dlp v2024.10.22/ffmpeg/ffprobe** from yt-dlp repo/this repo, and main GUI will shown after it's completed.
> [!NOTE]
> This version of yt-dlp is **last version that supports Windows 7/8.1**.
> 
> You can update yt-dlp from "Update yt-dlp" button, If you're Windows 10 (or above) user.

![Main GUI of EdibleDLP](https://github.com/pap-git/EdibleDLP/blob/main/readme-img/main-gui.png?raw=true)

Now, Add URL to the list by:
- **Copying YouTube/ニコニコ動画/or any platform URL (that supported in yt-dlp) URL to clipboard and active the EdibleDLP window then press Ctrl+Shift+V**
- **Enter the URL to below of the list, then press "Add URL..." button**

After that, select prefix from Prefix drop-down list, then select the path to download.

Default path is: `EdibleDLP.ahk/Downloaded`

Then press **Download them** button or active the window and press Shift+Enter. Your order will be automatically downloaded.

## Available presets
> [!TIP]
> Downloaded videos may not be played on **Windows Media Player** or **any player that not supporting VP9**.

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

## TroubleShooting / Q and A
#### Q. Download stopped with `yt-dlp closed with errorlevel: X` lmfao
A. i would like to add "bypass the errorlevel error" checkmark
#### Q. Why there's no .exe file release?
A. When I tried to compile to the exe by using Ahk2Exe, VirusTotal and @minottoplus just tell me false-possible result, so please compile it by yourself!
#### Q. why are you wasting your time to this
A. idk

## Known Issues / Suggestions
 - Needs better folder picker
 - Somewhat site detector won't works with Ctrl+Shift+V method

## Credits
 - **yt-dlp** (https://github.com/yt-dlp/yt-dlp) for video downloaders
 - **ffmpeg** (https://ffmpeg.org/) for merge downloaded video/audios
 - **Autohotkey** (https://autohotkey.com/) for GUI/Automating them
 - **Autohotkey Wiki** (https://ahkwiki.net) for Japanese docs of Autohotkey
 - Early Testers: @minottoplus, [Yukkuri7ch](https://x.com/Yukuri7ch)
## License
This script is licensed under the **GNU General Public License v3.0**
> Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights.

Full license is in [LICENSE](https://github.com/pap-git/EdibleDLP/blob/main/LICENSE) file.
