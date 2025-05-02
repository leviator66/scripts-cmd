@echo off
REM ================================================================
REM Ce script permet de :
REM - Lire un fichier CSV contenant la configuration complète
REM - Créer les unités d'organisation (OU) de façon hiérarchique
REM - Créer les comptes utilisateurs avec leurs paramètres
REM ================================================================

setlocal enabledelayedexpansion

REM Lecture du fichier CSV et traitement ligne par ligne
for /f "tokens=1-100 delims=;" %%I in (user.csv) do (
    REM Affichage des valeurs pour débogage
    Echo %%I - %%J - %%K - %%L - %%M - %%N  - %%O 

    REM Stockage des valeurs dans des variables
    set I=%%I

    set J=%%J

    set K=%%K

    set L=%%L

    set M=%%M

    set N=%%N

    set O=%%O

    set P=%%P

    echo !I!
    echo !J! 
    echo !K!
    echo !L!
    echo !M!
    echo !N!
    echo !O!
    echo !P!

    REM Définition des variables de domaine et serveur
    set domaine=gec
    set srv=infra

    REM ================================================================
    REM Création des unités d'organisation (OU)
    REM Format attendu: ou-nomOU
    REM ================================================================
    echo %%I | find /i "ou-" >nul && set ouc=ou=!I:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"
    echo %%J | find /i "ou-" >nul && if "%%I"=="-" ( dsadd ou "ou=!J:*-=!,!ou1!dc=!domaine!,dc=!srv!" && set ouc=ou=!J:*-=!,!ou1! ) else (set ereur)|| if "%%I"=="--" ( dsadd ou "ou=!J:*-=!,!ou2!dc=!domaine!,dc=!srv!" && set ouc=ou=!J:*-=!,!ou2! ) else (set ereur)|| if "%%I"=="---" ( dsadd ou "ou=!J:*-=!,!ou3!dc=!domaine!,dc=!srv!" && set ouc=ou=!J:*-=!,!ou3! ) else (set ereur)|| if "%%I"=="----" ( dsadd ou "ou=!J:*-=!,!ou4!dc=!domaine!,dc=!srv!" && set ouc=ou=!J:*-=!,!ou4! ) else (set ereur)|| if "%%I"=="-----" ( dsadd ou "ou=!J:*-=!,!ou5!dc=!domaine!,dc=!srv!" && set ouc=ou=!J:*-=!,!ou5! ) else (set ereur)|| set ouc=ou=!J:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"
    echo %%K | find /i "ou-" >nul && if "%%J"=="-" ( dsadd ou "ou=!K:*-=!,!ou1!dc=!domaine!,dc=!srv!" && set ouc=ou=!K:*-=!,!ou1! ) else (set ereur)|| if "%%J"=="--" ( dsadd ou "ou=!K:*-=!,!ou2!dc=!domaine!,dc=!srv!" && set ouc=ou=!K:*-=!,!ou2! ) else (set ereur)|| if "%%J"=="---" ( dsadd ou "ou=!K:*-=!,!ou3!dc=!domaine!,dc=!srv!" && set ouc=ou=!K:*-=!,!ou3! ) else (set ereur)|| if "%%J"=="----" ( dsadd ou "ou=!K:*-=!,!ou4!dc=!domaine!,dc=!srv!" && set ouc=ou=!K:*-=!,!ou4! ) else (set ereur)|| if "%%J"=="-----" ( dsadd ou "ou=!K:*-=!,!ou5!dc=!domaine!,dc=!srv!" && set ouc=ou=!K:*-=!,!ou5! ) else (set ereur)|| set ouc=ou=!K:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"
    echo %%L | find /i "ou-" >nul && if "%%K"=="-" ( dsadd ou "ou=!L:*-=!,!ou1!dc=!domaine!,dc=!srv!" && set ouc=ou=!L:*-=!,!ou1! ) else (set ereur)|| if "%%K"=="--" ( dsadd ou "ou=!L:*-=!,!ou2!dc=!domaine!,dc=!srv!" && set ouc=ou=!L:*-=!,!ou2! ) else (set ereur)|| if "%%K"=="---" ( dsadd ou "ou=!L:*-=!,!ou3!dc=!domaine!,dc=!srv!" && set ouc=ou=!L:*-=!,!ou3! ) else (set ereur)|| if "%%K"=="----" ( dsadd ou "ou=!L:*-=!,!ou4!dc=!domaine!,dc=!srv!" && set ouc=ou=!L:*-=!,!ou4! ) else (set ereur)|| if "%%K"=="-----" ( dsadd ou "ou=!L:*-=!,!ou5!dc=!domaine!,dc=!srv!" && set ouc=ou=!L:*-=!,!ou5! ) else (set ereur)|| set ouc=ou=!L:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"
    echo %%M | find /i "ou-" >nul && if "%%L"=="-" ( dsadd ou "ou=!M:*-=!,!ou1!dc=!domaine!,dc=!srv!" && set ouc=ou=!M:*-=!,!ou1! ) else (set ereur)|| if "%%L"=="--" ( dsadd ou "ou=!M:*-=!,!ou2!dc=!domaine!,dc=!srv!" && set ouc=ou=!M:*-=!,!ou2! ) else (set ereur)|| if "%%L"=="---" ( dsadd ou "ou=!M:*-=!,!ou3!dc=!domaine!,dc=!srv!" && set ouc=ou=!M:*-=!,!ou3! ) else (set ereur)|| if "%%L"=="----" ( dsadd ou "ou=!M:*-=!,!ou4!dc=!domaine!,dc=!srv!" && set ouc=ou=!M:*-=!,!ou4! ) else (set ereur)|| if "%%L"=="-----" ( dsadd ou "ou=!M:*-=!,!ou5!dc=!domaine!,dc=!srv!" && set ouc=ou=!M:*-=!,!ou5! ) else (set ereur)|| set ouc=ou=!M:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"
    echo %%N | find /i "ou-" >nul && if "%%M"=="-" ( dsadd ou "ou=!N:*-=!,!ou1!dc=!domaine!,dc=!srv!" && set ouc=ou=!N:*-=!,!ou1! ) else (set ereur)|| if "%%M"=="--" ( dsadd ou "ou=!N:*-=!,!ou2!dc=!domaine!,dc=!srv!" && set ouc=ou=!N:*-=!,!ou2! ) else (set ereur)|| if "%%M"=="---" ( dsadd ou "ou=!N:*-=!,!ou3!dc=!domaine!,dc=!srv!" && set ouc=ou=!N:*-=!,!ou3! ) else (set ereur)|| if "%%M"=="----" ( dsadd ou "ou=!N:*-=!,!ou4!dc=!domaine!,dc=!srv!" && set ouc=ou=!N:*-=!,!ou4! ) else (set ereur)|| if "%%M"=="-----" ( dsadd ou "ou=!N:*-=!,!ou5!dc=!domaine!,dc=!srv!" && set ouc=ou=!N:*-=!,!ou5! ) else (set ereur)|| set ouc=ou=!N:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"
    echo %%0 | find /i "ou-" >nul && if "%%N"=="-" ( dsadd ou "ou=!O:*-=!,!ou1!dc=!domaine!,dc=!srv!" && set ouc=ou=!O:*-=!,!ou1! ) else (set ereur)|| if "%%N"=="--" ( dsadd ou "ou=!O:*-=!,!ou2!dc=!domaine!,dc=!srv!" && set ouc=ou=!O:*-=!,!ou2! ) else (set ereur)|| if "%%N"=="---" ( dsadd ou "ou=!O:*-=!,!ou3!dc=!domaine!,dc=!srv!" && set ouc=ou=!O:*-=!,!ou3! ) else (set ereur)|| if "%%N"=="----" ( dsadd ou "ou=!O:*-=!,!ou4!dc=!domaine!,dc=!srv!" && set ouc=ou=!O:*-=!,!ou4! ) else (set ereur)|| if "%%N"=="-----" ( dsadd ou "ou=!O:*-=!,!ou5!dc=!domaine!,dc=!srv!" && set ouc=ou=!O:*-=!,!ou5! ) else (set ereur)|| set ouc=ou=!O:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"
    echo %%P | find /i "ou-" >nul && if "%%O"=="-" ( dsadd ou "ou=!P:*-=!,!ou1!dc=!domaine!,dc=!srv!" && set ouc=ou=!P:*-=!,!ou1! ) else (set ereur)|| if "%%O"=="--" ( dsadd ou "ou=!P:*-=!,!ou2!dc=!domaine!,dc=!srv!" && set ouc=ou=!P:*-=!,!ou2! ) else (set ereur)|| if "%%O"=="---" ( dsadd ou "ou=!P:*-=!,!ou3!dc=!domaine!,dc=!srv!" && set ouc=ou=!P:*-=!,!ou3! ) else (set ereur)|| if "%%O"=="----" ( dsadd ou "ou=!P:*-=!,!ou4!dc=!domaine!,dc=!srv!" && set ouc=ou=!P:*-=!,!ou4! ) else (set ereur)|| if "%%O"=="-----" ( dsadd ou "ou=!P:*-=!,!ou5!dc=!domaine!,dc=!srv!" && set ouc=ou=!P:*-=!,!ou5! ) else (set ereur)|| set ouc=ou=!P:*-=!,!ouc! && dsadd ou "!ouc!dc=!domaine!,dc=!srv!"

    REM ================================================================
    REM Création des dossiers et attribution des permissions
    REM Format attendu: dl-nomdossier-permission
    REM Permissions possibles : L-E (Modification), L (Lecture), X (Refus)
    REM ================================================================
    echo %%I | find /i "dl-" >nul && dsadd group "cn=!I!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%I,   
    echo %%J | find /i "dl-" >nul && dsadd group "cn=!J!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%J, && if "%%I"=="-" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dld=%%c" & set "dld1=%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dlo=%%d" ) && if "!dlo!" =="L-E" ( icacls "C:\!dld!" /grant "%%J:M" ) else (set ereur)|| if "!dlo!" =="L" ( icacls "C:\!dld!" /grant "%%J:R" ) else (set ereur)|| if "!dlo!" =="X" ( icacls "C:\!dld!" /deny "%%J:F" ) ) else (set ereur)|| if "%%I"=="--" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dld=!dld1!%%c" & set "dld2=!dld1!%%c\") && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!J!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !J!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !J!:F ) ) else (set ereur)|| if "%%I"=="---" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dld=!dld2!%%c" & set "dld3=!dld2!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!J!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !J!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !J!:F ) ) else (set ereur)||  if "%%I"=="----" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dld=!dld3!%%c" & set "dld4=!dld3!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!J!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!J!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !J!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !J!:F ) )               
    echo %%K | find /i "dl-" >nul && dsadd group "cn=!K!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%K, && if "%%J"=="-" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dld=%%c" & set "dld1=%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dlo=%%d" ) && if "!dlo!" =="L-E" ( icacls "C:\!dld!" /grant "%%K:M" ) else (set ereur)|| if "!dlo!" =="L" ( icacls "C:\!dld!" /grant "%%K:R" ) else (set ereur)|| if "!dlo!" =="X" ( icacls "C:\!dld!" /deny "%%K:F" ) ) else (set ereur)|| if "%%J"=="--" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dld=!dld1!%%c" & set "dld2=!dld1!%%c\") && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!K!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !K!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !K!:F ) ) else (set ereur)|| if "%%J"=="---" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dld=!dld2!%%c" & set "dld3=!dld2!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!K!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !K!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !K!:F ) ) else (set ereur)||  if "%%J"=="----" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dld=!dld3!%%c" & set "dld4=!dld3!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!K!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!K!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !K!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !K!:F ) )               
    echo %%L | find /i "dl-" >nul && dsadd group "cn=!L!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%L, && if "%%K"=="-" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dld=%%c" & set "dld1=%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dlo=%%d" ) && if "!dlo!" =="L-E" ( icacls "C:\!dld!" /grant "%%L:M" ) else (set ereur)|| if "!dlo!" =="L" ( icacls "C:\!dld!" /grant "%%L:R" ) else (set ereur)|| if "!dlo!" =="X" ( icacls "C:\!dld!" /deny "%%L:F" ) ) else (set ereur)|| if "%%K"=="--" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dld=!dld1!%%c" & set "dld2=!dld1!%%c\") && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!L!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !L!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !L!:F ) ) else (set ereur)|| if "%%K"=="---" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dld=!dld2!%%c" & set "dld3=!dld2!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!L!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !L!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !L!:F ) ) else (set ereur)||  if "%%K"=="----" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dld=!dld3!%%c" & set "dld4=!dld3!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!L!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!L!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !L!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !L!:F ) )           
    echo %%M | find /i "dl-" >nul && dsadd group "cn=!M!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%M, && if "%%L"=="-" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dld=%%c" & set "dld1=%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dlo=%%d" ) && if "!dlo!" =="L-E" ( icacls "C:\!dld!" /grant "%%M:M" ) else (set ereur)|| if "!dlo!" =="L" ( icacls "C:\!dld!" /grant "%%M:R" ) else (set ereur)|| if "!dlo!" =="X" ( icacls "C:\!dld!" /deny "%%M:F" ) ) else (set ereur)|| if "%%L"=="--" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dld=!dld1!%%c" & set "dld2=!dld1!%%c\") && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!M!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !M!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !M!:F ) ) else (set ereur)|| if "%%L"=="---" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dld=!dld2!%%c" & set "dld3=!dld2!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!M!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !M!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !M!:F ) ) else (set ereur)||  if "%%L"=="----" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dld=!dld3!%%c" & set "dld4=!dld3!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!M!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!M!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !M!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !M!:F ) )         
    echo %%N | find /i "dl-" >nul && dsadd group "cn=!N!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%N, && if "%%M"=="-" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dld=%%c" & set "dld1=%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dlo=%%d" ) && if "!dlo!" =="L-E" ( icacls "C:\!dld!" /grant "%%N:M" ) else (set ereur)|| if "!dlo!" =="L" ( icacls "C:\!dld!" /grant "%%N:R" ) else (set ereur)|| if "!dlo!" =="X" ( icacls "C:\!dld!" /deny "%%N:F" ) ) else (set ereur)|| if "%%M"=="--" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dld=!dld1!%%c" & set "dld2=!dld1!%%c\") && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!N!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !N!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !N!:F ) ) else (set ereur)|| if "%%M"=="---" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dld=!dld2!%%c" & set "dld3=!dld2!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!N!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !N!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !N!:F ) ) else (set ereur)||  if "%%M"=="----" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dld=!dld3!%%c" & set "dld4=!dld3!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!N!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!N!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !N!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !N!:F ) )           
    echo %%O | find /i "dl-" >nul && dsadd group "cn=!O!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%O, && if "%%N"=="-" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dld=%%c" & set "dld1=%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dlo=%%d" ) && if "!dlo!" =="L-E" ( icacls "C:\!dld!" /grant "%%O:M" ) else (set ereur)|| if "!dlo!" =="L" ( icacls "C:\!dld!" /grant "%%O:R" ) else (set ereur)|| if "!dlo!" =="X" ( icacls "C:\!dld!" /deny "%%O:F" ) ) else (set ereur)|| if "%%N"=="--" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dld=!dld1!%%c" & set "dld2=!dld1!%%c\") && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!O!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !O!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !O!:F ) ) else (set ereur)|| if "%%N"=="---" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dld=!dld2!%%c" & set "dld3=!dld2!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!O!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !O!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !O!:F ) ) else (set ereur)||  if "%%N"=="----" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dld=!dld3!%%c" & set "dld4=!dld3!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!O!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!O!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !O!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !O!:F ) )            
    echo %%P | find /i "dl-" >nul && dsadd group "cn=!P!,!ouc!dc=!domaine!,dc=!srv!" -scope l && set dl1=%%P, && if "%%O"=="-" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dld=%%c" & set "dld1=%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dlo=%%d" ) && if "!dlo!" =="L-E" ( icacls "C:\!dld!" /grant "%%P:M" ) else (set ereur)|| if "!dlo!" =="L" ( icacls "C:\!dld!" /grant "%%P:R" ) else (set ereur)|| if "!dlo!" =="X" ( icacls "C:\!dld!" /deny "%%P:F" ) ) else (set ereur)|| if "%%O"=="--" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dld=!dld1!%%c" & set "dld2=!dld1!%%c\") && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!P!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !P!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !P!:F ) ) else (set ereur)|| if "%%O"=="---" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dld=!dld2!%%c" & set "dld3=!dld2!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!P!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !P!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !P!:F ) ) else (set ereur)||  if "%%O"=="----" ( for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dld=!dld3!%%c" & set "dld4=!dld3!%%c\" ) && mkdir "C:\!dld!" & for /f "tokens=1,2,3,* delims=-" %%a in ("!P!") do ( set "dlo=%%d" ) && if "!dlo!"=="L-E" ( icacls "C:\!dld!" /grant "!P!:M" ) else (set ereur)|| if "!dlo!"=="L" ( icacls "C:\!dld!" /grant !P!:R ) else (set ereur)|| if "!dlo!"=="X" ( icacls "C:\!dld!" /deny !P!:F ) )         

    REM ================================================================
    REM Création des groupes globaux
    REM Format attendu: gg-nomgroupe
    REM ================================================================
    echo %%I | find /i "gg-" >nul && dsadd group "cn=!I!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%I, 
    echo %%J | find /i "gg-" >nul && for /f "tokens=* delims=" %%a in ('dsquery group -name "!J!"') do (set ggou=%%a) && if "%%I"=="-" ( dsmod group "cn=!dl1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "!ggou!" ) else (set ereur)|| dsadd group "cn=!J!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%J,
    echo %%K | find /i "gg-" >nul && for /f "tokens=* delims=" %%a in ('dsquery group -name "!K!"') do (set ggou=%%a) && if "%%J"=="-" ( dsmod group "cn=!dl1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "!ggou!" ) else (set ereur)|| dsadd group "cn=!K!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%K,
    echo %%L | find /i "gg-" >nul && for /f "tokens=* delims=" %%a in ('dsquery group -name "!L!"') do (set ggou=%%a) && if "%%K"=="-" ( dsmod group "cn=!dl1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "!ggou!" ) else (set ereur)|| dsadd group "cn=!L!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%L,
    echo %%M | find /i "gg-" >nul && for /f "tokens=* delims=" %%a in ('dsquery group -name "!M!"') do (set ggou=%%a) && if "%%L"=="-" ( dsmod group "cn=!dl1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "!ggou!" ) else (set ereur)|| dsadd group "cn=!M!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%M,
    echo %%N | find /i "gg-" >nul && for /f "tokens=* delims=" %%a in ('dsquery group -name "!N!"') do (set ggou=%%a) && if "%%M"=="-" ( dsmod group "cn=!dl1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "!ggou!" ) else (set ereur)|| dsadd group "cn=!N!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%N,
    echo %%O | find /i "gg-" >nul && for /f "tokens=* delims=" %%a in ('dsquery group -name "!O!"') do (set ggou=%%a) && if "%%N"=="-" ( dsmod group "cn=!dl1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "!ggou!" ) else (set ereur)|| dsadd group "cn=!O!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%O,
    echo %%P | find /i "gg-" >nul && for /f "tokens=* delims=" %%a in ('dsquery group -name "!P!"') do (set ggou=%%a) && if "%%O"=="-" ( dsmod group "cn=!dl1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "!ggou!" ) else (set ereur)|| dsadd group "cn=!P!,!ouc!dc=!domaine!,dc=!srv!" -scope g && set gg1=%%P,

    REM ================================================================
    REM Création des utilisateurs et ajout aux groupes
    REM Format attendu: user-nomutilisateur
    REM ================================================================
    echo %%I | find /i "user-" >nul && dsadd user "cn=!I:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no
    echo %%J | find /i "user-" >nul && if "%%I"=="-" ( dsadd user "cn=!J:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no && dsmod group "cn=!gg1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "cn=!J:*-=!,!ouc!dc=!domaine!,dc=!srv!" ) else (set ereur)|| dsadd user "cn=!J:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no
    echo %%K | find /i "user-" >nul && if "%%J"=="-" ( dsadd user "cn=!K:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no && dsmod group "cn=!gg1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "cn=!K:*-=!,!ouc!dc=!domaine!,dc=!srv!" ) else (set ereur)|| dsadd user "cn=!K:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no
    echo %%L | find /i "user-" >nul && if "%%K"=="-" ( dsadd user "cn=!L:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no && dsmod group "cn=!gg1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "cn=!L:*-=!,!ouc!dc=!domaine!,dc=!srv!" ) else (set ereur)|| dsadd user "cn=!L:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no
    echo %%M | find /i "user-" >nul && if "%%L"=="-" ( dsadd user "cn=!M:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no && dsmod group "cn=!gg1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "cn=!M:*-=!,!ouc!dc=!domaine!,dc=!srv!" ) else (set ereur)|| dsadd user "cn=!M:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no
    echo %%N | find /i "user-" >nul && if "%%M"=="-" ( dsadd user "cn=!N:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no && dsmod group "cn=!gg1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "cn=!N:*-=!,!ouc!dc=!domaine!,dc=!srv!" ) else (set ereur)|| dsadd user "cn=!N:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no
    echo %%O | find /i "user-" >nul && if "%%N"=="-" ( dsadd user "cn=!O:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no && dsmod group "cn=!gg1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "cn=!O:*-=!,!ouc!dc=!domaine!,dc=!srv!" ) else (set ereur)|| dsadd user "cn=!O:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no
    echo %%P | find /i "user-" >nul && if "%%O"=="-" ( dsadd user "cn=!P:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no && dsmod group "cn=!gg1!!ouc!dc=!domaine!,dc=!srv!" -addmbr "cn=!P:*-=!,!ouc!dc=!domaine!,dc=!srv!" ) else (set ereur)|| dsadd user "cn=!P:*-=!,!ouc!dc=!domaine!,dc=!srv!" -fn !J:*-=! -pwd P@ssw0rd -disabled no

    REM ================================================================
    REM Extraction des chemins OU pour la hiérarchie
    REM ================================================================
    for /f "tokens=1,* delims=," %%a in ("!ouc!") do (
        set "ou1=%%b"
    )

    for /f "tokens=1,2,* delims=," %%a in ("!ouc!") do (
        set "ou2=%%c"
    )

    for /f "tokens=1,2,3,* delims=," %%a in ("!ouc!") do (
        set "ou3=%%d"
    )

    for /f "tokens=1,2,3,4,* delims=," %%a in ("!ouc!") do (
        set "ou4=%%e"
    )

    for /f "tokens=1,2,3,4,5* delims=," %%a in ("!ouc!") do (
        set "ou5=%%f"
    )

    REM Affichage des valeurs pour débogage
    echo !ouc!
    echo !ou1!
    echo !ou2!
    echo !ou3!
    echo !ou4!
    echo !ou5!
)

pause