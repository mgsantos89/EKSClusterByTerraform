# EKS By Terraform

Projeto de criação de cluster EKS utilizando Terraform

## Pré-Requisitos

* Terraform

* AWS CLI configurado com suas credenciais

* Bucket S3

## Preparação

### Backend

Colocar os parametros de backend dentro do arquivo **providers.tf** para armazenamento do state remoto do Terraform no bucket AWS.

```hcl
backend "s3" {
  bucket = "NOME_DO_SEU_BUCKET"
  key    = "PASTA/terraform.tfstate"
  region = "SUA_REGIAO_AWS"
  }
```
### Variaveis
A titulo de organização e manutenção do codigo alguns parâmetros estão em variavéis que devem ser passadas no arquivo ***terraform.tfvars***.

```hcl
#CIDR Block que será usado na criação da VPC EX:10.0.0.0/16
cidr_block      = "10.0.0.0/16"

#Nome do Projeto, que servirá de prefixo na definição de nome de todos os recursos provisionados
prefixo_projeto = "EKS-Homolog"

#Região de Provisionamento da Estrutura Ex:us-east-1
region          = "us-east-1"

#Tags a serem inseridas nos recursos para organização
tags = {
    Department = "DevOps"
    Project    = "Pessoal"
    Enviroment = "Development"
    "Gerenciado Por" =  "Terraform"
  }
```


## Provisionando Cluster

### Inicializando Backend

Após preparação das variáveis e configuração do Backend já inicializar nosso projeto terraform, para downloads das dependências do projeto e inicialização do backend execute

```
terraform init
```

### Plan

Uma vez inicializado o backend, podemos rodar o plan para o terraform planejar e preparar o provisionamento da estrutura

```
terraform plan
```

### Apply

Se o plan ocorrer sem erros é provavel que todas as variáveis tenham sido informadas corretamente e o codigo está pronto para ser executado e provisionar a estrutura conforme o que saida do comando plan no terminal. Para provisionar sua estrutura você pode rodar os seguintes comandos:

* Com confirmação
```
terraform apply
```

* Sem confirmação
```
terraform apply --auto-approve
```

### Concluido

Com apenas poucos comandos você provisionou todo um cluster EKS usando o Terraform, utilizando as melhores praticas recomendadas pela AWS e atendendo pré-requisitos para correto funcionamento do cluster,Resumo da Estrutura criada

* Network
  * VPC
  * Subnets publicas e privadas
  * Internet Gateway
  * Nat Gateway
  * Elastic IP
  * Route Tables

* EKS Cluster
  * Policies
  * IAM Roles
  * Security Groups
  * OIDC Provider

* Node Groups
  * Policies
  * IAM Roles
  * Node Groups

* Add-On Eks Cluster
  * Sevice Account
  * Policies
  * Roles
  * Aws Load balancer Controller

## Destruindo a Estrutura

No caso de necessidade de eliminiar a estrutura basta

* Planejar a destruição
```
terraform plan -destroy
```

* Executar com confirmação
```
terraform apply -destroy
```
Ou
* Executar sem confirmação
```
terraform apply -destroy --auto-approve
```

# Documentação dos Resources, Módulos e Variáveis do Terraform
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.38.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.12.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.26.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_aws_load_balancer_controller"></a> [eks\_aws\_load\_balancer\_controller](#module\_eks\_aws\_load\_balancer\_controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/eks | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./modules/network | n/a |
| <a name="module_eks_node_group"></a> [eks\_node\_group](#module\_eks\_node\_group) | ./modules/node-group | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR de Rede para ser usado na VPC | `string` | n/a | yes |
| <a name="input_prefixo_projeto"></a> [prefixo\_projeto](#input\_prefixo\_projeto) | Prefixo para nome de recursos | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região AWS para criação dos Recursos | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | TAGS padrões a serem incluidas para identificações dos recursos | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_authority"></a> [certificate\_authority](#output\_certificate\_authority) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
<!-- END_TF_DOCS -->