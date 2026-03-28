# Script: AD-Commands.ps1
# Uso: Ejecutar en SRV01-DC para ver estado de Active Directory

Write-Host "=== ACTIVE DIRECTORY STATUS ===" -ForegroundColor Cyan
Write-Host "Fecha: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""

Write-Host "--- USUARIOS DEL DOMINIO ---" -ForegroundColor Yellow
Get-ADUser -Filter * | Select-Object Name, SamAccountName, Enabled | Format-Table -AutoSize

Write-Host "--- COMPUTADORAS EN EL DOMINIO ---" -ForegroundColor Yellow
Get-ADComputer -Filter * | Select-Object Name, Enabled | Format-Table -AutoSize