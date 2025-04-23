
# Home Lab Setup com K3s e Monitoramento via New Relic

Esse projeto documenta e automatiza a configuração de um ambiente de Home Lab — começando com um cluster K3s leve, funcional e já integrado com o New Relic para monitoramento desde o primeiro deploy.

Ideal pra quem quer testar arquitetura, observabilidade e automações num ambiente local antes de aplicar em produção.

---

## O que está incluído aqui

- Instalação automatizada do **K3s**
- Configuração do **kubectl** com permissões ajustadas
- Integração com o **New Relic** via CLI
- Variáveis de ambiente parametrizadas em `config.env`
- Scripts prontos para extender com ferramentas como **Backstage**, **ArgoCD** e mais

---

## Como usar

1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/home-lab-setup.git
cd home-lab-setup
```

2. Edite as variáveis de ambiente

```bash
nano config.env
```

3. Execute o script de instalação

```bash
chmod +x scripts/install_home_lab.sh
./scripts/install_home_lab.sh
```

---

## O que o script faz

```plaintext
scripts/install_home_lab.sh
├── Instala o K3s com curl direto do site oficial
├── Configura o kubeconfig em ~/.kube/config
├── Ajusta permissões e diretórios
└── Instala o New Relic CLI e aplica as credenciais do config.env
```

---

## Próximas etapas (em andamento)

- Deploy automatizado do **Backstage** como portal de plataforma
- Integração com **ArgoCD** para GitOps local
- Monitoramento expandido com dashboards e alertas no New Relic

---

## Contribuições

Quer sugerir uma ferramenta nova ou melhorar algo do fluxo?  
Pull requests e issues são bem-vindos.

---

## Licença

MIT — veja o arquivo LICENSE

---

📫 [LinkedIn](https://www.linkedin.com/in/jefferson-hoy-valente/)
