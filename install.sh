    #!/bin/bash

    if [[ $EUID -ne 0 ]]; then
      echo "Этот скрипт должен быть запущен от имени root (используйте sudo install.sh)."
      exit 1
    fi

    cp nursultan.py /usr/local/bin/nursultan
    cp nur /usr/local/bin/nur

    chmod +x /usr/local/bin/nursultan

    echo "Отправьте в консоль: nursultan"

