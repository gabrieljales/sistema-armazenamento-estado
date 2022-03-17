# Sobre o projeto

## Requisitos da atividade:

<details>
    <summary>Clique para expandir</summary>
    
Em uma VM, instale o servidor web Apache2.

Configure o site principal para exibir uma página que deve estar disponível apenas das 07h às 23h59 e que acrescenta a cada 2 minutos uma listagem contendo:

[x] Hora com minutos da coleta de dados

[x] Nome da máquina

[x] Total de memória RAM usada

[x] Total de memória RAM disponível

[x] O nome do processo que utiliza mais memória e o total de memória RAM utilizada

[x] A listagem das partições contendo ponto de montagem, tamanho e percentagem de utilização

[x] O total de bytes e pacotes enviados e recebidos em cada interface de rede

[ ] Das 00h às 6h59 o site principal deve exibir uma página informando que o site está em manutenção.

## Todas as soluções devem ser desenvolvidas utilizando shell scripts. Envie todos os scripts desenvolvidos e as instruções de utilização e instalação.</details>

---

## Instruções de utilização:

### Utilizando o Vagrant

Primeiro inicie a VM e instale as dependências:

```
 $ vagrant up
```

Em seguida, copie os scripts para a VM:

```
$ vagrant upload init.sh && vagrant upload info_list.sh && vagrant upload functions.sh
```

Conecte-se via SSH com a VM:

```
$ vagrant ssh
```

Siga adiante para os próximos passos

### Executando os scripts

Antes de executar os script, é necessário dar permissão de execução para os arquivos abaixo:

```
$ chmod +x init.sh && chmod +x info_list.sh
```

Após isso, execute o arquivo `init.sh` como super usuário:

```
$ sudo ./init.sh
```

> Caso o script seja executado sem o `sudo`, o mesmo irá interromper a sua execução e fornecer a seguinte mensagem:
>
> ```
> Esse script deve ser executado como root, saindo...
> ```
>
> Para mais informações, veja sobre a função `check_root` na seção de funções [aqui](#funções).

Caso esteja usando o `Vagrantfile` fornecido, acesse o seguinte endereço no seu navegador para ver o site:

```
http://192.168.57.10/
```

> Você também pode visualizar o site com o seguinte endereço:
>
> ```
> http://localhost:8000
> ```

As informações do site serão atualizadas a cada 2 minutos.

> Dê um reload na página para visualizar os dados mais recentes!!!

---

## Detalhes do projeto:

### Sobre os arquivos

- init.sh: Arquivo principal, responsável por chamar todos os outros scripts.
- info_list.sh: Responsável por coletar e armazenar as informações da máquina.
- functions.sh: Contém toda a lógica do projeto. Cada uma das funções foram detalhadas na seção abaixo.

### Funções

- check_root: Verifica se o script foi executado como usuário root.
- create_cron_job: Responsável por criar o cronjob que executa o arquivo `init.sh` a cada 2 minutos.
- generate_log_file: Gera um arquivo de log contendo as informações extraídas.
- generate_html_body: Gera o conteúdo principal do site com as informações obtidas no script `info_list.sh`, o arquivo html gerado posteriormente será inserido em `index.html`.
- generate_html_file: Cria a página principal do site com as informações geradas pela função `generate_html_body`.
