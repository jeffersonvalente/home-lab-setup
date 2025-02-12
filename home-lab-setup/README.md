# Home Lab Setup

Este repositório documenta e automatiza o processo de configuração do seu Home Lab. Inicialmente, o projeto contempla a instalação do k3s (https://k3s.io/), a configuração do kubectl e a integração com o New Relic (https://newrelic.com/) para monitoramento do cluster. Em futuras atualizações, outras ferramentas como Backstage, Argo, etc., serão adicionadas.

## Estrutura do Repositório

home-lab-setup/
├── README.txt            # Documentação geral do projeto
├── config.env            # Arquivo de variáveis de ambiente
├── scripts/             
│   └── install_home_lab.sh    # Script principal de instalação e configuração
└── docs/                
    └── installation.md  # Documentação detalhada do processo de instalação e configurações

## Como Utilizar

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/seu-usuario/home-lab-setup.git
   cd home-lab-setup
   ```

2. **Edite o arquivo de variáveis de ambiente:**

   Abra o arquivo `config.env` e atualize os valores conforme a sua configuração. Por exemplo:

   ```bash
   nano config.env
   ```

3. **Executar o script de instalação:**

   Dê permissão de execução ao script e execute-o:

   ```bash
   chmod +x scripts/install_home_lab.sh
   ./scripts/install_home_lab.sh
   ```

## O que o Script Faz

- **Instala o k3s:**  
  Executa o comando `curl -sfL https://get.k3s.io | sh -` para instalar o k3s.

- **Configura o kubectl:**  
  Cria o diretório `~/.kube` (caso não exista) e copia o arquivo `/etc/rancher/k3s/k3s.yaml` para `~/.kube/config`, ajustando as permissões para o usuário atual.

- **Integra o New Relic:**  
  Instala o New Relic CLI e configura o monitoramento do cluster utilizando as variáveis definidas em `config.env`.

## Contribuição

Contribuições são bem-vindas! Caso deseje adicionar novas ferramentas ou melhorias, por favor, abra uma issue ou envie um pull request.

## Licença

Este projeto está licenciado sob a MIT License.
