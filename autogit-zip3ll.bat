for /D %%d in (*.*) do "C:\Program Files\7-Zip\7z.exe" a -tzip -mx3 "%%d.zip" ".\%%d\*"
