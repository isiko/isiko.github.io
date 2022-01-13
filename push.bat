@echo off
hugo --minify
cd isiko.github.io
git pull
git add .
git commit -m "Added more Content"
git push