#!/bin/bash
set -e

# Carregar variáveis de ambiente
if [ -f "./config.env" ]; then
    echo "Carregando variáveis de ambiente do arquivo config.env..."
    source ./config.env
else
    echo "Arquivo config.env não encontrado! Por favor, crie-o a partir do exemplo (config.env.example)."
    exit 1
fi

# Define valor padrão para NR_CLI_NAMESPACE caso não esteja definido
: "${NR_CLI_NAMESPACE:=newrelic}"

# 1. Instalar o k3s
echo "Instalando o k3s..."
curl -sfL https://get.k3s.io | sh -

# 2. Configurar o kubectl copiando o arquivo k3s.yaml para ~/.kube/config
echo "Configurando o kubectl..."
# Cria o diretório ~/.kube (o comando é seguro mesmo se o diretório já existir)
mkdir -p ~/.kube
# Copia o arquivo de configuração do k3s para o diretório do kubectl (utilizando sudo, se necessário)
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
# Altera a propriedade do arquivo para o usuário atual
sudo chown "$(id -u):$(id -g)" ~/.kube/config

# 3. Instalar e configurar o New Relic para monitoramento
echo "Instalando o New Relic CLI..."
curl -Ls https://download.newrelic.com/install/newrelic-cli/scripts/install.sh | bash

echo "Configurando o monitoramento com o New Relic..."
NEW_RELIC_CLI_SKIP_CORE=1 \
NR_CLI_CLUSTERNAME="${NR_CLI_CLUSTERNAME}" \
NR_CLI_NAMESPACE="${NR_CLI_NAMESPACE}" \
NR_CLI_LOW_DATA_MODE=true \
NR_CLI_KSM=true \
NR_CLI_KUBE_EVENTS=true \
NR_CLI_GKE_AUTOPILOT=false \
NR_CLI_PRIVILEGED=true \
NR_CLI_PROMETHEUS_AGENT=true \
NR_CLI_PROMETHEUS_AGENT_LOW_DATA_MODE=true \
NR_CLI_CURATED=false \
NR_CLI_AGENT_OPERATOR=true \
NR_CLI_LOGGING=true \
NR_CLI_LOGGING_LOW_DATA_MODE=true \
NEW_RELIC_API_KEY="${NEW_RELIC_API_KEY}" \
NEW_RELIC_ACCOUNT_ID="${NEW_RELIC_ACCOUNT_ID}" \
/usr/local/bin/newrelic install -n kubernetes-open-source-integration

echo "Instalação e configuração concluídas com sucesso!"
