#!/bin/bash
set -euo pipefail

if ! [ -d "data" ]; then
    echo "Please bind-mount the data directory."
    exit 1
fi

if ! [ -d "data/generic" ]; then
    echo "Downloading generic.tar.gz"
    curl "http://gem.cs.ru.nl/generic.tar.gz" | tar xz --directory data
fi

if ! [ -d "data/wiki_2019" ]; then
    echo "Downloading wiki_2019.tar.gz"
    curl "http://gem.cs.ru.nl/wiki_2019.tar.gz" | tar xz --directory data
fi

python -m REL.server --bind 0.0.0.0 --port 5555 ./data wiki_2019 --ner-model ner-fast
