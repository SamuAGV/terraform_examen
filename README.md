# Examen práctico 2 - Terraform en Azure

Este proyecto despliega los elementos indicados en el PDF: Resource Group, App Service Plan, Web App, VNet y la subred de App Service. El plan está configurado como Windows SKU `F1` (nivel gratuito); la disponibilidad y los límites dependen de Azure y de la suscripción.

## Nombres y red

| Recurso | Nombre / configuración |
|---|---|
| Resource Group | `rg-utvt-examen-dev-mxc-001` |
| App Service Plan | `asp-utvt-examen-dev-mxc-001` |
| Web App | `app-utvt-examen-web-dev-mxc-001-samu-36b2` |
| VNet | `vnet-utvt-examen-dev-mxc-001` - `10.0.0.0/16` |
| Subnet de App Service | `snet-utvt-examen-app-dev-mxc-001` - `10.0.0.0/18` |

El nombre de una Web App debe ser único en Azure porque también forma parte de su hostname público. El nombre original del examen ya está ocupado, por lo que se agregó el sufijo `-samu-36b2`; si Azure indica que ese también existe, cambia `web_app_name` en `variables.tf` por otro sufijo disponible.

El PDF escribe `10.0.1.0/18`; para una máscara `/18`, el inicio canónico del bloque es `10.0.0.0`, que es el CIDR usado en Terraform. La subred pertenece al espacio de la VNet. La configuración conserva `Chile Central` como región.

## Ejecución (PowerShell)

```powershell
az login
az account set --subscription "36b2cb85-9b3e-4a5f-8d85-a3a19ffe3ba6"
az account show --output table
Copy-Item terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Revisa que el plan liste los cinco recursos esperados y la ubicación `Chile Central`. Cuando el plan sea correcto, crea los recursos:

```powershell
terraform apply
```

Terraform solicitará confirmación; escribe `yes` para aplicar. El despliegue crea recursos reales y podría consumir crédito. Al terminar la práctica puedes quitarlos con:

```powershell
terraform destroy
```

## Referencias

- [Proveedor AzureRM de Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Autenticación local de AzureRM con Azure CLI](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli)
- [Recurso azurerm_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan)
- [Recurso azurerm_windows_web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app)
- [Crear y administrar una VNet de Azure](https://learn.microsoft.com/en-us/azure/virtual-network/manage-virtual-network)
- [Azure for Students](https://azure.microsoft.com/es-es/free/students)
