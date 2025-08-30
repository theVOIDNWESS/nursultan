    #!/bin/bash

    if [[ $EUID -ne 0 ]]; then
      echo "Этот скрипт должен быть запущен от имени root (используйте sudo install.sh)."
      exit 1
    fi

    cp nursultan.py /usr/local/bin/nursultan
    cp nursultan.py /usr/local/bin/nursultan.py

    chmod +x /usr/local/bin/nursultan

    sudo apt update  
    sudo apt install -y python3-pip
    pip3 install -r requirements.txt --break-system-packages
    
    echo "Отправьте в консоль: nursultan"

