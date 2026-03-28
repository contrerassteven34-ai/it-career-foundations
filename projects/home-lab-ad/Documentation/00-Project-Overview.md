00-Project-Overview.md
# Proyecto Home Lab IT Support

## Objetivo
Laboratorio virtual para practicar escenarios de soporte IT nivel 1-2.

## Tecnologías
- VirtualBox 7.2.4
- Windows 11 Pro
- Windows Server 2022
- PowerShell
- Active Directory

## Topología
| VM | IP | Rol |
|----|----|-----|
| SRV01-DC | 192.168.100.2 | Controlador de dominio |
| WS01-USER | 192.168.100.10 | Cliente usuario estándar |
| WS02-ADMIN | 192.168.100.20 | Cliente usuario estándar |

- Red interna: LabNetwork (192.168.100.0/24)
- Dominio: lab.local