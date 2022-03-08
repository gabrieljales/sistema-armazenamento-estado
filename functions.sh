#!/usr/bin/env bash

source info_list.sh

check_root () {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root!!"
        exit 1
    fi
}

generate_log_file () {
    if [ ! -f 'log.txt' ]; then
        $(touch log.txt)
    fi

    echo -e "$1\n$2\n$3\n$4\n$5\n$6\n$7\nEOF" >> log.txt
}

generate_html_file () {
    if [ ! -f 'index.html' ]; then
        $(touch index.html)
    fi

    cat > index.html << EOF
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
    <title>Server info</title>
  </head>
  <body>
  <section class="hero is-info">
    <div class="hero-body">
      <h1 class="title">
        Relatório
      </h1>
      <p class="subtitle">
        <strong>Olá!</strong> Segue abaixo o relatório da última coleta de dados, realizada 2 minutos atrás:
      </p>
    </div>
  </section>
  </body>
</html>
EOF
}
