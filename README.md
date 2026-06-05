[![Deploy](https://img.shields.io/github/actions/workflow/status/GMG-bit/AUY1105-Grupo-8/deploy.yml?label=Deploy&logo=github)](https://github.com/GMG-bit/AUY1105-Grupo-8/actions/workflows/deploy.yml)
[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D%201.0.0-623CE4?logo=terraform)](https://www.terraform.io/)
[![AWS Provider](https://img.shields.io/badge/AWS%20Provider-~%3E%206.0-FF9900?logo=amazon-aws)](https://registry.terraform.io/providers/hashicorp/aws/latest)
[![Licencia](https://img.shields.io/badge/Licencia-GPLv3-blue)](LICENSE)
![Demo del módulo](hi-hello.gif)

# Prueba Nº2 Alvarez, Berardinucci y Chacón 

## Descripción
Este módulo de Terraform implementa recursos de infraestructura en AWS de manera modular y reutilizable. Incluye la creación de una instancia EC2 parametrizada, junto con outputs para obtener su ID y dirección IP pública. El objetivo es facilitar la integración en distintos entornos, siguiendo buenas prácticas de documentación, versionado semántico y estructura de código.

## Objetivo
Este módulo crea una instancia EC2 en AWS, parametrizada para facilitar su reutilización en distintos proyectos.

## Parámetros
- `ami_id`: ID de la AMI a utilizar.
- `instance_type`: Tipo de instancia (ej. t2.micro).
- `subnet_id`: Subnet donde se desplegará la instancia.
- `sg_id`: Security Group asociado.
- `key_name`: Nombre del Key Pair para acceso SSH.

## Outputs
- `instance_id`: ID de la instancia EC2 creada.
- `instance_ip`: IP pública de la instancia EC2.



