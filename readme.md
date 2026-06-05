# PWSH Inlämning 1


## Beskrivning

Det här scriptet skapar en mapp döpt efter användarens input.

Inuti mappen skapas tre undermappar:
- logs
- scripts
- temps

Scriptet skapar även en loggfil i `logs`-mappen med datum och tid för när mappen samt filerna skapades.

## Hur man kör scriptet

Kör scriptet i PowerShell:

```powershell
.\strukturverktyg.ps1
```

Användaren får sedan ange vad mappen ska heta.

## Vad jag tyckte var svårt eller intressant

Jag tyckte det var intressant att arbeta med `Join-Path` och att skapa loggfiler automatiskt.
