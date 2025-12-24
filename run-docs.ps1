# AI Learning Hub 2025 - PowerShell Server Script
# Port: 3003

$Host.UI.RawUI.WindowTitle = "AI Learning Hub - Port 3003"

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║          AI Learning Hub 2025 - Documentation Server       ║" -ForegroundColor Cyan
Write-Host "║          Microsoft │ Google │ Amazon AI Roadmaps           ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""
Write-Host "🚀 Đang khởi động server trên port 3003..." -ForegroundColor Green
Write-Host ""
Write-Host "🌐 URL: " -NoNewline
Write-Host "http://localhost:3003" -ForegroundColor Yellow
Write-Host ""
Write-Host "⚠️  Nhấn Ctrl+C để dừng server" -ForegroundColor Red
Write-Host ""
Write-Host "────────────────────────────────────────────────────────────────" -ForegroundColor Gray
Write-Host ""

# Change to script directory
Set-Location $PSScriptRoot

# Open browser after delay
Start-Job -ScriptBlock {
    Start-Sleep -Seconds 2
    Start-Process "http://localhost:3003"
} | Out-Null

# Try Python first
$pythonPath = Get-Command python -ErrorAction SilentlyContinue
if ($pythonPath) {
    Write-Host "🐍 Sử dụng Python HTTP Server..." -ForegroundColor Green
    python -m http.server 3003
    exit
}

# Try Python3
$python3Path = Get-Command python3 -ErrorAction SilentlyContinue
if ($python3Path) {
    Write-Host "🐍 Sử dụng Python3 HTTP Server..." -ForegroundColor Green
    python3 -m http.server 3003
    exit
}

# Try npx
$npxPath = Get-Command npx -ErrorAction SilentlyContinue
if ($npxPath) {
    Write-Host "📦 Sử dụng Docsify CLI..." -ForegroundColor Green
    npx docsify-cli serve . -p 3003
    exit
}

# No server found
Write-Host ""
Write-Host "❌ Không tìm thấy Python hoặc Node.js!" -ForegroundColor Red
Write-Host ""
Write-Host "📋 Vui lòng cài đặt một trong hai:" -ForegroundColor Yellow
Write-Host ""
Write-Host "   1. Python: https://python.org" -ForegroundColor White
Write-Host "      (Khuyến nghị - đơn giản nhất)" -ForegroundColor Gray
Write-Host ""
Write-Host "   2. Node.js: https://nodejs.org" -ForegroundColor White
Write-Host "      Sau đó chạy: npm install -g docsify-cli" -ForegroundColor Gray
Write-Host ""

Read-Host "Nhấn Enter để thoát"
