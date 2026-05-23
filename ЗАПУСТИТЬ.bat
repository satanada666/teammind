@echo off
chcp 65001 >nul
echo.
echo  ⚡ TeamMind — запуск
echo  ════════════════════════════════
echo.

REM Проверяем Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo  ❌ Node.js не установлен!
    echo.
    echo  Установи с сайта: https://nodejs.org
    echo  Скачай LTS версию, установи, перезапусти этот файл.
    echo.
    pause
    exit /b 1
)

REM Проверяем API ключ
if "%ANTHROPIC_API_KEY%"=="" (
    echo  Введи свой Anthropic API ключ:
    echo  Получить: https://console.anthropic.com/settings/keys
    echo  Ключ выглядит так: sk-ant-api03-...
    echo.
    set /p ANTHROPIC_API_KEY="  Ключ: "
    echo.
)

echo  ✅ Node.js найден
echo  ✅ API ключ задан
echo  🚀 Запускаем сервер...
echo.
echo  Открой в браузере: http://localhost:3000
echo  Для остановки нажми Ctrl+C
echo.

node server.js

pause
