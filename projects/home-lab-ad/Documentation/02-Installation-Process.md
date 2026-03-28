# Proceso de Instalación

## Windows Server 2022
1. Descargar ISO desde Microsoft Evaluation Center
2. Crear VM con EFI, TPM 2.0, 4GB RAM, 80GB disco
3. Instalar edición "Standard (Desktop Experience)"
4. Configurar contraseña Administrador: P@ssw0rd2026!
5. Instalar Guest Additions
6. Configurar IP estática: 192.168.100.2

## Windows 11 Pro (Win11-Base)
1. Descargar ISO x64 desde Microsoft
2. Crear VM con EFI, TPM 2.0, 4GB RAM, 64GB disco
3. Instalar sin cuenta Microsoft
4. Usuario local: admin.lab / Password123!
5. Instalar Guest Additions
6. Tomar snapshot base

## Clonación
- Win11-Base → WS01-USER (IP 192.168.100.10)
- Win11-Base → WS02-ADMIN (IP 192.168.100.20)