#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Этот скрипт должен быть запущен от имени root (используйте sudo ./install.sh)."
  exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

echo "#!/usr/bin/env python3" | sudo tee /usr/local/bin/nursultan > /dev/null
sudo cat "$SCRIPT_DIR/nursultan.py" | sudo tee -a /usr/local/bin/nursultan > /dev/null

sudo chmod +x /usr/local/bin/nursultan

if ! command -v pip3 &> /dev/null
then
    echo "Установка python3-pip..."
    sudo apt update
    sudo apt install -y python3-pip
fi
sudo pip3 install -r "$SCRIPT_DIR/requirements.txt" --break-system-packages

echo "Скрипт nursultan успешно установлен.  Запустите его, набрав 'nursultan' в терминале."

