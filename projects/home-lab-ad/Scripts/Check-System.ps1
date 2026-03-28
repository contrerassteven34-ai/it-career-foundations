# Script: Check-System.ps1
# Uso: Verificación rápida del sistema

Write-Host "=== CHECK SYSTEM ===" -ForegroundColor Cyan
Write-Host "Fecha: $(Get-Date)" -ForegroundColor Yellow
Write-Host "Usuario: $env:USERNAME" -ForegroundColor Yellow
Write-Host "Computadora: $env:COMPUTERNAME" -ForegroundColor Yellow
Write-Host ""

Write-Host "--- ESPACIO EN DISCO ---" -ForegroundColor Green
Get-PSDrive C | Select-Object Name, @{Name="FreeGB";Expression={[math]::Round($_.Free/1GB,2)}}

Write-Host "--- SERVICIOS CRÍTICOS ---" -ForegroundColor Green
$services = @("DNS", "NTDS", "Kdc")
foreach ($s in $services) {
    $svc = Get-Service -Name $s -ErrorAction SilentlyContinue
    if ($svc) {
        Write-Host "$s : $($svc.Status)"
    } else {
        Write-Host "$s : No instalado"
    }
}