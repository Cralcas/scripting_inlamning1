# Funktion för att skapa en mapp
function New-Directory {
    param (
        [string]$path
    )
      New-Item -ItemType Directory -Path $path -ErrorAction Stop
}

# Funktion för att skapa en loggfil
function New-LogFile {
    param (
        [string]$path
    )
    New-Item -ItemType File -Path $path -ErrorAction Stop

    # Datum + tid
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    # Skriv till filen
    Add-Content -Path $path -Value "Mapp skapad: $timestamp"
}

# Fråga användaren efter namn på mappen
$folderName = Read-Host "Vad ska mappen heta?"

#Plats mappen ska skapas
$basePath = Get-Location
$fullPath = Join-Path $basePath $folderName

# Array med namn på det undermapparna ska heta
$subDirectories = @("logs", "scripts", "temp")

# Skapa datum samt sökväg och namn för loggfilen
$datum = Get-Date -Format "yyyy-MM-dd"
$logsPath = Join-Path $fullPath "logs"

$logFile = Join-Path $logsPath "log-$datum.log"

try {
    # Finns mappen? Om ja, skriv ut felmeddelande
    if (Test-Path $fullPath) {
        Write-Host "Mappen $folderName finns redan!"
        return
    }

    # Skapa huvudmappen
    New-Directory $fullPath

    # Skapa undermappar
    foreach ($directory in $subDirectories) {
        $subPath = Join-Path $fullPath $directory
        New-Directory $subPath

    }
    
    # Skapa loggfilen
    New-LogFile $logFile
 
    # Skriv ut att mapp och fil är skapad
    Write-Host "Loggfil skapad: $logFile"
    Write-Host "Mapp skapad: $folderName"

}   
catch {
    # Felmeddelande
    Write-Host "Något gick fel: $($_.Exception.Message)"
}
