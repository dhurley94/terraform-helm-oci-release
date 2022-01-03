# OCI Helm Release Terraform Module

## Description

This module enables you to deploy Helm releases based on charts stored in OCI compliant registries.

## Example

```hcl
module "helm-oci-release" {
  source = "github.com/FRosner/terraform-helm-oci-release"

  helm_login_command = "echo $REGISTRY_PW | helm registry login -u AWS --password-stdin"

  # This will pull the chart 123456.dkr.ecr.us-east-1.amazonaws.com/mycorp/helm/my-chart:1.0.0
  oci_repository = "123456.dkr.ecr.us-east-1.amazonaws.com"
  chart_prefix = "mycorp/helm"
  chart_name = "my-chart"
  chart_version = 1.0.0
}
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| chart\_download\_location | Temporary directory where to download the chart to | `string` | `"/tmp"` | no |
| chart\_name | Chart name (e.g. my-chart) | `any` | n/a | yes |
| chart\_prefix | Chart prefix (e.g. company/helm) | `any` | n/a | yes |
| chart\_version | Chart version (e.g. 0.1.0-988e9ea) | `any` | n/a | yes |
| helm\_login\_command | Command to login to the helm registry without the repository URL (e.g. 'echo $REGISTRY\_PASSWORD \| helm registry login -u AWS --password-stdin'). Leave unset / empty if no login should be performed. | `string` | `""` | no |
| kubernetes\_config\_path | Path to your Kubernetes configuration | `string` | `"~/.kube/config"` | no |
| oci\_repository | URL of the OCI repository (e.g. <registry\_id>.dkr.ecr.us-east-1.amazonaws.com for AWS ECS) | `any` | n/a | yes |
| release\_force\_update | Whether to helm install --force | `bool` | `true` | no |
| release\_name | Name of the helm release (leave unset / empty if you want to use the chart name) | `string` | `""` | no |
| release\_namespace | Kubernetes namespace to install the release to | `string` | `"default"` | no |
| set\_values | List of values that are individually merged into values | <pre>list(object({<br>    name  = string<br>    value = string<br>    type  = optional(string)<br>  }))</pre> | `[]` | no |
| values | List of values in raw yaml format to pass to helm. | `list(string)` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->