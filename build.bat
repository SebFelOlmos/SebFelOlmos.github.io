@echo off
echo ========================================
echo Renderizando sitio en ingles...
echo ========================================
cd En
call quarto render
cd ..

echo ========================================
echo Renderizando sitio en espanol...
echo ========================================
cd Es
call quarto render
cd ..

echo ========================================
echo Renderizando sitio en portugues...
echo ========================================
cd Pt
call quarto render
cd ..

echo ========================================
echo Creando carpeta docs...
echo ========================================
if exist docs rmdir /s /q docs
mkdir docs

echo Copiando sitios renderizados...
xcopy /E /I /Y En\_site docs\en
xcopy /E /I /Y Es\_site docs\es
xcopy /E /I /Y Pt\_site docs\pt

echo Copiando index.html principal...
copy index.html docs\

echo.
echo ========================================
echo BUILD COMPLETADO!
echo ========================================
echo.
echo Ahora ejecuta estos comandos:
echo   git add .
echo   git commit -m "Update site"
echo   git push
echo.
echo ========================================