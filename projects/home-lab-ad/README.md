# Laboratorio de Active Directory con VirtualBox

Laboratorio completo de soporte IT con Active Directory, Windows Server 2022 y clientes Windows 11 unidos al dominio.

## Descripción
Entorno virtualizado que simula una infraestructura empresarial con:
- Controlador de dominio (Windows Server 2022)
- 2 clientes Windows 11 Pro unidos al dominio
- Gestión de usuarios, grupos y OUs
- Troubleshooting de DNS y red

## Topología
| VM | IP | Rol |
|----|----|-----|
| SRV01-DC | 192.168.100.2 | Controlador de dominio + DNS |
| WS01-USER | 192.168.100.10 | Cliente usuario estándar |
| WS02-ADMIN | 192.168.100.20 | Cliente usuario estándar |

- **Dominio:** lab.local
- **Red interna:** LabNetwork (192.168.100.0/24)

## Credenciales
| Usuario | Contraseña |
|---------|------------|
| LAB\Administrador | P@ssw0rd2026! |
| LAB\juan.perez | Passw0rd123! |
| LAB\jefe | Jefe2026! |
| LAB\ana.ventas | Ventas123! |
| LAB\carlos.rrhh | Rrhh123! |

## Estructura de Active Directory

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


## Tecnologías
- Oracle VirtualBox 7.2.4
- Windows Server 2022
- Windows 11 Pro
- Active Directory Domain Services
- PowerShell 7

## Escenarios Practicados
1. Instalación de Windows Server 2022 con experiencia de escritorio
2. Configuración de Active Directory y DNS
3. Creación de Unidades Organizativas (OUs)
4. Creación de usuarios de dominio
5. Gestión de grupos de seguridad
6. Unión de clientes al dominio
7. Troubleshooting de DNS (interfaces de escucha)
8. Solución de problemas de política de contraseñas

## Contenido
- `Documentation/` - Guías paso a paso de cada escenario
- `Scripts/` - Scripts PowerShell para reportes y gestión
- `Screenshots/` - Capturas de pantalla del proceso

## Capturas
| Captura | Descripción |
|---------|-------------|
| [AD Users](Screenshots/01-AD-Users.png) | Usuarios de dominio creados |
| [WS01 Login](Screenshots/02-WS01-Login.png) | WS01 con usuario de dominio |
| [WS02 Login](Screenshots/03-WS02-Login.png) | WS02 con usuario de dominio |
| [DNS Working](Screenshots/04-DNS-Working.png) | Resolución DNS del dominio |
| [Ping Test](Screenshots/05-Ping-Test.png) | Conectividad entre VMs |
| [OU Structure](Screenshots/06-OU-Structure.png) | Estructura de Unidades Organizativas |
| [Users in OUs](Screenshots/07-Users-In-OUs.png) | Usuarios por departamento |
| [Groups](Screenshots/08-Groups-Members.png) | Grupos de seguridad y miembros |

## Lecciones Aprendidas
- El DNS es crítico para AD; debe escuchar en la IP de la red interna
- Las políticas de contraseñas del dominio requieren complejidad
- La cuenta de usuario debe estar habilitada después de crear
- El firewall puede bloquear ICMP (ping)
- Las OUs permiten organizar usuarios y aplicar políticas específicas

## Ver también
- [Script de Monitoreo de Disco](../scripts/disk-monitor.ps1)
- [Documentación de PowerShell](https://learn.microsoft.com/powershell/)