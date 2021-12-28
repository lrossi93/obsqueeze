# VID-Squeeze
I grew tired of having my storage wear out and manually compressing videos one by one. I thought about scripting a utility doing that in my place. 

## How it works
This script applies the command `ffmpeg` to every video file in `vidspath`, creating a corresponding shrunk `.mp4` file and then deleting the original one. When the compression of each file has terminated, the user is warned by an audio notification handled by `spd-say` and by a dialog window created with `zenity`.

## Requirements
- This script only runs on Unix-like OSs.
- **Any non-video files in the directory will be deleted (make sure the directory only contains videos)**.
- For the script to work, the following utilities need to be installed:
  - [`ffmpeg`](https://ffmpeg.org/)
  - [`spd-say`](https://manpages.ubuntu.com/manpages/trusty/man1/spd-say.1.html)
  - [`zenity`](https://help.gnome.org/users/zenity/stable/)

## Usage
- Change the `vidspath` variable into the absolute path of the directory containing the videos you want to compress.
- Then, drop the `.sh` file in your `/usr/bin` directory (it might need a `chmod +x` first).

That's basically it. Run `vidsqueeze.sh` from anywhere in your filesystem to compress every video file in `vidspath`.

## TODO
- [ ] Ignore non-video files
- [ ] Pass `vidspath` on command line
