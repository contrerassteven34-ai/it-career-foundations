# Configuración de Active Directory

## Credenciales
| Usuario | Contraseña |
|---------|------------|
| LAB\Administrador | P@ssw0rd2026! |
| LAB\juan.perez | Passw0rd123! |
| LAB\jefe | Jefe2026! |

## Comandos utilizados

### Configurar IP del servidor
```powershell
netsh interface ip set address "Ethernet 2" static 192.168.100.2 255.255.255.0

-------

## Instalar Active Directory

Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName "lab.local" -DomainNetbiosName "LAB" -InstallDns

-------

## Crear usuarios

New-ADUser -Name "Juan Perez" -SamAccountName "juan.perez" -UserPrincipalName "juan.perez@lab.local" -AccountPassword (ConvertTo-SecureString "Passw0rd123!" -AsPlainText -Force) -Enabled $true

New-ADUser -Name "Jefe" -SamAccountName "jefe" -UserPrincipalName "jefe@lab.local" -AccountPassword (ConvertTo-SecureString "Jefe2026!" -AsPlainText -Force) -Enabled $true

-------

## Unir clientes al dominio

# Configurar DNS en cliente
Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses 192.168.100.2

--------

# Unir al dominio
Add-Computer -DomainName "lab.local" -Credential "LAB\Administrador" -Restart


---

### Archivo: `04-Troubleshooting-Log.md`
```markdown
# Registro de Troubleshooting

## Problema 1: DNS no respondía en 192.168.100.2
- **Síntoma:** `nslookup lab.local 192.168.100.2` timeout
- **Causa:** DNS no escuchaba en la IP de red interna
- **Solución:** Configurar DNS para escuchar en todas las IPs desde `dnsmgmt.msc`

## Problema 2: Usuario jefe no podía iniciar sesión
- **Síntoma:** "La cuenta no está activada"
- **Causa:** Contraseña no cumplía política de complejidad del dominio
- **Solución:** Cambiar contraseña a `Jefe2026!` y habilitar cuenta

## Problema 3: Ping funcionaba solo en una dirección
- **Síntoma:** WS01 → WS02 sí, WS02 → WS01 no
- **Causa:** Firewall de Windows bloqueando ICMP entrante
- **Solución:** `New-NetFirewallRule -DisplayName "Permitir Ping" -Protocol ICMPv4 -IcmpType 8 -Action Allow`