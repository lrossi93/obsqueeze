# VID-Squeeze
I grew tired of having my storage wear out and manually compressing videos one by one. I thought about scripting a utility doing that in my place. 

## Usage
- Change the `vidspath` variable into the absolute path of the directory containing the videos you want to compress.
- Then, drop the `.sh` file in your `/usr/bin` directory (it might need a `chmod +x` first).

That's basically it. Run `vidsqueeze.sh` from anywhere in your filesystem to compress every video file in `vidspath`.
