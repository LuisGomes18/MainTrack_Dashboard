#!/bin/bash


caminho=$(pwd)
cd ..
clear


if [ -f "$caminho/.env" ]; then
    set -a  
    source "$caminho/.env"
    set +a
else
    echo "Erro: Ficheiro .env não encontrado."
    exit 1
fi

if [ ! -f "$caminho/.venv/bin/python" ]; then
    echo "Erro: Ambiente virtual não encontrado em $caminho/.venv"
    exit 1
fi

echo -e "\n\nStarting DisSafe API\n\n"
"$caminho/.venv/bin/python" "$caminho/manage.py" runserver "$HOST:$PORT"
echo -e "\n\n"
