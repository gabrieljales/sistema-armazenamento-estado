#!/usr/bin/env bash

source info_list.sh

check_root () {
    if [[ $EUID -ne 0 ]]; then
        echo "Esse script deve ser executado como root, saindo..."
        exit 1
    fi
}

create_cron_job () {
    CURRENT_PATH=$(pwd)
    echo "Creating Cron job..."
    crontab -l > tempfile
    echo "*/2 * * * * /bin/bash ${CURRENT_PATH}/init.sh >> ${CURRENT_PATH}/cron.out 2>&1" > tempfile
    crontab tempfile
    rm tempfile
    echo "Cron job created!!"
}

generate_log_file () {
    if [ ! -f 'log.txt' ]; then
        $(touch log.txt)
    fi
    echo "Creating log file..."
    echo -e "${1}\n${2}\n${3}\n${4}\n${5}\n${6}\n${7}\n${8}\n${9}\n${10}\nEOF" >> log.txt
    echo "Log file created!!"
}

generate_html_file () {
    HTML_PATH='/var/www/html'
    if [ ! -f '${HTML_PATH}/index.html' ]; then
        $(touch ${HTML_PATH}/index.html)
    fi

    echo "Creating HTML file..."

    cat > ${HTML_PATH}/index.html << EOF
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

  <section class="section">
    <div class="content">

      <article class="message is-info">
        <div class="message-header">
          <p>Data e horário da coleta: ${CURRENT_TIME}</p>
        </div>
        <div class="message-body">
          <div class="content">

            <p><strong>Hostname:</strong> ${HOST_NAME}</p>

            <p><strong>Total de memória RAM usada:</strong> ${CURRENT_USED_RAM}</p>

            <p><strong>Total de memória RAM disponível:</strong> ${CURRENT_FREE_RAM}</p>

            <p><strong>Processo que mais utiliza RAM:</strong></p>
              <ul>
                <li><strong>PID:</strong> ${PID_PROCESS_USES_MORE_RAM}</li>
                <li><strong>Nome:</strong> ${NAME_PROCESS_USES_MORE_RAM}</li>
                <li><strong>Percentual de RAM utilizada:</strong> ${PERCENT_PROCESS_USES_MORE_RAM}%</li>
                <li><strong>RAM utilizada em Kilobytes:</strong> ${RSS_PROCESS_USES_MORE_RAM}KB</li>
              </ul>

            <p><strong>Partições:</strong></p>
              <ul>
                <li>${PARTITIONS}</li>
              </ul>

            <p><strong>Interfaces de rede:</strong></p>
              <ul>
                <li>${INTERFACES}</li>
              </ul>
         </div>
       </div>
      </article>

    </div>
  </section>
  </body>
</html>
EOF

echo "HTML file created!!"
}
