# Repository Setup Script
# Clones multiple repositories and runs pixi install + data download tasks

# Configuration
$repositories = @(
    "https://github.com/cuenca-mb/pixi-napari-assistant.git"
)

# The pixi task name to run for downloading data (adjust as needed)
$pixiDataTask = "download-data"

# Base directory for cloning (current directory by default)
$baseDir = Get-Location

Write-Host "Starting repository setup..." -ForegroundColor Cyan
Write-Host "Base directory: $baseDir" -ForegroundColor Gray
Write-Host ""

foreach ($repo in $repositories) {
    # Extract repository name from URL
    $repoName = ($repo -replace '\.git$', '') -split '/' | Select-Object -Last 1
    $repoPath = Join-Path $baseDir $repoName
    
    Write-Host "Processing: $repoName" -ForegroundColor Yellow
    Write-Host "=" * 60
    
    # Clone repository if it doesn't exist
    if (Test-Path $repoPath) {
        Write-Host "  Repository already exists, skipping clone..." -ForegroundColor Gray
    } else {
        Write-Host "  Cloning from: $repo" -ForegroundColor Green
        git clone $repo
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  ERROR: Failed to clone repository!" -ForegroundColor Red
            continue
        }
    }
    
    # Change to repository directory
    Push-Location $repoPath
    
    try {
        # Run pixi install
        Write-Host "  Running pixi install..." -ForegroundColor Green
        pixi install
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  ERROR: pixi install failed!" -ForegroundColor Red
            Pop-Location
            continue
        }
        
        # Run pixi data download task
        Write-Host "  Running pixi run $pixiDataTask..." -ForegroundColor Green
        pixi run $pixiDataTask
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  WARNING: pixi task '$pixiDataTask' failed or doesn't exist" -ForegroundColor Yellow
        }
        
        Write-Host "  Completed successfully!" -ForegroundColor Green
    }
    finally {
        # Return to base directory
        Pop-Location
    }
    
    Write-Host ""
}

Write-Host "All repositories processed!" -ForegroundColor Cyan
