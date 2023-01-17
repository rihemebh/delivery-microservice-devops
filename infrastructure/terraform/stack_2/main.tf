data "terraform_remote_state" "aks" {

  backend = "azurerm"

  config = {
    resource_group_name  = "Devops-project"
    container_name       = "tfblob"
    storage_account_name = "terraformback"
    key                  = "infra-stack.json"
  }
}



resource "helm_release" "argo" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

}

