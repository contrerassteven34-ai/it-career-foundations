# Escenario 1: Unidades Organizativas (OU)

## Objetivo
Organizar Active Directory por departamentos usando Unidades Organizativas.

## Estructura Creada

lab.local
└── DEPARTAMENTOS
├── TI
│ ├── USUARIOS (juan.perez, jefe)
│ └── COMPUTADORAS
├── VENTAS
│ ├── USUARIOS (ana.ventas)
│ └── COMPUTADORAS
└── RRHH
├── USUARIOS (carlos.rrhh)
└── COMPUTADORAS


## Comandos utilizados

### Crear OUs principales
```powershell
New-ADOrganizationalUnit -Name "DEPARTAMENTOS" -Path "DC=lab,DC=local"
New-ADOrganizationalUnit -Name "TI" -Path "OU=DEPARTAMENTOS,DC=lab,DC=local"
New-ADOrganizationalUnit -Name "VENTAS" -Path "OU=DEPARTAMENTOS,DC=lab,DC=local"
New-ADOrganizationalUnit -Name "RRHH" -Path "OU=DEPARTAMENTOS,DC=lab,DC=local"