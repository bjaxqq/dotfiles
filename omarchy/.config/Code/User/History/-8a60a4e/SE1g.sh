#!/bin/bash
# upscale_sousou.sh
# Upscale all Sousou no Frieren episodes in all seasons using your RTX 3060

SRC="/srv/media/LIFE/Anime/Sousou no Frieren"
DST="$HOME/Upscaled/Sousou no Frieren"

# Loop through each season folder
find "$SRC" -type f -name "*.mp4" | while IFS= read -r f; do
    # Create mirrored folder structure in destination
    relpath="${f#$SRC/}"                    # removes base path
    outdir="$DST/$(dirname "$relpath")"     # destination folder for this episode
    mkdir -p "$outdir"

    # Construct output file path
    filename=$(basename "$f")
    output="$outdir/$filename"

    echo "Upscaling '$f' → '$output'"

    # Run anime4k
    anime4k video \
        -i "$f" \
        -o "$output" \
        -p cuda \
        -d 0 \
        -f 2
done
