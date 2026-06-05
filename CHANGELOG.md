# CHANGELOG

## [1.3.0] - 2026-04-28
### Added
- Creación inicial del repositorio AUY1105-grupo-XX
- Añadido README.md con objetivos
- Añadido .gitignore para Terraform
- main.tf con VPC, Subnet, SG y EC2
- variables.tf y outputs.tf para modularidad
- policies/security.rego con reglas OPA
- pipeline.yml con validaciones (TFLint, Checkov, Terraform, OPA)

- se agrego la Internet Gateway y la route Table configurada
## [1.0.1] - 2026-04-29
### Added
- Tag `Environment = "dev"` en recurso EC2 dentro de `main.tf`.

## [1.0.2] - 2026-04-29
### Added
- Corrección en `pipeline.yml
## [1.1.0] - 2026-04-28
### Añadido
- Mejora en las descripciones de variables para cumplimiento de nomenclatura.
- Actualización de políticas OPA para validación de SSH y tipo de instancia.


## [1.2.0] - 2026-04-28

### Corregido
- **Pipeline:** Se corrigió el error de resolución de versión en la acción de TFLint cambiando `terraform-linters/tflint/action@v4` por `terraform-linters/setup-tflint@v4` para permitir la ejecución del análisis estático.
- **Seguridad:** Se implementó el flag `--soft-fail` en la etapa de Checkov para permitir que el pipeline avance a la validación final mientras se mantienen visibles las alertas de seguridad identificadas.

### Añadido
- **Infraestructura:** Se parametrizó el tipo de instancia EC2 en `variables.tf` y `main.tf`, asegurando el cumplimiento de la política OPA que restringe el uso a `t2.micro`.
- **Documentación:** Se agregaron descripciones detalladas a las variables de red y cómputo para mejorar la mantenibilidad del código.

## [2.0.0] - 2026-06-04
## Added
- Creación de la carpeta `modules` con subcarpetas `computo` y `redes`.
- Modificación de `infra/main.tf` para orquestar los módulos.

## [2.1.0] - 2026-06-05
## Added
- Modificación en `variables.tf` dentro de `modules/`.
- Actualización en todos los `outputs.tf`.
- Modificación de `pipeline.yml`.
- Ajustes en `computo.tf` y `redes.tf`.

## [2.1.1] - 2026-06-05
## Added
- Se agrego `hi-hello.gif` a `README.md`

## [2.1.1] - 2026-06-05
## Fixed
- Se arreglo `variables.tf` dentro de `infra`
- Se arreglo `pipeline.yml`

## [2.1.2] - 2026-06-05
## Added
- Se tiparon todas las variables en `infra/variables.tf` (`type = string`).
- Se agregaron `description` en reglas de seguridad (SG) y se evitó usar el default SG.
- En EC2:
  - Activado `monitoring = true`.
  - Forzado IMDSv2 (`http_tokens = "required"`).
  - Eliminada IP pública (opcional).
- Pipeline:
  - Ajustado trigger para `push` y `pull_request`.
  - Agregado paso `Terraform Plan (JSON)` para OPA.
