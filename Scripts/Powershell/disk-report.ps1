# disk-report.ps1 - Reporte básico de espacio en disco
# Autor: Steven Contreras
# Propósito: Demostrar habilidades básicas de PowerShell para soporte TI

Write-Host "=== REPORTE DE ESPACIO EN DISCO ===" -ForegroundColor Cyan
Write-Host "Generado: $(Get-Date)`n"

Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    $totalGB = [math]::Round(($_.Used + $_.Free) / 1GB, 2)
    $usedGB = [math]::Round($_.Used / 1GB, 2)
    $freeGB = [math]::Round($_.Free / 1GB, 2)
    
    Write-Host "Unidad $($_.Name):\" -ForegroundColor Yellow
    Write-Host "  Total: $totalGB GB"
    Write-Host "  Usado: $usedGB GB"
    Write-Host "  Libre: $freeGB GB"
    
    if ($freeGB -lt 10) {
        Write-Host "  ⚠️  Advertencia: Espacio bajo" -ForegroundColor Red
    }
    Write-Host ""
}