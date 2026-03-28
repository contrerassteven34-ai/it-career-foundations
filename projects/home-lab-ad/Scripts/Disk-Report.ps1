# Script: Disk-Report.ps1
# Uso: Reporte de espacio en disco

Write-Host "=== REPORTE DE DISCO ===" -ForegroundColor Cyan
Write-Host "Fecha: $(Get-Date)" -ForegroundColor Yellow
Write-Host ""

$drives = Get-PSDrive -PSProvider FileSystem

foreach ($drive in $drives) {
    if ($drive.Used -gt 0) {
        $freeGB = [math]::Round($drive.Free / 1GB, 2)
        $usedGB = [math]::Round($drive.Used / 1GB, 2)
        $totalGB = [math]::Round(($drive.Used + $drive.Free) / 1GB, 2)
        $percentFree = [math]::Round(($drive.Free / ($drive.Used + $drive.Free)) * 100, 2)
        
        Write-Host "Drive $($drive.Name):" -ForegroundColor Green
        Write-Host "  Total: $totalGB GB"
        Write-Host "  Libre: $freeGB GB ($percentFree%)"
        
        if ($percentFree -lt 10) {
            Write-Host "  ESPACIO CRÍTICO" -ForegroundColor Red
        }
    }
}

