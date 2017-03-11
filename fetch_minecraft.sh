#!/usr/bin/env zsh

REMOTE=ovh:/opt/mscs/worlds/
N_TO_KEEP=60

echo "Fetching server data into a temporary folder"
rsync -av ovh:/opt/mscs/worlds/ tmp-backup/

echo "Compressing server fetched data"
tar -cJvf `date +'%Y-%m-%H-%M-%S'`.tar.xz tmp-backup

echo "Deleting temporary folder"
rm -r tmp-backup

echo "Deleting any file other than the ${N_TO_KEEP} most recent"
ls -tp | grep -v '/$' | tail -n +$((N_TO_KEEP + 1)) | xargs -I {} rm -- {}
