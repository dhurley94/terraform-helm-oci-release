terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    helm = {
      source = "helm"
    }
  }
}
