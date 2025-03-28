for %%I in (.) do set project=%%~nxI
set branch=initial

git init -b %branch%

git remote add origin https://github.com/deecovan/%project%.git
git remote add bucket https://dcheva@bitbucket.org/dcheva/%project%.git

git pull origin %branch%
git pull bucket %branch%

echo # %project% GitHub and BitBucket repo >> README.MD

git add -A
git commit -m "Add README.MD"

git branch --set-upstream-to=origin/%branch% %branch%

git push origin HEAD
git push bucket HEAD
