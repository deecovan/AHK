cd .
for /d %%d in (*.*) DO (
cd %%d
git pull
cd ..
)
